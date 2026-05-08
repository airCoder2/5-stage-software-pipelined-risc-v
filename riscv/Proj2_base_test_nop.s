# Proj1_base_test_sw.s - OPTIMIZED
.text
.globl _start
_start:
    addi x1, x0, 10
    addi x2, x0, 5
    nop
    nop
    nop
    add x3, x1, x2
    sub x4, x1, x2
    and x5, x1, x2
    or x6, x1, x2
    xor x7, x1, x2
    andi x8, x1, 3
    ori x9, x1, 3
    xori x10, x1, 3
    slt x11, x2, x1
    slti x12, x2, 10
    sltiu x13, x2, -1
    sll x14, x2, x2
    srl x15, x1, x2
    sra x16, x1, x2
    slli x17, x2, 2
    srli x18, x1, 1
    srai x19, x1, 1
    lui x20, 0x12345
    auipc x21, 0
    lasw x22, data
    nop                     # wait for x22 (1)
    nop                     # wait for x22 (2)
    nop                     # wait for x22 (3)
    sw x3, 0(x22)
    lw x23, 0(x22)
    nop
    nop
    nop
    lb x24, 0(x22)
    nop
    nop
    nop
    lh x25, 0(x22)
    nop
    nop
    nop
    lbu x26, 0(x22)
    nop
    nop
    nop
    lhu x27, 0(x22)
    nop
    nop
    nop
    wfi

.data
data: .word 0
