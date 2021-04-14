#--------------------------------------------------------------------------------------------------+
# Laboratory 2|Calculate the truth table of the expression (a XOR b) and (a or c).                 |
#             |                                                                                    |
#--------------------------------------------------------------------------------------------------+
# Author: Joao Barreiros C. Rodrigues (Joao-Ex-Machina), Martim Rendeiro Bento (G05B3)             |
# Date: 14 April 2021                                                                              |
#-------------------------------------------------------------------------------------------------*/
    .data

a:    .word 0 #LSB
b:    .word 0 
c:    .word 0 #MSB

    .text
li x24, 1 #initialize counter register
cicle:
li x25, 9
la x26, a #initialize variable pointer registers
la x27, b
la, x5, c

li x28, 0
addi x28, x24, -5
blt x28, zero, czero #for the first four numbers MSB=0
li x28, 1
sw x28, 0(x5)
czero:
li x28, 2
rem x28, x24, x28 #for all even numbers the LSB = 0 
xori x28, x28, 1 #adjust a since 000 is taken as the the first cicle and not cicle zero
sw x28, 0(x26)

#B=1 from 010 (3rd cicle) until it 100 (5th cicle).
li x28, 3 
bne x28, x24, not3
li x28, 1
sw x28, 0(x27)
not3:
li x28, 5
bne x28, x24, not5
li x28, 0
sw x28, 0(x27)
not5:
#B=1 from 110 (7th cicle) until the end
li x28, 7
bne x28, x24, not7
li x28, 1
sw x28, 0(x27)
not7:
addi x24, x24, 1
jal x0, rede_neuronal_xor



rede_neuronal_xor:
lw x3, a
lw x4, b
li x14, 2
li x15, -2
li x16, -1
jal neuronio
mv x20, x19
li x14, -2
li x15, 2
li x16, -1
jal neuronio
li x14, 2
li x15, 2
li x16, -1
mv x3, x20
mv x4, x19
jal neuronio #a xor b
mv x23, x19
li x14, 2
li x15, 2
li x16, -1
lw x3, a
lw x4, c
jal neuronio #a or c
li x14, 1
li x15, 1
li x16, -2
mv x3, x23
mv x4, x19
jal neuronio # (a xor b) and (a or c)
jal x0, end

neuronio:
mv x22, x1 #save intial ra
addi sp, sp, -8
sw x3, 4(sp)
sw x14, 0(sp)
jal multiplica
lw x18, 0(sp)
addi sp, sp, 4
addi sp, sp, -8
sw x4, 4(sp)
sw x15, 0(sp)
jal multiplica
lw x19, 0(sp)
addi sp, sp, 4
mv x12, x16
add x19, x19, x18
add x19, x19, x16
mv x1, x22 #reload inital ra
blt x19, zero, null
li x19, 1
jalr x0, x1, 0
null:
li x19, 0
jalr x0, x1, 0

multiplica:
li x12, 0 
li x13, 0
lw x11, 0(sp)
lw x10, 4(sp)
addi sp sp 8
blt x11, zero, negative
while:
add x13, x13, x10
addi x12, x12, 1
blt x12, x11, while
addi sp, sp, -4
sw x13, 0(sp)
jalr x0, x1, 0
negative:
sub x13, x13, x10
addi x12, x12, -1
bge x12, x11, negative
addi sp, sp, -4
sw x13, 0(sp)
jalr x0, x1, 0

end:
mv x10, x19
li x17, 1
ecall
blt x24, x25, cicle #while x24 < 9 restart
li x17, 10
ecall
