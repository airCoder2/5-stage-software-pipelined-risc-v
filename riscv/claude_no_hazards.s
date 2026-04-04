lui   x1,  0x10        # x1 = 0x10000
lui   x2,  0x20        # x2 = 0x20000
lui   x3,  0x30        # x3 = 0x30000
lui   x4,  0x40        # x4 = 0x40000  <- x1 now safe to read
add   x5,  x1, x2      # x5 = x1 + x2
addi  x6,  x0, 100     # x6 = 100
addi  x7,  x0, 200     # x7 = 200
sub   x8,  x3, x4      # x8 = x3 - x4  <- x5 now safe to read
and   x9,  x5, x6      # x9 = x5 & x6
addi  x10, x0, 50      # x10 = 50
addi  x11, x0, 75      # x11 = 75
or    x12, x7, x8      # x12 = x7 | x8  <- x9 now safe to read
xor   x13, x9, x10     # x13 = x9 ^ x10
addi  x14, x0, 10      # x14 = 10
addi  x15, x0, 20      # x15 = 20
sll   x16, x6, x11     # x16 = x6 << x11 <- x13 now safe to read
sw    x13, 0(x1)       # mem[x1] = x13
addi  x17, x0, 1       # filler
addi  x18, x0, 2       # filler
lw    x19, 0(x1)       # x19 = mem[x1]  (3 cycles after sw)
srl   x20, x16, x14    # x20 = x16 >> x14o
wfi

