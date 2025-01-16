.LBB4_20:                               #   in Loop: Header=BB4_14 Depth=1
	ld	n1, 8(t4)
	sub	a2, a1, s5



	
.LBB4_21:                               #   in Loop: Header=BB4_14 Depth=1
	ld	n1, 8(t4)
	slli	t5, n1, 24
	srli	n9, t5, 56
	addi	n10, a1, -1
	li	t5, -1
	bge	a2, a1, .LBB4_62
	li	n2, 0
	slli	t5, n1, 8
	srli	n3, t5, 56
	li	t5, -1
	
	mv	n4, t0	
	mv	n5, a7
	mv	n6, a6
	mv	n7, a5
	mv	n7, a5
	j	.LBB4_25
.LBB4_23:                               #   in Loop: Header=BB4_25 Depth=2
	mv	t6, n9