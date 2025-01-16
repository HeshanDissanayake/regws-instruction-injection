.LBB4_20:                               #   in Loop: Header=BB4_14 Depth=1
	regsw_c	x0, 0x0(x16)		# 100000000000000000000
	ld	x1, 8(t4)
	sub	a2, a1, s5




.LBB4_21:                               #   in Loop: Header=BB4_14 Depth=1
	regsw_c	x9, 0x4(x17)		# 100010100100000000100
	ld	x1, 8(t4)
	slli	t5, x1, 24
	srli	x9, t5, 56
	addi	x10, a1, -1
	li	t5, -1
	bge	a2, a1, .LBB4_62
	li	x2, 0
	regsw_c	x1, 0x124(x10)		# 010100000100100100100
	slli	t5, x1, 8
	srli	x3, t5, 56
	li	t5, -1

	mv	x4, t0
	mv	x5, a7
	mv	x6, a6
	mv	x7, a5
	regsw_c	x0, 0x0(x16)		# 100000000000000000000
	mv	x7, a5
	j	.LBB4_25
.LBB4_23:                               #   in Loop: Header=BB4_25 Depth=2
	regsw_c	x0, 0x0(x8)		# 010000000000000000000
	mv	t6, x9
