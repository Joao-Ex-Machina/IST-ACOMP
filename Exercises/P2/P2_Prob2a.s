#--------------------------------------------------------------------------------------------------+
# Exercise 5|Calculate a*128+b/4+c*8, store the result in d                                        |
#           |                  																	   |
#--------------------------------------------------------------------------------------------------+
# Author: Joao Barreiros C. Rodrigues (Joao-Ex-Machina)                                            |
# Date: 15 March 2021                                                                              |
#-------------------------------------------------------------------------------------------------*/
	.data
a: .word 3
b: .word 15
c: .word 4
d: .word 0
	.text

lw x11 a
lw x12 b
lw x13 c
li x14 0x1000000c #li x14 268435468 would also work

slli x11 x11 7
srli x12 x12 2
slli x13 x13 3
add x10 x11 x12
add x10 x10 x13
sw x10 0(x14)




li x17 1
ecall

li x17 10
ecall


