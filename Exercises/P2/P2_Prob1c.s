#--------------------------------------------------------------------------------------------------+
# Exercise 3|Calculate the second hex algarism of the constant 824                                 |
#           |                                                                                      |
#--------------------------------------------------------------------------------------------------+
# Author: Joao Barreiros C. Rodrigues (Joao-Ex-Machina)                                            |
# Date: 15 March 2021                                                                              |
#-------------------------------------------------------------------------------------------------*/
addi x10, x10, 824
addi x11, x11, 15 #define integer register 11 as F

srli x10 x10 4 #shift right the first hex algarism
and x10 x10 x11 


