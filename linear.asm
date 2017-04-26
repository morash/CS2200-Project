# linear.asm
# CS2200 - Spring 2017
# Authors:
#  Michael Morash
#  Jansen Morby

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


#####
# VectorPrint3D
#
# Given the address of a vector in memory, print it
#   to the console. All vectors consist of 3 32-bit values.
#   output example: (12, -7, 6)
#
# parameters
#     $a0 - address of the vector to print
#
# return values
#     none
#
# side effects
#     console output
#
#####
