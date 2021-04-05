
#--------------------------------------------------------------------------------------------------+
# Exercise 1|Port the following code from C to Assembly:                                           |
#           |if(x> 10){if(y< 1)x-= 10;} else{x+= 10;}                                              |
#--------------------------------------------------------------------------------------------------+
# Author: Joao Barreiros C. Rodrigues (Joao-Ex-Machina)                                            |
# Date: 05 April 2021                                                                              |
#-------------------------------------------------------------------------------------------------*/
.data
x: .word 11
y: .word 0
.text
la x10, x #initialize x store register
lw x10, 0(x10)
la x11, y #initialize y store register
lw x11, 0(x11)
la x12, x #initialize x pointer register
li x13, 10 #initialize comparing and sum register
li x14, 1 #initialize comparing register

if_x: bgt x10 x13 if_y
j else_x

if_y:bge x11 x14 end #define the second if through the complementary condition
sub x10 x10 x13
sw x10, 0(x12)
j end

else_x:
add x10 x10 x13
sw x10, 0(x12)
j end 

end:
