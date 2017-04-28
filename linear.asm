# linear.asm
# CS2200 - Spring 2017
# Authors:
#  Michael Morash
#  Jansen Morby
#  Joshua Savage

#####
# VectorAdd3D
#
# Given the addresses of three vectors in memory, X, A, and B,
#   sets X to A + B. All vectors consist of 3 32-bit values.
#
# parameters
#     $a0 - address of the result, X = A + B
#     $a1 - address of first vector to add, A
#     $a2 - address of second vector to add, B
#
# return values
#     none
#
# side effects
#     Value at address X is overwritten by this operation
#
#####
.text
VectorAdd3D:
	sw $ra, 0($sp)
	
	lw $t0, ($a1)
	lw $t1, 4($a1)
	lw $t2, 8($a1)
	lw $t3, ($a2)
	lw $t4, 4($a2)
	lw $t5, 8($a2)
	
	add $t0, $t0, $t3
	add $t1, $t1, $t4 
	add $t2, $t2, $t5 
	
	sw $t0, ($a0)
	sw $t1, 4($a0)
	sw $t2, 8($a0)

#####
# VectorScale3D
#
# Given the address of two vectors in memory, A, and X,
#   and a scalar multiplier S, multiplies S * A and puts
#   the result in X. All vectors consist of 3 32-bit values;
#   S is also 32 bits. No overflow detection/handling is
#   required.
#
# parameters
#     $a0 - address of the result, X
#     $a1 - address of the vector to scale, A
#     $a2 - signed scalar value, S
#
# return values
#     none
#
# side effects
#     Value at address X is overwritten by this operation
#
#####
.text
VectorScale3D:
	#load values into $t0, $t1, $t2
	lw $t0, ($a1)
	lw $t1, 4($a1)
	lw $t2, 8($a1)
	
	#multiply values by S and store in $t0, $t1, $t2
	mult $t0, $a2
	mflo $t0
	mult $t1, $a2
	mflo $t1
	mult $t2, $a2
	mflo $t2
	
	#put values into $a0
	sw $t0, ($a0)
	sw $t1, 4($a0)
	sw $t2, 8($a0)	
	
#####
# VectorDotProduct3D
#
# Given the address of two vectors in memory, A, and B,
#   computes the vector dot product, and returns the result
#   in $v0. All vectors consist of 3 32-bit values.
#   When A = (a1, a2, a3) and B = (b1, b2, b3), vector 
#   dot product is defined as (a1 * b1) + (a2 * b2) + (a3 * b3)
#
# parameters
#     $a0 - address of the first vector, A
#     $a1 - address of the second vector, B
#
# return values
#     $v0 - the vector dot product, A * B
#
# side effects
#     none
#
#####
# .text
# VectorDotProduct3D:


# subprogram: VectorPrint3D
# author: Michael Morash
# purpose: To print a 3D vector to the console
# input: $a0 - The vector to print
# returns: None
# side effects: The vector is printed to the output.
.text
VectorPrint3D:
	sw $ra, 0($sp)
	
	lw $t0, ($a0)
	lw $t1, 4($a0)
	lw $t2, 8($a0)
	
	la $a0, __openParenthesis
	move $a1, $t0
	jal PrintInt
	
	la $a0, __comma
	move $a1, $t1
	jal PrintInt
	
	la $a0, __comma
	move $a1, $t2
	jal PrintInt
	
	la $a0, __closeParenthesis
	jal PrintString
	
	lw $ra, 0($sp)
	jr $ra
.data
	__openParenthesis: .asciiz "( "
	__closeParenthesis: .asciiz " )"
	__comma: .asciiz " , "
	
	
	
