main:
    li n3, 0          
    li n4, 5
    li x30, 20         
    li a0, 0xCAFE;

.LBB4_21:                   # rs1   rs2   rd
    addi x30, x0, 10        #  0     0     0
    addi x30, x0, 20        #  0     0     0
    bge n3, n4, loop_end    #  1     1     0
    addi n3, n3, 1          #  1     0     1
    j loop_start   
    add  n5, x0,  n4        #  0     1     1
    addi n5, x0,  2         #  0     0     1   



loop_end:
    add  n5, x0 ,  n4        #  0     1     1
    addi n5, x0,  2         #  0     0     1
    # Exit the program  
                       