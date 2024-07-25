	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p1_f2p2_d2p2_zicsr2p0"
	.file	"q_sort.c"
	.option	push
	.option	arch, +a, +c, +m
	.globl	swap                            # -- Begin function swap
	.p2align	1
	.type	swap,@function
swap:                                   # @swap
# %bb.0:
	lw	a2, 0(a1)
	lw	a3, 0(a0)
	sw	a2, 0(a0)
	sw	a3, 0(a1)
	ret
.Lfunc_end0:
	.size	swap, .Lfunc_end0-swap
                                        # -- End function
	.option	pop
	.option	push
	.option	arch, +a, +c, +m
	.globl	partition                       # -- Begin function partition
	.p2align	1
	.type	partition,@function
partition:                              # @partition
# %bb.0:
	slli	a3, a2, 2
	add	a7, a0, a3
	lw	a6, 0(a7)
	addi	a4, a1, -1
	bge	a1, a2, .LBB1_6
# %bb.1:
	slli	a1, a1, 2
	add	a1, a1, a0
	j	.LBB1_3
.LBB1_2:                                #   in Loop: Header=BB1_3 Depth=1
	addi	a1, a1, 4
	beq	a1, a7, .LBB1_5
.LBB1_3:                                # =>This Inner Loop Header: Depth=1
	lw	a2, 0(a1)
	bge	a2, a6, .LBB1_2
# %bb.4:                                #   in Loop: Header=BB1_3 Depth=1
	addiw	a4, a4, 1
	slli	a5, a4, 2
	add	a5, a5, a0
	lw	a3, 0(a5)
	sw	a2, 0(a5)
	sw	a3, 0(a1)
	j	.LBB1_2
.LBB1_5:
	lw	a6, 0(a7)
.LBB1_6:
	addiw	a1, a4, 1
	slli	a2, a1, 2
	add	a0, a0, a2
	lw	a2, 0(a0)
	sw	a6, 0(a0)
	sw	a2, 0(a7)
	mv	a0, a1
	ret
.Lfunc_end1:
	.size	partition, .Lfunc_end1-partition
                                        # -- End function
	.option	pop
	.option	push
	.option	arch, +a, +c, +m
	.globl	quickSort                       # -- Begin function quickSort
	.p2align	1
	.type	quickSort,@function
quickSort:                              # @quickSort
# %bb.0:
	bge	a1, a2, .LBB2_8
# %bb.1:
	addi	sp, sp, -48
	sd	ra, 40(sp)                      # 8-byte Folded Spill
	regsw  x0, x1, x0
	sd	x1, 32(sp)                      # 8-byte Folded Spill

	regsw  x0, x1, x0
	sd	x2, 24(sp)                      # 8-byte Folded Spill

	regsw  x0, x1, x0
	sd	x3, 16(sp)                      # 8-byte Folded Spill

	regsw  x0, x1, x0
	sd	x4, 8(sp)                       # 8-byte Folded Spill

	regsw  x1, x0, x0
	mv	x1, a2

	regsw  x1, x0, x0
	mv	x2, a0

	regsw  x1, x0, x0
	slli	x4, a2, 2

	regsw  x1, x1, x0
	add	x4, x4, a0

	j	.LBB2_3
.LBB2_2:                                #   in Loop: Header=BB2_3 Depth=1
	regsw  x0, x1, x0
	lw	a0, 0(x4)

	regsw  x0, x1, x0
	slli	a2, x3, 2

	regsw  x0, x0, x1
	add	a2, a2, x2

	lw	a3, 4(a2)
	sw	a0, 4(a2)
	regsw  x0, x0, x1
	sw	a3, 0(x4)

	regsw  x0, x1, x0
	mv	a0, x2

	regsw  x0, x1, x0
	mv	a2, x3

	call	quickSort
	regsw  x0, x1, x0
	addiw	a1, x3, 2

	regsw  x0, x0, x1
	bge	a1, x1, .LBB2_7

.LBB2_3:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB2_5 Depth 2
	regsw  x0, x1, x0
	lw	a0, 0(x4)

	regsw  x1, x0, x0
	addiw	x3, a1, -1

	slli	a2, a1, 2
	regsw  x0, x0, x1
	add	a2, a2, x2

	j	.LBB2_5
.LBB2_4:                                #   in Loop: Header=BB2_5 Depth=2
	addi	a2, a2, 4
	regsw  x0, x0, x1
	beq	a2, x4, .LBB2_2

.LBB2_5:                                #   Parent Loop BB2_3 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	lw	a3, 0(a2)
	bge	a3, a0, .LBB2_4
# %bb.6:                                #   in Loop: Header=BB2_5 Depth=2
	regsw  x1, x1, x0
	addiw	x3, x3, 1

	regsw  x0, x1, x0
	slli	a4, x3, 2

	regsw  x0, x0, x1
	add	a4, a4, x2

	lw	a5, 0(a4)
	sw	a3, 0(a4)
	sw	a5, 0(a2)
	j	.LBB2_4
.LBB2_7:
	ld	ra, 40(sp)                      # 8-byte Folded Reload
	regsw  x1, x0, x0
	ld	x1, 32(sp)                      # 8-byte Folded Reload

	regsw  x1, x0, x0
	ld	x2, 24(sp)                      # 8-byte Folded Reload

	regsw  x1, x0, x0
	ld	x3, 16(sp)                      # 8-byte Folded Reload

	regsw  x1, x0, x0
	ld	x4, 8(sp)                       # 8-byte Folded Reload

	addi	sp, sp, 48
.LBB2_8:
	ret
.Lfunc_end2:
	.size	quickSort, .Lfunc_end2-quickSort
                                        # -- End function
	.option	pop
	.option	push
	.option	arch, +a, +c, +m
	.globl	printArray                      # -- Begin function printArray
	.p2align	1
	.type	printArray,@function
printArray:                             # @printArray
# %bb.0:
	blez	a1, .LBB3_4
# %bb.1:
	addi	sp, sp, -32
	sd	ra, 24(sp)                      # 8-byte Folded Spill
	regsw  x0, x1, x0
	sd	x1, 16(sp)                      # 8-byte Folded Spill

	regsw  x0, x1, x0
	sd	x2, 8(sp)                       # 8-byte Folded Spill

	regsw  x0, x1, x0
	sd	x3, 0(sp)                       # 8-byte Folded Spill

	regsw  x1, x0, x0
	mv	x1, a0

	slli	a1, a1, 32
	srli	a1, a1, 30
	regsw  x1, x0, x0
	add	x3, a0, a1

	regsw  x1, x0, x0
	lui	x2, %hi(.L.str)

	regsw  x1, x1, x0
	addi	x2, x2, %lo(.L.str)

.LBB3_2:                                # =>This Inner Loop Header: Depth=1
	regsw  x0, x1, x0
	lw	a1, 0(x1)

	regsw  x0, x1, x0
	mv	a0, x2

	call	printf
	regsw  x1, x1, x0
	addi	x1, x1, 4

	regsw  x0, x1, x1
	bne	x1, x3, .LBB3_2

# %bb.3:
	ld	ra, 24(sp)                      # 8-byte Folded Reload
	regsw  x1, x0, x0
	ld	x1, 16(sp)                      # 8-byte Folded Reload

	regsw  x1, x0, x0
	ld	x2, 8(sp)                       # 8-byte Folded Reload

	regsw  x1, x0, x0
	ld	x3, 0(sp)                       # 8-byte Folded Reload

	addi	sp, sp, 32
.LBB3_4:
	li	a0, 10
	tail	putchar
.Lfunc_end3:
	.size	printArray, .Lfunc_end3-printArray
                                        # -- End function
	.option	pop
	.option	push
	.option	arch, +a, +c, +m
	.globl	main                            # -- Begin function main
	.p2align	1
	.type	main,@function
main:                                   # @main
# %bb.0:
	addi	sp, sp, -288
	sd	ra, 280(sp)                     # 8-byte Folded Spill
	regsw  x0, x1, x0
	sd	x1, 272(sp)                     # 8-byte Folded Spill

	regsw  x0, x1, x0
	sd	x2, 264(sp)                     # 8-byte Folded Spill

	regsw  x0, x1, x0
	sd	x3, 256(sp)                     # 8-byte Folded Spill

	lui	a1, %hi(.L__const.main.arr)
	addi	a1, a1, %lo(.L__const.main.arr)
	mv	a0, sp
	li	a2, 256
	call	memcpy
	lui	a0, %hi(.Lstr)
	addi	a0, a0, %lo(.Lstr)
	call	puts
	regsw  x1, x0, x0
	lui	x1, %hi(.L.str)

	regsw  x1, x1, x0
	addi	x1, x1, %lo(.L.str)

	li	a1, 64
	regsw  x0, x1, x0
	mv	a0, x1

	call	printf
	regsw  x1, x0, x0
	addi	x3, sp, 4

	regsw  x1, x0, x0
	addi	x2, sp, 256

.LBB4_1:                                # =>This Inner Loop Header: Depth=1
	regsw  x0, x1, x0
	lw	a1, 0(x3)

	regsw  x0, x1, x0
	mv	a0, x1

	call	printf
	regsw  x1, x1, x0
	addi	x3, x3, 4

	regsw  x0, x1, x1
	bne	x3, x2, .LBB4_1

# %bb.2:
	li	a0, 10
	call	putchar
	mv	a0, sp
	li	a2, 63
	regsw  x1, x0, x0
	mv	x3, sp

	li	a1, 0
	call	quickSort
	lui	a0, %hi(.Lstr.4)
	addi	a0, a0, %lo(.Lstr.4)
	call	puts
	regsw  x1, x0, x0
	lui	x1, %hi(.L.str)

	regsw  x1, x1, x0
	addi	x1, x1, %lo(.L.str)

.LBB4_3:                                # =>This Inner Loop Header: Depth=1
	regsw  x0, x1, x0
	lw	a1, 0(x3)

	regsw  x0, x1, x0
	mv	a0, x1

	call	printf
	regsw  x1, x1, x0
	addi	x3, x3, 4

	regsw  x0, x1, x1
	bne	x3, x2, .LBB4_3

# %bb.4:
	li	a0, 10
	call	putchar
	li	a0, 0
	ld	ra, 280(sp)                     # 8-byte Folded Reload
	regsw  x1, x0, x0
	ld	x1, 272(sp)                     # 8-byte Folded Reload

	regsw  x1, x0, x0
	ld	x2, 264(sp)                     # 8-byte Folded Reload

	regsw  x1, x0, x0
	ld	x3, 256(sp)                     # 8-byte Folded Reload

	addi	sp, sp, 288
	ret
.Lfunc_end4:
	.size	main, .Lfunc_end4-main
                                        # -- End function
	.option	pop
	.type	.L.str,@object                  # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"%d "
	.size	.L.str, 4

	.type	.L__const.main.arr,@object      # @__const.main.arr
	.section	.rodata,"a",@progbits
	.p2align	2, 0x0
.L__const.main.arr:
	.word	64                              # 0x40
	.word	34                              # 0x22
	.word	25                              # 0x19
	.word	12                              # 0xc
	.word	22                              # 0x16
	.word	11                              # 0xb
	.word	90                              # 0x5a
	.word	54                              # 0x36
	.word	87                              # 0x57
	.word	23                              # 0x17
	.word	78                              # 0x4e
	.word	56                              # 0x38
	.word	99                              # 0x63
	.word	1                               # 0x1
	.word	18                              # 0x12
	.word	30                              # 0x1e
	.word	45                              # 0x2d
	.word	63                              # 0x3f
	.word	72                              # 0x48
	.word	82                              # 0x52
	.word	91                              # 0x5b
	.word	4                               # 0x4
	.word	37                              # 0x25
	.word	15                              # 0xf
	.word	49                              # 0x31
	.word	6                               # 0x6
	.word	27                              # 0x1b
	.word	43                              # 0x2b
	.word	53                              # 0x35
	.word	68                              # 0x44
	.word	10                              # 0xa
	.word	36                              # 0x24
	.word	28                              # 0x1c
	.word	65                              # 0x41
	.word	77                              # 0x4d
	.word	39                              # 0x27
	.word	94                              # 0x5e
	.word	60                              # 0x3c
	.word	41                              # 0x29
	.word	74                              # 0x4a
	.word	35                              # 0x23
	.word	50                              # 0x32
	.word	31                              # 0x1f
	.word	70                              # 0x46
	.word	93                              # 0x5d
	.word	16                              # 0x10
	.word	19                              # 0x13
	.word	88                              # 0x58
	.word	71                              # 0x47
	.word	20                              # 0x14
	.word	14                              # 0xe
	.word	13                              # 0xd
	.word	48                              # 0x30
	.word	5                               # 0x5
	.word	17                              # 0x11
	.word	42                              # 0x2a
	.word	84                              # 0x54
	.word	75                              # 0x4b
	.word	67                              # 0x43
	.word	55                              # 0x37
	.word	38                              # 0x26
	.word	92                              # 0x5c
	.word	8                               # 0x8
	.word	69                              # 0x45
	.size	.L__const.main.arr, 256

	.type	.Lstr,@object                   # @str
	.section	.rodata.str1.1,"aMS",@progbits,1
.Lstr:
	.asciz	"Unsorted array:"
	.size	.Lstr, 16

	.type	.Lstr.4,@object                 # @str.4
.Lstr.4:
	.asciz	"\nSorted array:"
	.size	.Lstr.4, 15

	.ident	"Ubuntu clang version 14.0.0-1ubuntu1.1"
	.section	".note.GNU-stack","",@progbits
