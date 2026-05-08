# Proj1_mergesort_sw.s
# Uses lasw ra, label + j instead of jal to avoid delay slot issues

.data
array:  .word 95, 3, 47, 82, 16, 63, 29, 71
        .word 58, 14, 90, 37, 5, 78, 42, 61
        .word 88, 23, 55, 11, 74, 33, 67, 8
        .word 49, 86, 20, 44, 99, 2, 70, 38
N:      .word 32
temp:   .word 0, 0, 0, 0, 0, 0, 0, 0
        .word 0, 0, 0, 0, 0, 0, 0, 0
        .word 0, 0, 0, 0, 0, 0, 0, 0
        .word 0, 0, 0, 0, 0, 0, 0, 0

.text
.globl main

main:
    lui sp, 0x10011
    nop
    nop
    nop
    addi sp, sp, 0
    nop
    nop
    nop
    lasw a0, array
    addi a1, x0, 0
    nop
    nop
    nop
    addi a2, x0, 31
    nop
    nop
    nop
    lasw ra, main_ret
    j merge_sort
    nop
    nop
    nop
main_ret:
    li a7, 10
    nop
    nop
    nop
    ecall
    wfi

merge_sort:
    addi sp, sp, -20
    nop
    nop
    nop
    sw ra, 16(sp)
    sw s0, 12(sp)
    sw s1, 8(sp)
    sw s2, 4(sp)
    sw s3, 0(sp)
    addi s0, a0, 0
    nop
    nop
    nop
    addi s1, a1, 0
    nop
    nop
    nop
    addi s2, a2, 0
    nop
    nop
    nop
    bge s1, s2, ms_return
    nop
    nop
    nop
    sub t0, s2, s1
    nop
    nop
    nop
    srli t0, t0, 1
    nop
    nop
    nop
    add s3, s1, t0
    nop
    nop
    nop
    addi a0, s0, 0
    nop
    nop
    nop
    addi a1, s1, 0
    nop
    nop
    nop
    addi a2, s3, 0
    nop
    nop
    nop
    lasw ra, ms_ret1
    j merge_sort
    nop
    nop
    nop
ms_ret1:
    addi a0, s0, 0
    nop
    nop
    nop
    addi a1, s3, 1
    nop
    nop
    nop
    addi a2, s2, 0
    nop
    nop
    nop
    lasw ra, ms_ret2
    j merge_sort
    nop
    nop
    nop
ms_ret2:
    addi a0, s0, 0
    nop
    nop
    nop
    addi a1, s1, 0
    nop
    nop
    nop
    addi a2, s3, 0
    nop
    nop
    nop
    addi a3, s2, 0
    nop
    nop
    nop
    lasw ra, ms_ret3
    j merge
    nop
    nop
    nop
ms_ret3:

ms_return:
    lw ra, 16(sp)
    nop
    nop
    nop
    lw s0, 12(sp)
    nop
    nop
    nop
    lw s1, 8(sp)
    nop
    nop
    nop
    lw s2, 4(sp)
    nop
    nop
    nop
    lw s3, 0(sp)
    nop
    nop
    nop
    addi sp, sp, 20
    nop
    nop
    nop
    jr ra
    nop
    nop
    nop

merge:
    addi sp, sp, -28
    nop
    nop
    nop
    sw ra, 24(sp)
    sw s0, 20(sp)
    sw s1, 16(sp)
    sw s2, 12(sp)
    sw s3, 8(sp)
    sw s4, 4(sp)
    sw s5, 0(sp)
    addi s0, a0, 0
    nop
    nop
    nop
    addi s1, a1, 0
    nop
    nop
    nop
    addi s2, a2, 0
    nop
    nop
    nop
    addi s3, a3, 0
    nop
    nop
    nop
    lasw t6, temp
    addi t0, s1, 0
    nop
    nop
    nop
    addi t1, s2, 1
    nop
    nop
    nop
    addi t2, s1, 0
    nop
    nop
    nop

merge_loop:
    blt s2, t0, copy_right
    nop
    nop
    nop
    blt s3, t1, copy_left
    nop
    nop
    nop
    slli t3, t0, 2
    nop
    nop
    nop
    add t3, s0, t3
    nop
    nop
    nop
    lw t3, 0(t3)
    nop
    nop
    nop
    slli t4, t1, 2
    nop
    nop
    nop
    add t4, s0, t4
    nop
    nop
    nop
    lw t4, 0(t4)
    nop
    nop
    nop
    blt t4, t3, pick_right
    nop
    nop
    nop

pick_left:
    slli t5, t2, 2
    nop
    nop
    nop
    add t5, t6, t5
    nop
    nop
    nop
    sw t3, 0(t5)
    addi t0, t0, 1
    nop
    nop
    nop
    addi t2, t2, 1
    nop
    nop
    nop
    j merge_loop
    nop
    nop
    nop

pick_right:
    slli t5, t2, 2
    nop
    nop
    nop
    add t5, t6, t5
    nop
    nop
    nop
    sw t4, 0(t5)
    addi t1, t1, 1
    nop
    nop
    nop
    addi t2, t2, 1
    nop
    nop
    nop
    j merge_loop
    nop
    nop
    nop

copy_right:
    blt s3, t1, copy_back
    nop
    nop
    nop
    slli t3, t1, 2
    nop
    nop
    nop
    add t3, s0, t3
    nop
    nop
    nop
    lw t3, 0(t3)
    nop
    nop
    nop
    slli t5, t2, 2
    nop
    nop
    nop
    add t5, t6, t5
    nop
    nop
    nop
    sw t3, 0(t5)
    addi t1, t1, 1
    nop
    nop
    nop
    addi t2, t2, 1
    nop
    nop
    nop
    j copy_right
    nop
    nop
    nop

copy_left:
    blt s2, t0, copy_back
    nop
    nop
    nop
    slli t3, t0, 2
    nop
    nop
    nop
    add t3, s0, t3
    nop
    nop
    nop
    lw t3, 0(t3)
    nop
    nop
    nop
    slli t5, t2, 2
    nop
    nop
    nop
    add t5, t6, t5
    nop
    nop
    nop
    sw t3, 0(t5)
    addi t0, t0, 1
    nop
    nop
    nop
    addi t2, t2, 1
    nop
    nop
    nop
    j copy_left
    nop
    nop
    nop

copy_back:
    addi t0, s1, 0
    nop
    nop
    nop

copy_back_loop:
    blt s3, t0, merge_done
    nop
    nop
    nop
    slli t3, t0, 2
    nop
    nop
    nop
    add t4, t6, t3
    nop
    nop
    nop
    lw t4, 0(t4)
    nop
    nop
    nop
    add t5, s0, t3
    nop
    nop
    nop
    sw t4, 0(t5)
    addi t0, t0, 1
    nop
    nop
    nop
    j copy_back_loop
    nop
    nop
    nop

merge_done:
    lw ra, 24(sp)
    nop
    nop
    nop
    lw s0, 20(sp)
    nop
    nop
    nop
    lw s1, 16(sp)
    nop
    nop
    nop
    lw s2, 12(sp)
    nop
    nop
    nop
    lw s3, 8(sp)
    nop
    nop
    nop
    lw s4, 4(sp)
    nop
    nop
    nop
    lw s5, 0(sp)
    nop
    nop
    nop
    addi sp, sp, 28
    nop
    nop
    nop
    jr ra
    nop
    nop
    nop
