addi x10, x10, 3
addi x11, x11, 7
addi x12, x12, 4

add x10 x10 x11
sub x10 x10 x12
slli x10 x10 3

li x17 1
ecall

li x17 10
ecall
