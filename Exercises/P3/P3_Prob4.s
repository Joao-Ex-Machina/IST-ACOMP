
#--------------------------------------------------------------------------------------------------+
# Exercise 4|Switch the contents of two registers using the stack                                  |
#           |                                                                                      |
#--------------------------------------------------------------------------------------------------+
# Author: Joao Barreiros C. Rodrigues (Joao-Ex-Machina)                                            |
# Date: 05 April 2021                                                                              |
#-------------------------------------------------------------------------------------------------*/
.data
value1: .word 3
value2: .word 2
.text
la x10 value1 #initialize storing register 1
lw x10 0(x10)
la x11 value2 #initialize storing register 2
lw x11 0(x11)

addi sp sp -4 #memory allocation on the stack
sw x10 4(sp)  #store the register contents on the stack
sw x11 0(sp)
lw x10 0(sp)  #switch the register contents through the stack
lw x11 4(sp)
addi sp sp 4 #free allocated stack memory

