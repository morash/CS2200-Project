# linear.asm
# CS2200 - Spring 2017
# Authors:
#  Michael Morash
#  Jansen Morby
.text
  #print a vector
  la $a0, vectorP
  jal PrintVector3D
  
  #perform a vector add
  la $a0, vectorR
  la $a1, vectorP
  la $a2, vectorQ
  #jal VectorAdd3D
  
  # print the result
  la $a0, vectorAddResultText
  jal PrintString
  la $a0, vectorR
  #jal VectorPrint3D
  jal PrintNewLine
 
  #perform a vector scale
  la $a0, vectorR
  la $a1, vectorP
  addi $a2, $zero, 3
  #jal VectorScale3D
  
  #print the result
  la $a0, vectorScaleResultText
  jal PrintString
  la $a0, vectorR
  #jal VectorPrint3D
  
  #perform a vector dot product
  la $a0, vectorR
  la $a1, vectorP
  #jal VectorDotProduct3D
  move $s0, $v0
  
  #print the result
  #jal PrintNewLine
  la $a0, vectorDotProductResultText
  move $a1, $s0
  #jal PrintInt
  
  jal Exit

.data
  .align 3
  vectorP: 
    .word  5 
    .word -2 
    .word  4
  vectorQ: 
    .word -3 
    .word -1 
    .word 11  
  vectorR: .space 12 #space for 12 bytes = 3 words
  
  vectorAddResultText: .asciiz "Result of vector Add: "
  vectorScaleResultText: .asciiz "Result of vector Scale: "
  vectorDotProductResultText: .asciiz "Result of vector dot product: "

.include "linear.asm"
.include "utils.asm"
