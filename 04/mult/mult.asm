// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Put your code here.
//按照老師課堂上講的，先將R0*R1=R2用C先試著寫出來
// 令R0 = a
// 令R1 = b
// 令R2 = sum
// R2=0
// while(a>0)
// {
//   sum += b
//   a-- 
// }

@R0
D=M
@a
M=D	// 令R0 = a

@R1
D=M
@b
M=D	// 令R1 = b

@0
D=A
@R2
D=M	
@sum
M=D	// 令R2 = sum

(WHILE)
	@a
	D=M	
	@END
	D;JLE	// if a <= 0 END      
	
	@b
	D=M	// D = y
	@sum
	M=D+M	// sum = sum + b
	@1
	D=A	// D = 1
	@a
	M=M-D	// a = a - 1	

	@WHILE
	0;JMP	// if a>0 重新回到while迴圈
(END)	
	@END
	0;JMP	
