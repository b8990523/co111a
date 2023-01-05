// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.
//此程式為自行完成
(RESTART)
@SCREEN
D=A
@COLORSTART
M=D	//設定填色開始位置為RAM0

(KBDCHECK) //確認鍵盤是否有讀到
@KBD
D=M
@BLACK //如果有讀出鍵盤，跳轉黑色
D;JGT
@WHITE //反之，沒有則跳轉白色
0;JMP

(BLACK)
    // 設定draw的值為-1 (1111111111111111)黑色.
    @COLOR
    M=-1
    @DRAW
    0;JMP

(WHITE)
    // 設定draw的值為0 (0000000000000000)白色.
    @COLOR
    M=0
    @DRAW
    0;JMP

(DRAW) //著色迴圈 
@COLOR	
D=M	//確認要用什麼顏色填滿屏幕

@COLORSTART
A=M	
M=D	

@COLORSTART
D=M+1	//下一個位置

@KBD
D=A-D	//KBD-SCREEN=A

@COLORSTART
M=M+1	//INC TO NEXT PIXEL
A=M

@DRAW
D;JGT	//當整個屏幕填滿，跳出

@RESTART
0;JMP