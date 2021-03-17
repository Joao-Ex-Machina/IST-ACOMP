#--------------------------------------------------------------------------------------------------+
# Laboratory 1| Calculate X elements of the Fibonacci sequence, with X being defined by a static   |
#             |variable.Display said elements in the adresses from 0x10000000                      |
#--------------------------------------------------------------------------------------------------+
# Author: Joao Barreiros C. Rodrigues (Joao-Ex-Machina)                                            |
# Date: 17 March 2021                                                                              |
#-------------------------------------------------------------------------------------------------*/
	.data
element_number: .word 10
	.text
li x10, 1 #initialize counter register
li x11, 0 #initialize auxiliary storing register
li x12, 0 #initialize previous number register
li x13, 1 #initialize current number register
la x14, element_number #initialize and load comparing register
lw x14, 0 (x14)
li x15, 0x10000000 #initialize pointer register for storing elements

forloop: bge x10 x14 end #compare the counter register with the comparing register
sw x13 0(x15) 
mv x11 x13
add x13 x13 x12  #Base for Fibonacci sequence -> Element n+1 = Element n + Element n-1
mv x12 x11
addi x15 x15 0x4 #Initialize the next address to store the next element (previous address + 0x4) 
addi x10 x10 1 #Increment the counter
j forloop #Jump back to forloop
end:
