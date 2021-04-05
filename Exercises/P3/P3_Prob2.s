
#--------------------------------------------------------------------------------------------------+
# Exercise 2|Calculate the number of bits that are required to store a integer variable            |
#           |                                                                                      |
#--------------------------------------------------------------------------------------------------+
# Author: Joao Barreiros C. Rodrigues (Joao-Ex-Machina)                                            |
# Date: 05 April 2021                                                                              |
#-------------------------------------------------------------------------------------------------*/
.data
x: .word 7
bits: .word 0
.text
la x10, x #initialize x store register
lw x10, 0(x10)
la x11, bits #initialize bits store register
lw x11, 0(x11)
la x12, bits #initialize bits pointer register
li x13, 1 #initialize comparing and sum register

whileloop: ble x10 x13 end
srli x10 x10 1
addi x11 x11 1
sw x11 0(x12)
j whileloop

end: