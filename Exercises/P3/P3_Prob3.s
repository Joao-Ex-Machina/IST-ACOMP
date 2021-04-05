
#--------------------------------------------------------------------------------------------------+
# Exercise 3|Calculate the sum of n values in memory                                               |
#           |                                                                                      |
#--------------------------------------------------------------------------------------------------+
# Author: Joao Barreiros C. Rodrigues (Joao-Ex-Machina)                                            |
# Date: 05 April 2021                                                                              |
#-------------------------------------------------------------------------------------------------*/
.data
n_values: .word 8
values: .word 1,2,3,4,5,6,7,8
.text
la x10 n_values #initialize n_values counter register
lw x10 0(x10)
la x11 values #initialize values pointer register
mv x12 x0 #initialize values storing register
mv x13 x0 #initialize sum storing register

forloop: ble x10 x0 end
lw x12 0(x11)
add x13 x13 x12
addi x11 x11 0x4
addi x10 x10 -1
j forloop
end: