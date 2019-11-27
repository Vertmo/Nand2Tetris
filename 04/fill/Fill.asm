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
  @KBD
  D = M
  @BLACKEN
  D; JGT

(CLEAR)
  @SCREEN
  D=A
  @8192
  D=D+A
  @i
  M=D
(CLOOP)
  @i
  D=M-1
  M=D
  @LOOP
  D; JLT
  @i
  D=M
  @SCREEN
  A=A+D

  @i
  A=M
  M=0
  @CLOOP
  0; JMP

(BLACKEN)
  @SCREEN
  D=A
  @8192
  D=D+A
  @i
  M=D
(BLOOP)
  @i
  D=M-1
  M=D
  @LOOP
  D; JLT

  @i
  A=M
  M=-1
  @BLOOP
  0; JMP