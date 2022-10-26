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
(LOOP)
    @KBD  //keyboard
    D = M
    @BLACK 
    D; JNE
    @WHITE 
    D; JEQ 
    @LOOP 
    0; JMP 
(BLACK)
//從16384開始，屏幕規格是256*512， 每行有512/16 = 32个16位寄存器，一共有32*256=8192个  
    @SCREEN 
    D = A
    @i 
    M = D   //i的值 = 16384 
    (BLACKLOOP)
        @i 
        D = M 
        @KBD 
        D = D - A 
        @LOOP   //如果屏幕已經满了（基地址指向键盤了）  直接回去繼續讀鍵盤
        D; JEQ
        D = -1 
        @i 
        A = M     
        M = D //填满这个寄存器  但此时i中存的还是这个寄存器的地址
        D = 1 
        @i 
        D = D + M 
        M = D   
        @BLACKLOOP 
        0; JMP 
(WHITE) 
    @SCREEN 
    D = A 
    @i 
    M = D 
    (WHITELOOP)
        @i 
        D = M 
        @KBD 
        D = D - A 
        @LOOP 
        D; JEQ 
        D = 0 
        @i 
        A = M 
        M = D 
        D = 1  
        @i 
        D = D + M 
        M = D 
        @WHITELOOP
        0; JMP  
