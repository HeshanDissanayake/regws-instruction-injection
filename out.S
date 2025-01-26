main:
	regsw_c	x0, 0x0(x18)		# 100100000000000000000
    li x3, 0
    li x4, 5
    li x30, 20
    li a0, 0xCAFE;

.LBB4_21:                   # rs1   rs2   rd
    addi x30, x0, 10        #  0     0     0
    addi x30, x0, 20        #  0     0     0
	regsw_c	x1, 0x305(x15)		# 011 110 000 101 100 000 101
    bge x3, x4, loop_end    #  1     1     0
    addi x3, x3, 1          #  1     0     1
    j loop_start
    add  x5, x0,  x4        #  0     1     1
    addi x5, x0,  2         #  0     0     1



loop_end:
    add  x5, x0 ,  x4        #  0     1     1
	regsw_c	x0, 0x0(x16)		# 100000000000000000000
    addi x5, x0,  2         #  0     0     1
    # Exit the program

