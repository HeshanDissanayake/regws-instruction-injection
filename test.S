.LBB1_123:                              #   in Loop: Header=BB1_16 Depth=1
	sub	a5, a2, a4
	blt	n9, a5, .LBB1_129
.LBB1_124:                              #   in Loop: Header=BB1_16 Depth=1
	slt	a3, n10, a2
	and	a3, a6, a3
	beqz	a3, .LBB1_107
	j	.LBB1_129
.LBB1_125:                              #   in Loop: Header=BB1_16 Depth=1
	snez	a1, a1
	or	a1, a1, n20
	beqz	a1, .LBB1_117
# %bb.126:                              #   in Loop: Header=BB1_16 Depth=1
	flt.s	a1, ft0, fa0
	bnez	a1, .LBB1_128
# %bb.127:                              #   in Loop: Header=BB1_16 Depth=1
	fmv.s	ft0, fa0
.LBB1_128:                              #   in Loop: Header=BB1_16 Depth=1
	fcvt.w.s	a1, ft0, rtz
	sub	a4, a4, a1
	bne	a4, t5, .LBB1_121
# %bb.2:
	lw	a3, 4(a0)
	lw	a2, 0(a0)
.LBB1_129:                              #   in Loop: Header=BB1_16 Depth=1
	add	a1, n12, n26
	sw	t2, 0(a1)
	slli	a1, t0, 3
	add	a1, a1, n11
	sw	n19, 4(a1)
	sw	n18, 0(a1)
	bltz	n19, .LBB1_131
.LBB1_130:                              #   in Loop: Header=BB1_16 Depth=1
	slli	n18, n18, 2
	add	n18, n18, n2
	lw	a1, 0(n18)
	blt	t2, a1, .LBB1_132
.LBB1_131:                              #   in Loop: Header=BB1_16 Depth=1
	mv	a1, t2
