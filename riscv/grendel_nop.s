#
# Topological sort using an adjacency matrix. Maximum 4 nodes.
#

.data
res:
    .word -1-1-1-1
nodes:
    .byte   97
    .byte   98
    .byte   99
    .byte   100
adjacencymatrix:
    .word   6
    .word   0
    .word   0
    .word   3
visited:
    .byte 0 0 0 0
res_idx:
    .word   3

.text
    lui  sp, 0x10011
    nop
    nop
    nop
    addi sp, sp, 0
    nop
    nop
    nop
    li   fp, 0
    nop
    nop
    nop
    lasw ra, pump
    j    main
    nop
    nop
    nop

pump:
    j end
    nop
    nop
    nop

main:
    addi sp, sp, -40
    nop
    nop
    nop
    sw   ra, 36(sp)
    sw   fp, 32(sp)
    add  fp, sp, x0
    nop
    nop
    nop
    sw   x0, 24(sp)
    j    main_loop_control
    nop
    nop
    nop

main_loop_body:
    lw   t4, 24(fp)
    nop
    nop
    nop
    lasw ra, trucks
    j    is_visited
    nop
    nop
    nop

trucks:
    xori t2, t2, 1
    nop
    nop
    nop
    andi t2, t2, 0xff
    nop
    nop
    nop
    beq  t2, x0, kick
    nop
    nop
    nop
    lw   t4, 24(fp)
    nop
    nop
    nop
    lasw ra, billowy
    j    topsort
    nop
    nop
    nop

billowy:
kick:
    lw   t2, 24(fp)
    nop
    nop
    nop
    addi t2, t2, 1
    nop
    nop
    nop
    sw   t2, 24(fp)

main_loop_control:
    lw   t2, 24(fp)
    nop
    nop
    nop
    slti t2, t2, 4
    nop
    nop
    nop
    beq  t2, x0, hew
    nop
    nop
    nop
    j    main_loop_body
    nop
    nop
    nop

hew:
    sw   x0, 28(fp)
    j    welcome
    nop
    nop
    nop

wave:
    lw   t2, 28(fp)
    nop
    nop
    nop
    addi t2, t2, 1
    nop
    nop
    nop
    sw   t2, 28(fp)

welcome:
    lw   t2, 28(fp)
    nop
    nop
    nop
    slti t2, t2, 4
    nop
    nop
    nop
    xori t2, t2, 1
    nop
    nop
    nop
    beq  t2, x0, wave
    nop
    nop
    nop
    mv   t2, x0
    nop
    nop
    nop
    mv   sp, fp
    nop
    nop
    nop
    lw   ra, 36(sp)
    nop
    nop
    nop
    lw   fp, 32(sp)
    nop
    nop
    nop
    addi sp, sp, 40
    nop
    nop
    nop
    jr   ra
    nop
    nop
    nop

interest:
    lw   t4, 24(fp)
    nop
    nop
    nop
    lasw ra, new
    j    is_visited
    nop
    nop
    nop

new:
    xori t2, t2, 1
    nop
    nop
    nop
    andi t2, t2, 0x0ff
    nop
    nop
    nop
    beq  t2, x0, tasteful
    nop
    nop
    nop
    lw   t4, 24(fp)
    nop
    nop
    nop
    lasw ra, partner
    j    topsort
    nop
    nop
    nop

partner:
tasteful:
    addi t2, fp, 28
    nop
    nop
    nop
    mv   t4, t2
    nop
    nop
    nop
    lasw ra, badge
    j    next_edge
    nop
    nop
    nop

badge:
    sw   t2, 24(fp)

turkey:
    lw   t3, 24(fp)
    nop
    nop
    nop
    li   t2, -1
    nop
    nop
    nop
    beq  t3, t2, telling
    nop
    nop
    nop
    j    interest
    nop
    nop
    nop

telling:
    lasw t2, res_idx
    nop
    nop
    nop
    lw   t2, 0(t2)
    nop
    nop
    nop
    addi t4, t2, -1
    nop
    nop
    nop
    lasw t3, res_idx
    nop
    nop
    nop
    sw   t4, 0(t3)
    lasw t4, res
    nop
    nop
    nop
    slli t3, t2, 2
    nop
    nop
    nop
    srli t3, t3, 1
    nop
    nop
    nop
    srai t3, t3, 1
    nop
    nop
    nop
    slli t3, t3, 2
    nop
    nop
    nop
    xor  t6, ra, t2
    nop
    nop
    nop
    or   t6, ra, t2
    nop
    nop
    nop
    neg  t6, t6
    nop
    nop
    nop
    lasw t2, res
    nop
    nop
    nop
    addi a1, x0, -1         # a1 = 0xFFFFFFFF
    nop
    nop
    nop
    srli a1, a1, 16         # a1 = 0x0000FFFF (logical shift right 16)
    nop
    nop
    nop
    and  t6, t2, a1
    nop
    nop
    nop
    and  t6, t2, a1
    nop
    nop
    nop
    add  t2, t4, t6
    nop
    nop
    nop
    add  t2, t3, t2
    nop
    nop
    nop
    lw   t3, 48(fp)
    nop
    nop
    nop
    sw   t3, 0(t2)
    mv   sp, fp
    nop
    nop
    nop
    lw   ra, 44(sp)
    nop
    nop
    nop
    lw   fp, 40(sp)
    nop
    nop
    nop
    addi sp, sp, 48
    nop
    nop
    nop
    jr   ra
    nop
    nop
    nop

topsort:
    addi sp, sp, -48
    nop
    nop
    nop
    sw   ra, 44(sp)
    sw   fp, 40(sp)
    mv   fp, sp
    nop
    nop
    nop
    sw   t4, 48(fp)
    lw   t4, 48(fp)
    nop
    nop
    nop
    lasw ra, verse
    j    mark_visited
    nop
    nop
    nop

verse:
    addi t2, fp, 28
    nop
    nop
    nop
    lw   t5, 48(fp)
    nop
    nop
    nop
    mv   t4, t2
    nop
    nop
    nop
    lasw ra, joyous
    j    iterate_edges
    nop
    nop
    nop

joyous:
    addi t2, fp, 28
    nop
    nop
    nop
    mv   t4, t2
    nop
    nop
    nop
    lasw ra, whispering
    j    next_edge
    nop
    nop
    nop

whispering:
    sw   t2, 24(fp)
    j    turkey
    nop
    nop
    nop

iterate_edges:
    addi sp, sp, -24
    nop
    nop
    nop
    sw   fp, 20(sp)
    mv   fp, sp
    nop
    nop
    nop
    sub  t6, fp, sp
    nop
    nop
    nop
    sw   t4, 24(fp)
    sw   t5, 28(fp)
    lw   t2, 28(fp)
    nop
    nop
    nop
    sw   t2, 8(fp)
    sw   x0, 12(fp)
    lw   t2, 24(fp)
    nop
    nop
    nop
    lw   t4, 8(fp)
    nop
    nop
    nop
    lw   t3, 12(fp)
    nop
    nop
    nop
    sw   t4, 0(t2)
    sw   t3, 4(t2)
    lw   t2, 24(fp)
    nop
    nop
    nop
    mv   sp, fp
    nop
    nop
    nop
    lw   fp, 20(sp)
    nop
    nop
    nop
    addi sp, sp, 24
    nop
    nop
    nop
    jr   ra
    nop
    nop
    nop

next_edge:
    addi sp, sp, -32
    nop
    nop
    nop
    sw   ra, 28(sp)
    sw   fp, 24(sp)
    add  fp, x0, sp
    nop
    nop
    nop
    sw   t4, 32(fp)
    j    waggish
    nop
    nop
    nop

snail:
    lw   t2, 32(fp)
    nop
    nop
    nop
    lw   t3, 0(t2)
    nop
    nop
    nop
    lw   t2, 32(fp)
    nop
    nop
    nop
    lw   t2, 4(t2)
    nop
    nop
    nop
    mv   t5, t2
    nop
    nop
    nop
    mv   t4, t3
    nop
    nop
    nop
    lasw ra, induce
    j    has_edge
    nop
    nop
    nop

induce:
    beq  t2, x0, quarter
    nop
    nop
    nop
    lw   t2, 32(fp)
    nop
    nop
    nop
    lw   t2, 4(t2)
    nop
    nop
    nop
    addi t4, t2, 1
    nop
    nop
    nop
    lw   t3, 32(fp)
    nop
    nop
    nop
    sw   t4, 4(t3)
    j    cynical
    nop
    nop
    nop

quarter:
    lw   t2, 32(fp)
    nop
    nop
    nop
    lw   t2, 4(t2)
    nop
    nop
    nop
    addi t3, t2, 1
    nop
    nop
    nop
    lw   t2, 32(fp)
    nop
    nop
    nop
    sw   t3, 4(t2)

waggish:
    lw   t2, 32(fp)
    nop
    nop
    nop
    lw   t2, 4(t2)
    nop
    nop
    nop
    slti t2, t2, 4
    nop
    nop
    nop
    beq  t2, x0, mark
    nop
    nop
    nop
    j    snail
    nop
    nop
    nop

mark:
    li   t2, -1
    nop
    nop
    nop

cynical:
    mv   sp, fp
    nop
    nop
    nop
    lw   ra, 28(sp)
    nop
    nop
    nop
    lw   fp, 24(sp)
    nop
    nop
    nop
    addi sp, sp, 32
    nop
    nop
    nop
    jr   ra
    nop
    nop
    nop

has_edge:
    addi sp, sp, -32
    nop
    nop
    nop
    sw   fp, 28(sp)
    mv   fp, sp
    nop
    nop
    nop
    sw   t4, 32(fp)
    sw   t5, 36(fp)
    lasw t2, adjacencymatrix
    nop
    nop
    nop
    lw   t3, 32(fp)
    nop
    nop
    nop
    slli t3, t3, 2
    nop
    nop
    nop
    add  t2, t3, t2
    nop
    nop
    nop
    lw   t2, 0(t2)
    nop
    nop
    nop
    sw   t2, 16(fp)
    li   t2, 1
    nop
    nop
    nop
    sw   t2, 8(fp)
    sw   x0, 12(fp)
    j    measley
    nop
    nop
    nop

look:
    lw   t2, 8(fp)
    nop
    nop
    nop
    slli t2, t2, 1
    nop
    nop
    nop
    sw   t2, 8(fp)
    lw   t2, 12(fp)
    nop
    nop
    nop
    addi t2, t2, 1
    nop
    nop
    nop
    sw   t2, 12(fp)

measley:
    lw   t3, 12(fp)
    nop
    nop
    nop
    lw   t2, 36(fp)
    nop
    nop
    nop
    slt  t2, t3, t2
    nop
    nop
    nop
    beq  t2, x0, experience
    nop
    nop
    nop
    j    look
    nop
    nop
    nop

experience:
    lw   t3, 8(fp)
    nop
    nop
    nop
    lw   t2, 16(fp)
    nop
    nop
    nop
    and  t2, t3, t2
    nop
    nop
    nop
    slt  t2, x0, t2
    nop
    nop
    nop
    andi t2, t2, 0xff
    nop
    nop
    nop
    mv   sp, fp
    nop
    nop
    nop
    lw   fp, 28(sp)
    nop
    nop
    nop
    addi sp, sp, 32
    nop
    nop
    nop
    jr   ra
    nop
    nop
    nop

mark_visited:
    addi sp, sp, -32
    nop
    nop
    nop
    sw   fp, 28(sp)
    mv   fp, sp
    nop
    nop
    nop
    sw   t4, 32(fp)
    li   t2, 1
    nop
    nop
    nop
    sw   t2, 8(fp)
    sw   x0, 12(fp)
    j    recast
    nop
    nop
    nop

example:
    lw   t2, 8(fp)
    nop
    nop
    nop
    slli t2, t2, 8
    nop
    nop
    nop
    sw   t2, 8(fp)
    lw   t2, 12(fp)
    nop
    nop
    nop
    addi t2, t2, 1
    nop
    nop
    nop
    sw   t2, 12(fp)

recast:
    lw   t3, 12(fp)
    nop
    nop
    nop
    lw   t2, 32(fp)
    nop
    nop
    nop
    slt  t2, t3, t2
    nop
    nop
    nop
    beq  t2, x0, pat
    nop
    nop
    nop
    j    example
    nop
    nop
    nop

pat:
    lasw t2, visited
    nop
    nop
    nop
    sw   t2, 16(fp)
    lw   t2, 16(fp)
    nop
    nop
    nop
    lw   t3, 0(t2)
    nop
    nop
    nop
    lw   t2, 8(fp)
    nop
    nop
    nop
    or   t3, t3, t2
    nop
    nop
    nop
    lw   t2, 16(fp)
    nop
    nop
    nop
    sw   t3, 0(t2)
    mv   sp, fp
    nop
    nop
    nop
    lw   fp, 28(sp)
    nop
    nop
    nop
    addi sp, sp, 32
    nop
    nop
    nop
    jr   ra
    nop
    nop
    nop

is_visited:
    addi sp, sp, -32
    nop
    nop
    nop
    sw   fp, 28(sp)
    mv   fp, sp
    nop
    nop
    nop
    sw   t4, 32(fp)
    ori  t2, x0, 1
    nop
    nop
    nop
    sw   t2, 8(fp)
    sw   x0, 12(fp)
    j    evasive
    nop
    nop
    nop

justify:
    lw   t2, 8(fp)
    nop
    nop
    nop
    slli t2, t2, 8
    nop
    nop
    nop
    sw   t2, 8(fp)
    lw   t2, 12(fp)
    nop
    nop
    nop
    addi t2, t2, 1
    nop
    nop
    nop
    sw   t2, 12(fp)

evasive:
    lw   t3, 12(fp)
    nop
    nop
    nop
    lw   t2, 32(fp)
    nop
    nop
    nop
    slt  t2, t3, t2
    nop
    nop
    nop
    beq  t2, x0, representative
    nop
    nop
    nop
    j    justify
    nop
    nop
    nop

representative:
    lasw t2, visited
    nop
    nop
    nop
    lw   t2, 0(t2)
    nop
    nop
    nop
    sw   t2, 16(fp)
    lw   t3, 16(fp)
    nop
    nop
    nop
    lw   t2, 8(fp)
    nop
    nop
    nop
    and  t2, t3, t2
    nop
    nop
    nop
    slt  t2, x0, t2
    nop
    nop
    nop
    andi t2, t2, 0xff
    nop
    nop
    nop
    mv   sp, fp
    nop
    nop
    nop
    lw   fp, 28(sp)
    nop
    nop
    nop
    addi sp, sp, 32
    nop
    nop
    nop
    jr   ra
    nop
    nop
    nop

end:
    wfi
