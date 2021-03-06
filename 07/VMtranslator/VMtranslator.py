import os
import sys


C_ARITHMETIC = "C_ARITHMETIC"
C_PUSH = "C_PUSH"
C_POP = "C_POP"
C_LABEL = "C_LABEL"
C_GOTO = "C_GOTO"
C_IF = "C_IF"
C_FUNCTION = "C_FUNCTION"
C_RETURN = "C_RETURN"
C_CALL = "C_CALL"


class Parser:
    def __init__(self, input_file_path):
        self.vmfile = open(input_file_path, "r")

        self.arithmetic_kw = ["add", "sub", "neg",
                              "eq", "gt", "lt", "and", "or", "not"]

        self.current_command = None
        self.arg_one = None
        self.arg_two = None

    def hasMoreCommands(self):
        try:
            self.current_command = next(self.vmfile)
        except StopIteration:
            return False
        return True

    def advance(self):
        self.hasMoreCommands()

    def commandType(self):
        # handle inline comments
        command = self.current_command.split("//")[0]
        parserd_command = command.strip().split()

        # C_ARITHMETIC
        if len(parserd_command) == 1 and parserd_command[0] in self.arithmetic_kw:
            self.arg_one = parserd_command[0]
            return C_ARITHMETIC

        if parserd_command[0] == "push":
            self.arg_one, self.arg_two = parserd_command[1:]
            return C_PUSH

        if parserd_command[0] == "pop":
            self.arg_one, self.arg_two = parserd_command[1:]
            return C_POP

        return None

    def arg1(self):
        if self.commandType() is not C_RETURN:
            return self.arg_one
        else:
            raise ValueError(
                "Should not be called if the current command is C_RETURN", self.current_command)

    def arg2(self):
        if self.commandType() in [C_PUSH, C_POP, C_FUNCTION, C_CALL]:
            return self.arg_two
        else:
            raise ValueError(
                "Should be called only if the current command is C_PUSH, C_POP, C_FUNCTION or C_CALL", self.current_command)


class CodeWriter:
    def __init__(self, output_file_path):
        self.writer = open(output_file_path, "w")

        self.filename = None
        self.compare_count = 0

        self.logic_mapper = {"and": "&", "or": "|", "not": "!"}

        self.c_arith2asm = {
            "add":
            """
            @SP
            AM=M-1
            D=M
            @SP
            AM=M-1
            M=D+M
            @SP
            M=M+1""",
            "sub":
            """
            @SP
            AM=M-1
            D=M
            @SP
            AM=M-1
            M=M-D
            @SP
            M=M+1""",
            "neg":
            """
            @SP
            AM=M-1
            M=-M
            @SP
            M=M+1""",
            "cp":
            """
            @SP
            AM=M-1
            D=M
            @SP
            AM=M-1
            D=M-D
            @SET_TRUE{0}
            D;J{1}
            @SP
            A=M
            M=0
            @SP_PLUS_ONE{0}
            0;JMP
            (SET_TRUE{0})
            @SP
            A=M
            M=-1
            (SP_PLUS_ONE{0})
            @SP
            M=M+1""",
            "logic":
            """
            @SP
            AM=M-1
            D=M
            @SP
            AM=M-1
            M=D{}M
            @SP
            M=M+1""",
            "not":
            """
            @SP
            AM=M-1
            M=!M
            @SP
            M=M+1"""
        }

        self.push_constant = {
            C_PUSH: """
            @{}
            D=A
            @SP
            A=M
            M=D
            @SP
            M=M+1"""
        }

        self.base_seg = {
            C_PUSH: """
            @{0}
            D=A
            @{1}
            A=D+M
            D=M
            @SP
            A=M
            M=D
            @SP
            M=M+1""",
            C_POP: """
            @{0}
            D=A
            @{1}
            D=D+M
            @i
            M=D
            @SP
            AM=M-1
            D=M
            @i
            A=M
            M=D
            """
        }

        self.temp_seg = {
            "C_PUSH": """
            @{}
            D=A
            @5
            A=D+A
            D=M
            @SP
            A=M
            M=D
            @SP
            M=M+1""",
            C_POP: """
            @{}
            D=A
            @5
            D=D+A
            @i
            M=D
            @SP
            AM=M-1
            D=M
            @i
            A=M
            M=D"""}

        self.pointer_seg = {
            "C_PUSH": """
            @{}
            D=A
            @3
            A=D+A
            D=M
            @SP
            A=M
            M=D
            @SP
            M=M+1""",
            C_POP: """
            @{}
            D=A
            @3
            D=D+A
            @i
            M=D
            @SP
            AM=M-1
            D=M
            @i
            A=M
            M=D"""}

        self.static_seg = {
            C_PUSH: """
            @{1}.{0}
            D=M
            @SP
            A=M
            M=D
            @SP
            M=M+1""",
            C_POP: """
            @SP
            AM=M-1
            D=M
            @{1}.{0}
            M=D"""
        }

        self.vmseg2symbol = {"local": "LCL",
                             "argument": "ARG", "this": "THIS", "that": "THAT"}

        self.seg2asmtpl = {
            "constant": self.push_constant,
            "local": self.base_seg,
            "argument": self.base_seg,
            "this": self.base_seg,
            "that": self.base_seg,
            "temp": self.temp_seg,
            "pointer": self.pointer_seg,
            "static": self.static_seg
        }

    def setFileName(self, fileName):
        self.filename = fileName

    def writerArithmetic(self, command):
        if command in self.c_arith2asm:
            asm_code = self.c_arith2asm[command]

        if command in ["eq", "gt", "lt"]:
            asm_code = self.c_arith2asm["cp"].format(
                self.compare_count, command.upper())
            self.compare_count += 1

        if command in ["and", "or"]:
            asm_code = self.c_arith2asm["logic"].format(
                self.logic_mapper[command])

        self.writer.write(asm_code + "\n")

    def WritePushPop(self, command, segment, index):
        asmtpl = self.seg2asmtpl[segment]
        if segment in ["constant", "temp", "pointer"]:
            params = [index]

        if segment in ["local", "argument", "this", "that"]:
            params = [index, self.vmseg2symbol[segment]]

        if segment in ["static"]:
            params = [index, self.filename]

        asm_code = asmtpl[command].format(*params)
        self.writer.write(asm_code + "\n")

    def Close(self):
        self.writer.close()


def main():
    dirpath = sys.argv[1]
    assert os.path.isdir(dirpath), "Input is not a file dir!"
    dirname = os.path.basename(dirpath)
    output_file_name = dirname + ".asm"

    # output file in the same input dir
    output_file_path = os.path.join(dirpath, output_file_name)

    input_files = [fn for fn in os.listdir(dirpath) if fn.endswith(".vm")]

    codewriter = CodeWriter(output_file_path)

    for file_name in input_files:
        file_path = os.path.join(dirpath, file_name)

        parser = Parser(file_path)

        codewriter.setFileName(file_name)

        while parser.hasMoreCommands():
            if parser.current_command in ["", "\n"]:
                continue
            if parser.current_command.startswith("//"):
                continue

            codewriter.writer.write("//" + parser.current_command)

            if parser.commandType() is C_ARITHMETIC:
                codewriter.writerArithmetic(parser.arg1())

            if parser.commandType() in [C_PUSH, C_POP]:
                codewriter.WritePushPop(
                    parser.commandType(), parser.arg1(), parser.arg2())

    codewriter.Close()

    print("Translate success!")


if __name__ == "__main__":
    main()
