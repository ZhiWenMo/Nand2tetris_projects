
        
            @256
            D=A
            @SP
            M=D

        
            @Sys.init$ret.0
            D=A
            @SP
            A=M
            M=D
            @SP
            M=M+1

            @LCL
            D=M
            @SP
            A=M
            M=D
            @SP
            M=M+1

            @ARG
            D=M
            @SP
            A=M
            M=D
            @SP
            M=M+1

            @THIS
            D=M
            @SP
            A=M
            M=D
            @SP
            M=M+1

            @THAT
            D=M
            @SP
            A=M
            M=D
            @SP
            M=M+1

            @0
            D=A
            @5
            D=A+D
            @SP
            D=M-D
            @ARG
            M=D

            @SP
            D=M
            @LCL
            M=D

            @Sys.init
            0;JMP

            (Sys.init$ret.0)
//function Class1.set 0

            (Class1.set)
//push argument 0

            @0
            D=A
            @ARG
            A=D+M
            D=M
            @SP
            A=M
            M=D
            @SP
            M=M+1
//pop static 0


            @SP
            AM=M-1
            D=M
            @Class1.vm.0
            M=D
//push argument 1

            @1
            D=A
            @ARG
            A=D+M
            D=M
            @SP
            A=M
            M=D
            @SP
            M=M+1
//pop static 1


            @SP
            AM=M-1
            D=M
            @Class1.vm.1
            M=D
//push constant 0

            @0
            D=A
            @SP
            A=M
            M=D
            @SP
            M=M+1
//return

            @LCL
            D=M
            @R13
            M=D
            @5
            A=D-A
            D=M
            @R14
            M=D
            @SP
            AM=M-1
            D=M
            @ARG
            A=M
            M=D
            @ARG
            D=M+1
            @SP
            M=D
            @R13
            D=M-1
            AM=D
            D=M
            @THAT
            M=D
            @R13
            D=M-1
            AM=D
            D=M
            @THIS
            M=D
            @R13
            D=M-1
            AM=D
            D=M
            @ARG
            M=D
            @R13
            D=M-1
            AM=D
            D=M
            @LCL
            M=D
            @R14
            A=M
            0;JMP
//function Class1.get 0

            (Class1.get)
//push static 0

            @Class1.vm.0
            D=M
            @SP
            A=M
            M=D
            @SP
            M=M+1
//push static 1

            @Class1.vm.1
            D=M
            @SP
            A=M
            M=D
            @SP
            M=M+1
//sub

            @SP
            AM=M-1
            D=M
            @SP
            AM=M-1
            M=M-D
            @SP
            M=M+1
//return

            @LCL
            D=M
            @R13
            M=D
            @5
            A=D-A
            D=M
            @R14
            M=D
            @SP
            AM=M-1
            D=M
            @ARG
            A=M
            M=D
            @ARG
            D=M+1
            @SP
            M=D
            @R13
            D=M-1
            AM=D
            D=M
            @THAT
            M=D
            @R13
            D=M-1
            AM=D
            D=M
            @THIS
            M=D
            @R13
            D=M-1
            AM=D
            D=M
            @ARG
            M=D
            @R13
            D=M-1
            AM=D
            D=M
            @LCL
            M=D
            @R14
            A=M
            0;JMP
//function Sys.init 0

            (Sys.init)
//push constant 6

            @6
            D=A
            @SP
            A=M
            M=D
            @SP
            M=M+1
//push constant 8

            @8
            D=A
            @SP
            A=M
            M=D
            @SP
            M=M+1
//call Class1.set 2

        
            @Class1.set$ret.0
            D=A
            @SP
            A=M
            M=D
            @SP
            M=M+1

            @LCL
            D=M
            @SP
            A=M
            M=D
            @SP
            M=M+1

            @ARG
            D=M
            @SP
            A=M
            M=D
            @SP
            M=M+1

            @THIS
            D=M
            @SP
            A=M
            M=D
            @SP
            M=M+1

            @THAT
            D=M
            @SP
            A=M
            M=D
            @SP
            M=M+1

            @2
            D=A
            @5
            D=A+D
            @SP
            D=M-D
            @ARG
            M=D

            @SP
            D=M
            @LCL
            M=D

            @Class1.set
            0;JMP

            (Class1.set$ret.0)
//pop temp 0 

            @0
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
            M=D
//push constant 23

            @23
            D=A
            @SP
            A=M
            M=D
            @SP
            M=M+1
//push constant 15

            @15
            D=A
            @SP
            A=M
            M=D
            @SP
            M=M+1
//call Class2.set 2

        
            @Class2.set$ret.0
            D=A
            @SP
            A=M
            M=D
            @SP
            M=M+1

            @LCL
            D=M
            @SP
            A=M
            M=D
            @SP
            M=M+1

            @ARG
            D=M
            @SP
            A=M
            M=D
            @SP
            M=M+1

            @THIS
            D=M
            @SP
            A=M
            M=D
            @SP
            M=M+1

            @THAT
            D=M
            @SP
            A=M
            M=D
            @SP
            M=M+1

            @2
            D=A
            @5
            D=A+D
            @SP
            D=M-D
            @ARG
            M=D

            @SP
            D=M
            @LCL
            M=D

            @Class2.set
            0;JMP

            (Class2.set$ret.0)
//pop temp 0 

            @0
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
            M=D
//call Class1.get 0

        
            @Class1.get$ret.0
            D=A
            @SP
            A=M
            M=D
            @SP
            M=M+1

            @LCL
            D=M
            @SP
            A=M
            M=D
            @SP
            M=M+1

            @ARG
            D=M
            @SP
            A=M
            M=D
            @SP
            M=M+1

            @THIS
            D=M
            @SP
            A=M
            M=D
            @SP
            M=M+1

            @THAT
            D=M
            @SP
            A=M
            M=D
            @SP
            M=M+1

            @0
            D=A
            @5
            D=A+D
            @SP
            D=M-D
            @ARG
            M=D

            @SP
            D=M
            @LCL
            M=D

            @Class1.get
            0;JMP

            (Class1.get$ret.0)
//call Class2.get 0

        
            @Class2.get$ret.0
            D=A
            @SP
            A=M
            M=D
            @SP
            M=M+1

            @LCL
            D=M
            @SP
            A=M
            M=D
            @SP
            M=M+1

            @ARG
            D=M
            @SP
            A=M
            M=D
            @SP
            M=M+1

            @THIS
            D=M
            @SP
            A=M
            M=D
            @SP
            M=M+1

            @THAT
            D=M
            @SP
            A=M
            M=D
            @SP
            M=M+1

            @0
            D=A
            @5
            D=A+D
            @SP
            D=M-D
            @ARG
            M=D

            @SP
            D=M
            @LCL
            M=D

            @Class2.get
            0;JMP

            (Class2.get$ret.0)
//label WHILE

            (Sys.init$WHILE)
//goto WHILE

            @Sys.init$WHILE
            0;JMP
//function Class2.set 0

            (Class2.set)
//push argument 0

            @0
            D=A
            @ARG
            A=D+M
            D=M
            @SP
            A=M
            M=D
            @SP
            M=M+1
//pop static 0


            @SP
            AM=M-1
            D=M
            @Class2.vm.0
            M=D
//push argument 1

            @1
            D=A
            @ARG
            A=D+M
            D=M
            @SP
            A=M
            M=D
            @SP
            M=M+1
//pop static 1


            @SP
            AM=M-1
            D=M
            @Class2.vm.1
            M=D
//push constant 0

            @0
            D=A
            @SP
            A=M
            M=D
            @SP
            M=M+1
//return

            @LCL
            D=M
            @R13
            M=D
            @5
            A=D-A
            D=M
            @R14
            M=D
            @SP
            AM=M-1
            D=M
            @ARG
            A=M
            M=D
            @ARG
            D=M+1
            @SP
            M=D
            @R13
            D=M-1
            AM=D
            D=M
            @THAT
            M=D
            @R13
            D=M-1
            AM=D
            D=M
            @THIS
            M=D
            @R13
            D=M-1
            AM=D
            D=M
            @ARG
            M=D
            @R13
            D=M-1
            AM=D
            D=M
            @LCL
            M=D
            @R14
            A=M
            0;JMP
//function Class2.get 0

            (Class2.get)
//push static 0

            @Class2.vm.0
            D=M
            @SP
            A=M
            M=D
            @SP
            M=M+1
//push static 1

            @Class2.vm.1
            D=M
            @SP
            A=M
            M=D
            @SP
            M=M+1
//sub

            @SP
            AM=M-1
            D=M
            @SP
            AM=M-1
            M=M-D
            @SP
            M=M+1
//return

            @LCL
            D=M
            @R13
            M=D
            @5
            A=D-A
            D=M
            @R14
            M=D
            @SP
            AM=M-1
            D=M
            @ARG
            A=M
            M=D
            @ARG
            D=M+1
            @SP
            M=D
            @R13
            D=M-1
            AM=D
            D=M
            @THAT
            M=D
            @R13
            D=M-1
            AM=D
            D=M
            @THIS
            M=D
            @R13
            D=M-1
            AM=D
            D=M
            @ARG
            M=D
            @R13
            D=M-1
            AM=D
            D=M
            @LCL
            M=D
            @R14
            A=M
            0;JMP
