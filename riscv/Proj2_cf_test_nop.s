# Proj1_cf_test_sw.s - OPTIMIZED
.text
    lui sp, 0x10011         # writes sp
    nop
    nop
    nop                     # 3 NOPs for RAW on sp
    addi sp, sp, 0          # reads sp - safe after 3 NOPs
    li fp, 0                # no dependency
    lasw ra, done           # lasw has built in NOPs
    j main                  # jump - 3 NOPs after
    nop
    nop
    nop

done:
    j end
    nop
    nop
    nop

main:
    addi x5, x0, 3
    addi x6, x0, 7
    nop
    nop
    nop
    beq x5, x5, skip1
    nop
    nop
    nop
    addi x7, x0, 99
skip1:
    bne x5, x6, skip2
    nop
    nop
    nop
    addi x7, x0, 99
skip2:
    blt x5, x6, skip3
    nop
    nop
    nop
    addi x7, x0, 99
skip3:
    bge x6, x5, skip4
    nop
    nop
    nop
    addi x7, x0, 99
skip4:
    bltu x5, x6, skip5
    nop
    nop
    nop
    addi x7, x0, 99
skip5:
    bgeu x6, x5, skip6
    nop
    nop
    nop
    addi x7, x0, 99
skip6:
    lasw ra, after_call
    j level1
    nop
    nop
    nop

after_call:
    j end
    nop
    nop
    nop

level1:
    addi sp, sp, -4
    nop
    nop
    nop                     # 3 NOPs for RAW on sp
    sw ra, 0(sp)
    addi x10, x0, 1
    lasw ra, ret1
    j level2
    nop
    nop
    nop
ret1:
    lw ra, 0(sp)
    nop
    nop
    nop
    addi sp, sp, 4
    nop
    nop
    nop                     # 3 NOPs for RAW on sp before jr
    jr ra
    nop
    nop
    nop

level2:
    addi sp, sp, -4
    nop
    nop
    nop
    sw ra, 0(sp)
    addi x11, x0, 2
    lasw ra, ret2
    j level3
    nop
    nop
    nop
ret2:
    lw ra, 0(sp)
    nop
    nop
    nop
    addi sp, sp, 4
    nop
    nop
    nop
    jr ra
    nop
    nop
    nop

level3:
    addi sp, sp, -4
    nop
    nop
    nop
    sw ra, 0(sp)
    addi x12, x0, 3
    lasw ra, ret3
    j level4
    nop
    nop
    nop
ret3:
    lw ra, 0(sp)
    nop
    nop
    nop
    addi sp, sp, 4
    nop
    nop
    nop
    jr ra
    nop
    nop
    nop

level4:
    addi sp, sp, -4
    nop
    nop
    nop
    sw ra, 0(sp)
    addi x13, x0, 4
    lasw ra, ret4
    j level5
    nop
    nop
    nop
ret4:
    lw ra, 0(sp)
    nop
    nop
    nop
    addi sp, sp, 4
    nop
    nop
    nop
    jr ra
    nop
    nop
    nop

level5:
    addi x14, x0, 5
    jr ra
    nop
    nop
    nop

end:
    wfi
