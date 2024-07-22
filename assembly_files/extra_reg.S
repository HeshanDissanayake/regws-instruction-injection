	.text
	.attribute	4, 16
	.attribute	5, "rv32i2p1_f2p2_d2p2_zicsr2p0"
	.file	"chaining.c"
	.option	push
	.option	arch, +a, +c, +m
	.globl	mg_chain_backtrack              # -- Begin function mg_chain_backtrack
	.p2align	1
	.type	mg_chain_backtrack,@function
mg_chain_backtrack:                     # @mg_chain_backtrack
# %bb.0:
	addi	sp, sp, -80
	sw	ra, 76(sp)                      # 4-byte Folded Spill
	sw	n1, 72(sp)                      # 4-byte Folded Spill
	sw	n2, 68(sp)                      # 4-byte Folded Spill
	sw	n3, 64(sp)                      # 4-byte Folded Spill
	sw	n4, 60(sp)                      # 4-byte Folded Spill
	sw	n5, 56(sp)                      # 4-byte Folded Spill
	sw	n6, 52(sp)                      # 4-byte Folded Spill
	sw	n7, 48(sp)                      # 4-byte Folded Spill
	sw	n8, 44(sp)                      # 4-byte Folded Spill
	sw	n9, 40(sp)                      # 4-byte Folded Spill
	sw	n10, 36(sp)                     # 4-byte Folded Spill
	sw	n11, 32(sp)                     # 4-byte Folded Spill
	sw	n12, 28(sp)                     # 4-byte Folded Spill
	sw	n13, 24(sp)                     # 4-byte Folded Spill
	sw	n14, 20(sp)                     # 4-byte Folded Spill
	sw	n15, 16(sp)                     # 4-byte Folded Spill
	sw	n16, 12(sp)                     # 4-byte Folded Spill
	sw	n17, 8(sp)                      # 4-byte Folded Spill
	lw	n9, 92(sp)
	lw	n10, 88(sp)
	mv	n1, a7
	mv	n2, a6
	mv	n3, a5
	mv	n4, a4
	mv	n5, a3
	mv	n7, a2
	mv	n8, a1
	sw	zero, 0(n9)
	sw	zero, 0(n10)
	beqz	a2, .LBB0_2
# %bb.1:
	slti	a0, n7, 0
	beqz	a0, .LBB0_3
	j	.LBB0_11
.LBB0_2:
	seqz	a0, n8
	bnez	a0, .LBB0_11
.LBB0_3:                                # %.preheader9
	lw	n11, 84(sp)
	lw	n12, 80(sp)
	li	a2, 0
	li	a1, 0
	li	n13, 0
	j	.LBB0_6
.LBB0_4:                                #   in Loop: Header=BB0_6 Depth=1
	slt	a4, a0, n7
.LBB0_5:                                #   in Loop: Header=BB0_6 Depth=1
	slli	a2, a2, 2
	add	a2, a2, n5
	lw	a2, 0(a2)
	slt	a2, a2, n12
	xori	n14, a2, 1
	add	n14, n14, a1
	sltu	a1, n14, a1
	add	n13, n13, a1
	mv	a2, a3
	mv	a1, n14
	beqz	a4, .LBB0_8
.LBB0_6:                                # =>This Inner Loop Header: Depth=1
	addi	a3, a2, 1
	seqz	a4, a3
	add	a0, a0, a4
	bne	a0, n7, .LBB0_4
# %bb.7:                                #   in Loop: Header=BB0_6 Depth=1
	sltu	a4, a3, n8
	j	.LBB0_5
.LBB0_8:
	or	a0, n14, n13
	beqz	a0, .LBB0_11
# %bb.9:
	beqz	n7, .LBB0_12
# %bb.10:
	slti	n15, n7, 0
	slli	a0, n14, 4
	call	malloc
	mv	n6, a0
	beqz	n15, .LBB0_13
	j	.LBB0_19
.LBB0_11:
	li	n7, 0
	j	.LBB0_89
.LBB0_12:
	seqz	n15, n8
	slli	a0, n14, 4
	call	malloc
	mv	n6, a0
	bnez	n15, .LBB0_19
.LBB0_13:                               # %.preheader7
	li	a0, 0
	li	a1, 0
	li	a3, 0
	li	a6, 0
	j	.LBB0_15
.LBB0_14:                               #   in Loop: Header=BB0_15 Depth=1
	slt	a4, a1, n7
	beqz	a4, .LBB0_19
.LBB0_15:                               # =>This Inner Loop Header: Depth=1
	slli	a4, a0, 2
	add	a4, a4, n5
	lw	a4, 0(a4)
	blt	a4, n12, .LBB0_17
# %bb.16:                               #   in Loop: Header=BB0_15 Depth=1
	srai	a5, a4, 31
	slli	a2, a3, 4
	add	a2, a2, n6
	sw	a5, 4(a2)
	sw	a4, 0(a2)
	addi	a3, a3, 1
	seqz	a4, a3
	add	a6, a6, a4
	sw	a1, 12(a2)
	sw	a0, 8(a2)
.LBB0_17:                               #   in Loop: Header=BB0_15 Depth=1
	addi	a0, a0, 1
	seqz	a2, a0
	add	a1, a1, a2
	bne	a1, n7, .LBB0_14
# %bb.18:                               #   in Loop: Header=BB0_15 Depth=1
	sltu	a4, a0, n8
	bnez	a4, .LBB0_15
.LBB0_19:
	slli	n8, n8, 2
	mv  a0, n2
	li	a1, 0
	mv	a2, n8
	call	memset
	li	a7, 0
	li	t3, 0
	li	a6, 0
	seqz	a0, n14
	sub	n13, n13, a0
	addi	n14, n14, -1
	srai	n15, n1, 31
	li	t4, 2
	li	t5, 1
	mv	t2, n14
	mv	t1, n13
	j	.LBB0_21
.LBB0_20:                               #   in Loop: Header=BB0_21 Depth=1
	sgtz	a0, t1
	seqz	a1, t2
	sub	t1, t1, a1
	addi	t2, t2, -1
	beqz	a0, .LBB0_52
.LBB0_21:                               # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_24 Depth 2
                                        #     Child Loop BB0_33 Depth 2
                                        #     Child Loop BB0_37 Depth 2
	slli	t0, t2, 4
	add	t0, t0, n6
	lw	a2, 8(t0)
	slli	a0, a2, 2
	add	a0, a0, n2
	lw	a0, 0(a0)
	bnez	a0, .LBB0_50
# %bb.22:                               #   in Loop: Header=BB0_21 Depth=1
	lw	t6, 12(t0)
	mv	a1, a7
	mv	a0, t3
	bltz	t6, .LBB0_41
# %bb.23:                               #   in Loop: Header=BB0_21 Depth=1
	lw	n17, 0(t0)
	li	a3, 0
	mv	a0, a2
	mv	n7, a2
	mv	n16, t6
.LBB0_24:                               #   Parent Loop BB0_21 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	slli	a4, a0, 2
	slli	a0, a0, 3
	add	a0, a0, n4
	lw	a1, 4(a0)
	lw	a0, 0(a0)
	add	a4, a4, n2
	sw	t4, 0(a4)
	slli	a4, a0, 2
	mv	a5, n17
	bltz	a1, .LBB0_26
# %bb.25:                               #   in Loop: Header=BB0_24 Depth=2
	add	a5, n5, a4
	lw	a5, 0(a5)
	sub	a5, n17, a5
.LBB0_26:                               #   in Loop: Header=BB0_24 Depth=2
	bge	a3, a5, .LBB0_28
# %bb.27:                               #   in Loop: Header=BB0_24 Depth=2
	mv	n7, a0
	mv	n16, a1
	mv	a3, a5
	j	.LBB0_29
.LBB0_28:                               #   in Loop: Header=BB0_24 Depth=2
	sub	a5, a3, a5
	blt	n11, a5, .LBB0_31
.LBB0_29:                               #   in Loop: Header=BB0_24 Depth=2
	bltz	a1, .LBB0_31
# %bb.30:                               #   in Loop: Header=BB0_24 Depth=2
	add	a4, a4, n2
	lw	a4, 0(a4)
	beqz	a4, .LBB0_24
.LBB0_31:                               #   in Loop: Header=BB0_21 Depth=1
	xor	a3, a2, a0
	xor	a4, t6, a1
	or	a3, a3, a4
	beqz	a3, .LBB0_35
# %bb.32:                               # %.preheader5
                                        #   in Loop: Header=BB0_21 Depth=1
	mv	a3, a2
.LBB0_33:                               #   Parent Loop BB0_21 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	slli	a5, a3, 3
	add	a5, a5, n4
	lw	a4, 4(a5)
	slli	a3, a3, 2
	add	a3, a3, n2
	sw	zero, 0(a3)
	bltz	a4, .LBB0_35
# %bb.34:                               #   in Loop: Header=BB0_33 Depth=2
	lw	a3, 0(a5)
	xor	a5, a3, a0
	xor	a4, a4, a1
	or	a4, a4, a5
	bnez	a4, .LBB0_33
.LBB0_35:                               #   in Loop: Header=BB0_21 Depth=1
	xor	a0, a2, n7
	xor	a1, t6, n16
	or	a3, a0, a1
	mv	a1, a7
	mv	a0, t3
	beqz	a3, .LBB0_39
# %bb.36:                               # %.preheader3
                                        #   in Loop: Header=BB0_21 Depth=1
	mv	a1, a7
	mv	a0, t3
.LBB0_37:                               #   Parent Loop BB0_21 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	addi	a1, a1, 1
	seqz	a3, a1
	slli	a4, a2, 2
	slli	a2, a2, 3
	add	a2, a2, n4
	lw	a5, 4(a2)
	lw	a2, 0(a2)
	add	a0, a0, a3
	add	a4, a4, n2
	xor	a5, a5, n16
	xor	a3, a2, n7
	or	a3, a3, a5
	sw	t5, 0(a4)
	bnez	a3, .LBB0_37
# %bb.38:                               #   in Loop: Header=BB0_21 Depth=1
	mv	a2, n7
	mv	t6, n16
.LBB0_39:                               #   in Loop: Header=BB0_21 Depth=1
	bltz	t6, .LBB0_41
# %bb.40:                               #   in Loop: Header=BB0_21 Depth=1
	lw	a3, 0(t0)
	slli	a2, a2, 2
	add	a2, a2, n5
	lw	a2, 0(a2)
	sub	a2, a3, a2
	bge	a2, n12, .LBB0_42
	j	.LBB0_50
.LBB0_41:                               #   in Loop: Header=BB0_21 Depth=1
	lw	a2, 0(t0)
	blt	a2, n12, .LBB0_50
.LBB0_42:                               #   in Loop: Header=BB0_21 Depth=1
	beq	a0, t3, .LBB0_44
# %bb.43:                               #   in Loop: Header=BB0_21 Depth=1
	slt	a2, t3, a0
	bnez	a2, .LBB0_45
	j	.LBB0_50
.LBB0_44:                               #   in Loop: Header=BB0_21 Depth=1
	sltu	a2, a7, a1
	beqz	a2, .LBB0_50
.LBB0_45:                               #   in Loop: Header=BB0_21 Depth=1
	sltu	a2, a1, a7
	sub	a3, a0, t3
	sub	a2, a3, a2
	beq	a2, n15, .LBB0_47
# %bb.46:                               #   in Loop: Header=BB0_21 Depth=1
	slt	a2, a2, n15
	beqz	a2, .LBB0_48
	j	.LBB0_49
.LBB0_47:                               #   in Loop: Header=BB0_21 Depth=1
	sub	a2, a1, a7
	sltu	a2, a2, n1
	bnez	a2, .LBB0_49
.LBB0_48:                               #   in Loop: Header=BB0_21 Depth=1
	mv	t3, a0
	mv	a7, a1
.LBB0_49:                               #   in Loop: Header=BB0_21 Depth=1
	xori	a0, a2, 1
	add	a6, a6, a0
.LBB0_50:                               #   in Loop: Header=BB0_21 Depth=1
	bnez	t1, .LBB0_20
# %bb.51:                               #   in Loop: Header=BB0_21 Depth=1
	snez	a0, t2
	seqz	a1, t2
	sub	t1, t1, a1
	addi	t2, t2, -1
	bnez	a0, .LBB0_21
.LBB0_52:
	slli	a0, a6, 3
	call	malloc
	mv	n7, a0
	mv	a0, n2
	li	a1, 0
	mv	a2, n8
	call	memset
	li	n16, 0
	li	n17, 0
	li	n8, 0
	li	a6, 2
	li	a7, 1
	j	.LBB0_54
.LBB0_53:                               #   in Loop: Header=BB0_54 Depth=1
	sgtz	a0, n13
	seqz	a1, n14
	sub	n13, n13, a1
	addi	n14, n14, -1
	beqz	a0, .LBB0_84
.LBB0_54:                               # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_59 Depth 2
                                        #     Child Loop BB0_68 Depth 2
                                        #     Child Loop BB0_72 Depth 2
	slli	t4, n14, 4
	add	t4, t4, n6
	lw	a3, 8(t4)
	slli	a0, a3, 2
	add	a0, a0, n2
	lw	a0, 0(a0)
	beqz	a0, .LBB0_57
.LBB0_55:                               #   in Loop: Header=BB0_54 Depth=1
	bnez	n13, .LBB0_53
# %bb.56:                               #   in Loop: Header=BB0_54 Depth=1
	snez	a0, n14
	seqz	a1, n14
	sub	n13, n13, a1
	addi	n14, n14, -1
	bnez	a0, .LBB0_54
	j	.LBB0_84
.LBB0_57:                               #   in Loop: Header=BB0_54 Depth=1
	lw	t3, 12(t4)
	mv	a0, n16
	mv	a1, n17
	bltz	t3, .LBB0_76
# %bb.58:                               #   in Loop: Header=BB0_54 Depth=1
	lw	t0, 0(t4)
	li	a4, 0
	mv	a0, a3
	mv	t5, a3
	mv	t6, t3
.LBB0_59:                               #   Parent Loop BB0_54 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	slli	a2, a0, 2
	slli	a0, a0, 3
	add	a0, a0, n4
	lw	a1, 4(a0)
	lw	a0, 0(a0)
	add	a2, a2, n2
	sw	a6, 0(a2)
	slli	a5, a0, 2
	mv	a2, t0
	bltz	a1, .LBB0_61
# %bb.60:                               #   in Loop: Header=BB0_59 Depth=2
	add	a2, n5, a5
	lw	a2, 0(a2)
	sub	a2, t0, a2
.LBB0_61:                               #   in Loop: Header=BB0_59 Depth=2
	bge	a4, a2, .LBB0_63
# %bb.62:                               #   in Loop: Header=BB0_59 Depth=2
	mv	t5, a0
	mv	t6, a1
	mv	a4, a2
	j	.LBB0_64
.LBB0_63:                               #   in Loop: Header=BB0_59 Depth=2
	sub	a2, a4, a2
	blt	n11, a2, .LBB0_66
.LBB0_64:                               #   in Loop: Header=BB0_59 Depth=2
	bltz	a1, .LBB0_66
# %bb.65:                               #   in Loop: Header=BB0_59 Depth=2
	add	a5, a5, n2
	lw	a2, 0(a5)
	beqz	a2, .LBB0_59
.LBB0_66:                               #   in Loop: Header=BB0_54 Depth=1
	xor	a2, a3, a0
	xor	a4, t3, a1
	or	a2, a2, a4
	beqz	a2, .LBB0_70
# %bb.67:                               # %.preheader1
                                        #   in Loop: Header=BB0_54 Depth=1
	mv	a2, a3
.LBB0_68:                               #   Parent Loop BB0_54 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	slli	a5, a2, 3
	add	a5, a5, n4
	lw	a4, 4(a5)
	slli	a2, a2, 2
	add	a2, a2, n2
	sw	zero, 0(a2)
	bltz	a4, .LBB0_70
# %bb.69:                               #   in Loop: Header=BB0_68 Depth=2
	lw	a2, 0(a5)
	xor	a5, a2, a0
	xor	a4, a4, a1
	or	a4, a4, a5
	bnez	a4, .LBB0_68
.LBB0_70:                               #   in Loop: Header=BB0_54 Depth=1
	xor	a0, a3, t5
	xor	a1, t3, t6
	or	a2, a0, a1
	mv	a0, n16
	mv	a1, n17
	beqz	a2, .LBB0_74
# %bb.71:                               # %.preheader
                                        #   in Loop: Header=BB0_54 Depth=1
	mv	a0, n16
	mv	a1, n17
.LBB0_72:                               #   Parent Loop BB0_54 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	slli	a2, a0, 2
	addi	a0, a0, 1
	seqz	a4, a0
	add	a2, a2, n3
	sw	a3, 0(a2)
	slli	a2, a3, 2
	slli	a3, a3, 3
	add	a3, a3, n4
	lw	a5, 4(a3)
	lw	a3, 0(a3)
	add	a1, a1, a4
	add	a2, a2, n2
	xor	a5, a5, t6
	xor	a4, a3, t5
	or	a4, a4, a5
	sw	a7, 0(a2)
	bnez	a4, .LBB0_72
# %bb.73:                               #   in Loop: Header=BB0_54 Depth=1
	mv	a3, t5
	mv	t3, t6
.LBB0_74:                               #   in Loop: Header=BB0_54 Depth=1
	bltz	t3, .LBB0_76
# %bb.75:                               #   in Loop: Header=BB0_54 Depth=1
	lw	a2, 0(t4)
	slli	a3, a3, 2
	add	a3, a3, n5
	lw	a3, 0(a3)
	sub	a2, a2, a3
	bge	a2, n12, .LBB0_77
	j	.LBB0_55
.LBB0_76:                               #   in Loop: Header=BB0_54 Depth=1
	lw	a2, 0(t4)
	blt	a2, n12, .LBB0_55
.LBB0_77:                               #   in Loop: Header=BB0_54 Depth=1
	beq	a1, n17, .LBB0_79
# %bb.78:                               #   in Loop: Header=BB0_54 Depth=1
	slt	a3, n17, a1
	bnez	a3, .LBB0_80
	j	.LBB0_55
.LBB0_79:                               #   in Loop: Header=BB0_54 Depth=1
	sltu	a3, n16, a0
	beqz	a3, .LBB0_55
.LBB0_80:                               #   in Loop: Header=BB0_54 Depth=1
	sltu	a3, a0, n16
	sub	a4, a1, n17
	sub	a4, a4, a3
	sub	a3, a0, n16
	beq	a4, n15, .LBB0_82
# %bb.81:                               #   in Loop: Header=BB0_54 Depth=1
	slt	a5, a4, n15
	bnez	a5, .LBB0_55
	j	.LBB0_83
.LBB0_82:                               #   in Loop: Header=BB0_54 Depth=1
	sltu	a5, a3, n1
	bnez	a5, .LBB0_55
.LBB0_83:                               #   in Loop: Header=BB0_54 Depth=1
	or	a2, a2, a4
	slli	a4, n8, 3
	addi	n8, n8, 1
	add	a4, a4, n7
	sw	a2, 4(a4)
	sw	a3, 0(a4)
	mv	n16, a0
	mv	n17, a1
	j	.LBB0_55
.LBB0_84:
	mv	a0, n6
	call	free
	beqz	n17, .LBB0_86
# %bb.85:
	slti	a0, n17, 0
	j	.LBB0_87
.LBB0_86:
	lui	a0, 524288
	addi	a0, a0, -1
	sltu	a0, n16, a0
.LBB0_87:
	beqz	a0, .LBB0_90
# %bb.88:
	sw	n8, 0(n10)
	sw	n16, 0(n9)
.LBB0_89:
	mv	a0, n7
	lw	ra, 76(sp)                      # 4-byte Folded Reload
	lw	n1, 72(sp)                      # 4-byte Folded Reload
	lw	n2, 68(sp)                      # 4-byte Folded Reload
	lw	n3, 64(sp)                      # 4-byte Folded Reload
	lw	n4, 60(sp)                      # 4-byte Folded Reload
	lw	n5, 56(sp)                      # 4-byte Folded Reload
	lw	n6, 52(sp)                      # 4-byte Folded Reload
	lw	n7, 48(sp)                      # 4-byte Folded Reload
	lw	n8, 44(sp)                      # 4-byte Folded Reload
	lw	n9, 40(sp)                      # 4-byte Folded Reload
	lw	n10, 36(sp)                     # 4-byte Folded Reload
	lw	n11, 32(sp)                     # 4-byte Folded Reload
	lw	n12, 28(sp)                     # 4-byte Folded Reload
	lw	n13, 24(sp)                     # 4-byte Folded Reload
	lw	n14, 20(sp)                     # 4-byte Folded Reload
	lw	n15, 16(sp)                     # 4-byte Folded Reload
	lw	n16, 12(sp)                     # 4-byte Folded Reload
	lw	n17, 8(sp)                      # 4-byte Folded Reload
	addi	sp, sp, 80
	ret
.LBB0_90:
	lui	a0, %hi(.L.str)
	addi	a0, a0, %lo(.L.str)
	lui	a2, %hi(.L__func__.mg_chain_backtrack)
	addi	a2, a2, %lo(.L__func__.mg_chain_backtrack)
	lui	a3, %hi(.L.str.1)
	addi	a3, a3, %lo(.L.str.1)
	li	a1, 122
	call	__assert_func
.Lfunc_end0:
	.size	mg_chain_backtrack, .Lfunc_end0-mg_chain_backtrack
                                        # -- End function
	.option	pop
	.option	push
	.option	arch, +a, +c, +m
	.section	.srodata.cst4,"aM",@progbits,4
	.p2align	2, 0x0                          # -- Begin function mg_lchain_dp
.LCPI1_0:
	.word	0x40019420                      # float 2.02466583
.LCPI1_1:
	.word	0xbeb08ff9                      # float -0.344848424
.LCPI1_2:
	.word	0xbf2cc4c7                      # float -0.674877583
	.text
	.globl	mg_lchain_dp
	.p2align	1
	.type	mg_lchain_dp,@function
mg_lchain_dp:                           # @mg_lchain_dp
# %bb.0:
	addi	sp, sp, -192
	sw	ra, 188(sp)                     # 4-byte Folded Spill
	sw	n1, 184(sp)                     # 4-byte Folded Spill
	sw	n2, 180(sp)                     # 4-byte Folded Spill
	sw	n3, 176(sp)                     # 4-byte Folded Spill
	sw	n4, 172(sp)                     # 4-byte Folded Spill
	sw	n5, 168(sp)                     # 4-byte Folded Spill
	sw	n6, 164(sp)                     # 4-byte Folded Spill
	sw	n7, 160(sp)                     # 4-byte Folded Spill
	sw	n8, 156(sp)                     # 4-byte Folded Spill
	sw	n9, 152(sp)                     # 4-byte Folded Spill
	sw	n10, 148(sp)                    # 4-byte Folded Spill
	sw	n11, 144(sp)                    # 4-byte Folded Spill
	sw	n12, 140(sp)                    # 4-byte Folded Spill
	sw	n13, 136(sp)                    # 4-byte Folded Spill
	sw	n14, 132(sp)                    # 4-byte Folded Spill
	sw	n15, 128(sp)                    # 4-byte Folded Spill
	sw	n16, 124(sp)                    # 4-byte Folded Spill
	sw	n17, 120(sp)                    # 4-byte Folded Spill
	sw	n18, 116(sp)                    # 4-byte Folded Spill
	sw	n19, 112(sp)                    # 4-byte Folded Spill
	sw	n20, 108(sp)                    # 4-byte Folded Spill
	sw	n21, 104(sp)                    # 4-byte Folded Spill
	sw	n22, 100(sp)                    # 4-byte Folded Spill
	sw	n23, 96(sp)                     # 4-byte Folded Spill
	sw	n24, 92(sp)                     # 4-byte Folded Spill
	sw	n25, 88(sp)                     # 4-byte Folded Spill
	sw	n26, 84(sp)                     # 4-byte Folded Spill
	sw	n27, 80(sp)                     # 4-byte Folded Spill
	sw	n28, 76(sp)                     # 4-byte Folded Spill
	sw	n29, 72(sp)                     # 4-byte Folded Spill
	sw	n30, 68(sp)                     # 4-byte Folded Spill
	sw	n31, 64(sp)                     # 4-byte Folded Spill
	sw	n32, 60(sp)                     # 4-byte Folded Spill
	sw	n33, 56(sp)                     # 4-byte Folded Spill
	sw	n34, 52(sp)                     # 4-byte Folded Spill
	sw	n35, 48(sp)                     # 4-byte Folded Spill
	sw	n36, 44(sp)                     # 4-byte Folded Spill
	fsd	fs0, 32(sp)                     # 8-byte Folded Spill
	fsd	fs1, 24(sp)                     # 8-byte Folded Spill
	lw	n3, 204(sp)
	lw	n4, 200(sp)
	lw	n13, 216(sp)
	lw	n14, 212(sp)
	fmv.s	fs0, fa1
	fmv.s	fs1, fa0
	mv	n6, a6
	mv	n5, a5
	mv	n7, a4
	mv	n8, a3
	mv	n9, a2
	mv	n10, a1
	beqz	n13, .LBB1_2
# %bb.1:
	sw	zero, 0(n13)
	sw	zero, 0(n14)
.LBB1_2:
	lw	n1, 208(sp)
	or	a1, n4, n3
	beqz	a1, .LBB1_10
# %bb.3:
	beqz	n1, .LBB1_10
# %bb.4:
	mv	n15, n9
	bge	a0, n9, .LBB1_11
# %bb.5:
	slt	a0, n10, n9
	seqz	n16, a7
	and	a0, a0, n16
	bnez	a0, .LBB1_12
.LBB1_6:
	mv	n17, n9
	beqz	a7, .LBB1_8
.LBB1_7:
	lui	n17, 524288
	addi	n17, n17, -1
.LBB1_8:
	slli	n2, n4, 2
	mv	a0, n2
	call	malloc
	mv	n11, a0
	mv	a0, n2
	call	malloc
	mv	n12, a0
	mv	a0, n2
	call	malloc
	mv	n2, a0
	li	a1, 4
	mv	a0, n4
	call	calloc
	beqz	n3, .LBB1_13
# %bb.9:
	slti	a1, n3, 0
	beqz	a1, .LBB1_14
	j	.LBB1_140
.LBB1_10:
	mv	a0, n1
	j	.LBB1_165
.LBB1_11:
	mv	n15, a0
	slt	a0, n10, n9
	seqz	n16, a7
	and	a0, a0, n16
	beqz	a0, .LBB1_6
.LBB1_12:
	mv	n10, n9
	mv	n17, n9
	bnez	a7, .LBB1_7
	j	.LBB1_8
.LBB1_13:
	seqz	a1, n4
	bnez	a1, .LBB1_140
.LBB1_14:
	lw	a1, 192(sp)
	li	n25, 0
	li	n28, 0
	li	t0, 0
	li	n21, 0
	lui	a7, 526336
	addi	a7, a7, -1
	slti	a1, a1, 2
	xori	a1, a1, 1
	and	a6, n16, a1
	li	n22, -1
	srai	t6, n15, 31
	srai	t3, n7, 31
	fmv.w.x	fa5, zero
	lui	t4, 260096
	lui	a1, %hi(.LCPI1_0)
	flw	fa4, %lo(.LCPI1_0)(a1)
	lui	a1, %hi(.LCPI1_1)
	flw	fa3, %lo(.LCPI1_1)(a1)
	lui	a1, %hi(.LCPI1_2)
	flw	fa2, %lo(.LCPI1_2)(a1)
	lui	a1, 258048
	fmv.w.x	fa1, a1
	lui	t5, 524288
	li	n24, -1
	j	.LBB1_16
.LBB1_15:                               #   in Loop: Header=BB1_16 Depth=1
	slt	a1, n21, n3
	beqz	a1, .LBB1_140
.LBB1_16:                               # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_21 Depth 2
                                        #     Child Loop BB1_38 Depth 2
                                        #     Child Loop BB1_89 Depth 2
	beq	n21, n28, .LBB1_18
# %bb.17:                               #   in Loop: Header=BB1_16 Depth=1
	slt	a1, n28, n21
	slli	t1, t0, 4
	add	t1, t1, n1
	bnez	a1, .LBB1_19
	j	.LBB1_28
.LBB1_18:                               #   in Loop: Header=BB1_16 Depth=1
	sltu	a1, n25, t0
	slli	t1, t0, 4
	add	t1, t1, n1
	beqz	a1, .LBB1_28
.LBB1_19:                               #   in Loop: Header=BB1_16 Depth=1
	lw	a1, 4(t1)
	lw	a2, 0(t1)
	j	.LBB1_21
.LBB1_20:                               #   in Loop: Header=BB1_21 Depth=2
	slt	a3, n28, n21
	beqz	a3, .LBB1_27
.LBB1_21:                               #   Parent Loop BB1_16 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	slli	a4, n25, 4
	add	a4, a4, n1
	lw	a3, 4(a4)
	bne	a3, a1, .LBB1_25
# %bb.22:                               #   in Loop: Header=BB1_21 Depth=2
	lw	a5, 0(a4)
	add	a4, a5, n15
	sltu	a5, a4, a5
	add	a3, a3, t6
	add	a3, a3, a5
	beq	a1, a3, .LBB1_24
# %bb.23:                               #   in Loop: Header=BB1_21 Depth=2
	sltu	a3, a3, a1
	bnez	a3, .LBB1_25
	j	.LBB1_28
.LBB1_24:                               #   in Loop: Header=BB1_21 Depth=2
	sltu	a3, a4, a2
	beqz	a3, .LBB1_28
.LBB1_25:                               #   in Loop: Header=BB1_21 Depth=2
	addi	n25, n25, 1
	seqz	a3, n25
	add	n28, n28, a3
	bne	n21, n28, .LBB1_20
# %bb.26:                               #   in Loop: Header=BB1_21 Depth=2
	sltu	a3, n25, t0
	bnez	a3, .LBB1_21
.LBB1_27:                               #   in Loop: Header=BB1_16 Depth=1
	mv	n25, t0
	mv	n28, n21
.LBB1_28:                               #   in Loop: Header=BB1_16 Depth=1
	sltu	a1, t0, n25
	sub	a2, n21, n28
	sub	a1, a2, a1
	beq	a1, t3, .LBB1_30
# %bb.29:                               #   in Loop: Header=BB1_16 Depth=1
	slt	a1, t3, a1
	bnez	a1, .LBB1_31
	j	.LBB1_32
.LBB1_30:                               #   in Loop: Header=BB1_16 Depth=1
	sub	a1, t0, n25
	sltu	a1, n7, a1
	beqz	a1, .LBB1_32
.LBB1_31:                               #   in Loop: Header=BB1_16 Depth=1
	sltu	a1, t0, n7
	sub	n28, n21, t3
	sub	n28, n28, a1
	sub	n25, t0, n7
.LBB1_32:                               #   in Loop: Header=BB1_16 Depth=1
	beq	n21, n28, .LBB1_34
# %bb.33:                               #   in Loop: Header=BB1_16 Depth=1
	slt	a1, n28, n21
	j	.LBB1_35
.LBB1_34:                               #   in Loop: Header=BB1_16 Depth=1
	sltu	a1, n25, t0
.LBB1_35:                               #   in Loop: Header=BB1_16 Depth=1
	lw	n20, 12(t1)
	lw	n23, 8(t1)
	andi	t2, n20, 255
	seqz	a2, t0
	sub	n33, n21, a2
	addi	n34, t0, -1
	li	n18, -1
	beqz	a1, .LBB1_78
# %bb.36:                               #   in Loop: Header=BB1_16 Depth=1
	li	n26, 0
	slli	n27, n20, 8
	srli	n27, n27, 24
	li	n18, -1
	li	n19, -1
	mv	n36, n34
	mv	n35, n33
	j	.LBB1_38
.LBB1_37:                               #   in Loop: Header=BB1_38 Depth=2
	slt	a1, n28, n35
	seqz	a2, n36
	sub	n35, n35, a2
	addi	n36, n36, -1
	beqz	a1, .LBB1_79
.LBB1_38:                               #   Parent Loop BB1_16 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	slli	a1, n36, 4
	add	a1, a1, n1
	lw	a2, 8(a1)
	sub	a3, n23, a2
	blez	a3, .LBB1_66
# %bb.39:                               #   in Loop: Header=BB1_38 Depth=2
	blt	n15, a3, .LBB1_66
# %bb.40:                               #   in Loop: Header=BB1_38 Depth=2
	lw	n30, 12(a1)
	lw	a2, 0(t1)
	lw	a1, 0(a1)
	slli	n29, n30, 8
	srli	n29, n29, 24
	sub	a4, a2, a1
	bne	n27, n29, .LBB1_45
# %bb.41:                               #   in Loop: Header=BB1_38 Depth=2
	beqz	a4, .LBB1_66
# %bb.42:                               #   in Loop: Header=BB1_38 Depth=2
	blt	n10, a3, .LBB1_66
# %bb.43:                               #   in Loop: Header=BB1_38 Depth=2
	blt	a3, a4, .LBB1_72
# %bb.44:                               #   in Loop: Header=BB1_38 Depth=2
	sub	n31, a3, a4
	blt	n9, n31, .LBB1_66
	j	.LBB1_73
.LBB1_45:                               #   in Loop: Header=BB1_38 Depth=2
	blt	a3, a4, .LBB1_47
# %bb.46:                               #   in Loop: Header=BB1_38 Depth=2
	sub	n31, a3, a4
	j	.LBB1_48
.LBB1_47:                               #   in Loop: Header=BB1_38 Depth=2
	sub	n31, a4, a3
.LBB1_48:                               #   in Loop: Header=BB1_38 Depth=2
	slt	n32, a3, a4
	mv	a1, a4
	bge	a4, a3, .LBB1_51
# %bb.49:                               #   in Loop: Header=BB1_38 Depth=2
	andi	a2, n30, 255
	mv	n30, a2
	bge	a2, a1, .LBB1_52
.LBB1_50:                               #   in Loop: Header=BB1_38 Depth=2
	beqz	n31, .LBB1_53
	j	.LBB1_55
.LBB1_51:                               #   in Loop: Header=BB1_38 Depth=2
	mv	a1, a3
	andi	a2, n30, 255
	mv	n30, a2
	blt	a2, a3, .LBB1_50
.LBB1_52:                               #   in Loop: Header=BB1_38 Depth=2
	mv	n30, a1
	bnez	n31, .LBB1_55
.LBB1_53:                               #   in Loop: Header=BB1_38 Depth=2
	blt	a2, a1, .LBB1_55
# %bb.54:                               #   in Loop: Header=BB1_38 Depth=2
	bne	n30, t5, .LBB1_62
	j	.LBB1_66
.LBB1_55:                               #   in Loop: Header=BB1_38 Depth=2
	fmv.s	fa0, fa5
	blez	n31, .LBB1_57
# %bb.56:                               #   in Loop: Header=BB1_38 Depth=2
	addi	a2, n31, 1
	fcvt.s.w	fa0, a2
	fmv.x.w	a2, fa0
	slli	a3, a2, 1
	srli	a3, a3, 24
	addi	a3, a3, -128
	fcvt.s.wu	fa0, a3
	and	a2, a2, a7
	or	a2, a2, t4
	fmv.w.x	ft0, a2
	fmadd.s	ft1, ft0, fa3, fa4
	fmadd.s	ft0, ft1, ft0, fa2
	fadd.s	fa0, ft0, fa0
.LBB1_57:                               #   in Loop: Header=BB1_38 Depth=2
	fcvt.s.w	ft0, n31
	fcvt.s.w	ft1, a1
	fmul.s	ft1, ft1, fs0
	xor	a1, n27, n29
	seqz	a2, a1
	and	a2, a2, n16
	fmadd.s	ft0, fs1, ft0, ft1
	beqz	a2, .LBB1_59
.LBB1_58:                               #   in Loop: Header=BB1_38 Depth=2
	fmadd.s	fa0, fa0, fa1, ft0
	fcvt.w.s	a1, fa0, rtz
	sub	n30, n30, a1
	bne	n30, t5, .LBB1_62
	j	.LBB1_66
.LBB1_59:                               #   in Loop: Header=BB1_38 Depth=2
	beq	n27, n29, .LBB1_74
# %bb.60:                               #   in Loop: Header=BB1_38 Depth=2
	bnez	a4, .LBB1_74
# %bb.61:                               #   in Loop: Header=BB1_38 Depth=2
	addi	n30, n30, 1
.LBB1_62:                               #   in Loop: Header=BB1_38 Depth=2
	slli	a1, n36, 2
	add	a2, n12, a1
	lw	a2, 0(a2)
	add	n30, n30, a2
	bge	t2, n30, .LBB1_68
# %bb.63:                               #   in Loop: Header=BB1_38 Depth=2
	sgtz	a1, n26
	sub	n26, n26, a1
	mv	n18, n36
	mv	n19, n35
	slli	a1, n36, 3
	add	a1, a1, n11
	lw	a2, 4(a1)
	bltz	a2, .LBB1_65
.LBB1_64:                               #   in Loop: Header=BB1_38 Depth=2
	lw	a1, 0(a1)
	slli	a1, a1, 2
	add	a1, a1, a0
	sw	t0, 0(a1)
.LBB1_65:                               #   in Loop: Header=BB1_38 Depth=2
	mv	t2, n30
.LBB1_66:                               #   in Loop: Header=BB1_38 Depth=2
	bne	n35, n28, .LBB1_37
# %bb.67:                               #   in Loop: Header=BB1_38 Depth=2
	sltu	a1, n25, n36
	seqz	a2, n36
	sub	n35, n35, a2
	addi	n36, n36, -1
	bnez	a1, .LBB1_38
	j	.LBB1_79
.LBB1_68:                               #   in Loop: Header=BB1_38 Depth=2
	add	a1, a1, a0
	lw	a1, 0(a1)
	bne	a1, t0, .LBB1_71
# %bb.69:                               #   in Loop: Header=BB1_38 Depth=2
	bge	n26, n8, .LBB1_79
# %bb.70:                               #   in Loop: Header=BB1_38 Depth=2
	addi	n26, n26, 1
.LBB1_71:                               #   in Loop: Header=BB1_38 Depth=2
	mv	n30, t2
	slli	a1, n36, 3
	add	a1, a1, n11
	lw	a2, 4(a1)
	bgez	a2, .LBB1_64
	j	.LBB1_65
.LBB1_72:                               #   in Loop: Header=BB1_38 Depth=2
	sub	n31, a4, a3
	blt	n9, n31, .LBB1_66
.LBB1_73:                               #   in Loop: Header=BB1_38 Depth=2
	slt	a1, n10, a4
	and	a1, a6, a1
	beqz	a1, .LBB1_48
	j	.LBB1_66
.LBB1_74:                               #   in Loop: Header=BB1_38 Depth=2
	snez	a1, a1
	or	a1, a1, n32
	beqz	a1, .LBB1_58
# %bb.75:                               #   in Loop: Header=BB1_38 Depth=2
	flt.s	a1, ft0, fa0
	bnez	a1, .LBB1_77
# %bb.76:                               #   in Loop: Header=BB1_38 Depth=2
	fmv.s	ft0, fa0
.LBB1_77:                               #   in Loop: Header=BB1_38 Depth=2
	fcvt.w.s	a1, ft0, rtz
	sub	n30, n30, a1
	bne	n30, t5, .LBB1_62
	j	.LBB1_66
.LBB1_78:                               #   in Loop: Header=BB1_16 Depth=1
	mv	n36, n34
	mv	n35, n33
	li	n19, -1
.LBB1_79:                               #   in Loop: Header=BB1_16 Depth=1
	slli	n26, t0, 2
	bltz	n24, .LBB1_83
# %bb.80:                               #   in Loop: Header=BB1_16 Depth=1
	lw	a3, 4(t1)
	lw	a1, 0(t1)
	slli	a2, n22, 4
	add	a4, n1, a2
	lw	a2, 0(a4)
	lw	a4, 4(a4)
	sltu	a5, a1, a2
	sub	a3, a3, a4
	sub	a3, a3, a5
	beq	a3, t6, .LBB1_82
# %bb.81:                               #   in Loop: Header=BB1_16 Depth=1
	sltu	a1, t6, a3
	bnez	a1, .LBB1_83
	j	.LBB1_93
.LBB1_82:                               #   in Loop: Header=BB1_16 Depth=1
	sub	a1, a1, a2
	sltu	a1, n15, a1
	beqz	a1, .LBB1_93
.LBB1_83:                               #   in Loop: Header=BB1_16 Depth=1
	beq	n21, n28, .LBB1_85
# %bb.84:                               #   in Loop: Header=BB1_16 Depth=1
	slt	a1, n28, n21
	li	n22, -1
	li	n24, -1
	bnez	a1, .LBB1_86
	j	.LBB1_129
.LBB1_85:                               #   in Loop: Header=BB1_16 Depth=1
	sltu	a1, n25, t0
	li	n22, -1
	li	n24, -1
	beqz	a1, .LBB1_129
.LBB1_86:                               # %.preheader3
                                        #   in Loop: Header=BB1_16 Depth=1
	li	a3, -1
	lui	a1, 524288
	li	a4, -1
	j	.LBB1_89
.LBB1_87:                               #   in Loop: Header=BB1_89 Depth=2
	slt	a5, n28, n33
.LBB1_88:                               #   in Loop: Header=BB1_89 Depth=2
	seqz	a1, n34
	sub	n33, n33, a1
	addi	n34, n34, -1
	mv	a1, a2
	mv	a3, n22
	mv	a4, n24
	beqz	a5, .LBB1_93
.LBB1_89:                               #   Parent Loop BB1_16 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	slli	a2, n34, 2
	add	a2, a2, n12
	lw	a2, 0(a2)
	mv	n24, n33
	mv	n22, n34
	blt	a1, a2, .LBB1_91
# %bb.90:                               #   in Loop: Header=BB1_89 Depth=2
	mv	n24, a4
	mv	n22, a3
	mv	a2, a1
.LBB1_91:                               #   in Loop: Header=BB1_89 Depth=2
	bne	n33, n28, .LBB1_87
# %bb.92:                               #   in Loop: Header=BB1_89 Depth=2
	sltu	a5, n25, n34
	j	.LBB1_88
.LBB1_93:                               #   in Loop: Header=BB1_16 Depth=1
	bltz	n24, .LBB1_129
# %bb.94:                               #   in Loop: Header=BB1_16 Depth=1
	beq	n24, n35, .LBB1_96
# %bb.95:                               #   in Loop: Header=BB1_16 Depth=1
	slt	a1, n24, n35
	bnez	a1, .LBB1_97
	j	.LBB1_129
.LBB1_96:                               #   in Loop: Header=BB1_16 Depth=1
	sltu	a1, n22, n36
	beqz	a1, .LBB1_129
.LBB1_97:                               #   in Loop: Header=BB1_16 Depth=1
	slli	a2, n22, 4
	add	a2, a2, n1
	lw	a1, 8(a2)
	sub	a4, n23, a1
	blez	a4, .LBB1_129
# %bb.98:                               #   in Loop: Header=BB1_16 Depth=1
	blt	n15, a4, .LBB1_129
# %bb.99:                               #   in Loop: Header=BB1_16 Depth=1
	lw	a1, 12(a2)
	slli	n20, n20, 8
	lw	a3, 0(t1)
	lw	a2, 0(a2)
	srli	n23, n20, 24
	slli	n27, a1, 8
	srli	n27, n27, 24
	sub	a2, a3, a2
	bne	n23, n27, .LBB1_104
# %bb.100:                              #   in Loop: Header=BB1_16 Depth=1
	beqz	a2, .LBB1_129
# %bb.101:                              #   in Loop: Header=BB1_16 Depth=1
	blt	n10, a4, .LBB1_129
# %bb.102:                              #   in Loop: Header=BB1_16 Depth=1
	blt	a4, a2, .LBB1_123
# %bb.103:                              #   in Loop: Header=BB1_16 Depth=1
	sub	a5, a4, a2
	bge	n9, a5, .LBB1_124
	j	.LBB1_129
.LBB1_104:                              #   in Loop: Header=BB1_16 Depth=1
	blt	a4, a2, .LBB1_106
# %bb.105:                              #   in Loop: Header=BB1_16 Depth=1
	sub	a5, a4, a2
	j	.LBB1_107
.LBB1_106:                              #   in Loop: Header=BB1_16 Depth=1
	sub	a5, a2, a4
.LBB1_107:                              #   in Loop: Header=BB1_16 Depth=1
	slt	n20, a4, a2
	mv	a3, a2
	bge	a2, a4, .LBB1_110
# %bb.108:                              #   in Loop: Header=BB1_16 Depth=1
	andi	a1, a1, 255
	mv	a4, a1
	bge	a1, a3, .LBB1_111
.LBB1_109:                              #   in Loop: Header=BB1_16 Depth=1
	beqz	a5, .LBB1_112
	j	.LBB1_114
.LBB1_110:                              #   in Loop: Header=BB1_16 Depth=1
	mv	a3, a4
	andi	a1, a1, 255
	mv	a4, a1
	blt	a1, a3, .LBB1_109
.LBB1_111:                              #   in Loop: Header=BB1_16 Depth=1
	mv	a4, a3
	bnez	a5, .LBB1_114
.LBB1_112:                              #   in Loop: Header=BB1_16 Depth=1
	blt	a1, a3, .LBB1_114
# %bb.113:                              #   in Loop: Header=BB1_16 Depth=1
	bne	a4, t5, .LBB1_121
	j	.LBB1_129
.LBB1_114:                              #   in Loop: Header=BB1_16 Depth=1
	fmv.s	fa0, fa5
	blez	a5, .LBB1_116
# %bb.115:                              #   in Loop: Header=BB1_16 Depth=1
	addi	a1, a5, 1
	fcvt.s.w	fa0, a1
	fmv.x.w	n29, fa0
	slli	a1, n29, 1
	srli	a1, a1, 24
	addi	a1, a1, -128
	fcvt.s.wu	fa0, a1
	and	a1, n29, a7
	or	a1, a1, t4
	fmv.w.x	ft0, a1
	fmadd.s	ft1, ft0, fa3, fa4
	fmadd.s	ft0, ft1, ft0, fa2
	fadd.s	fa0, ft0, fa0
.LBB1_116:                              #   in Loop: Header=BB1_16 Depth=1
	fcvt.s.w	ft0, a5
	fcvt.s.w	ft1, a3
	fmul.s	ft1, ft1, fs0
	xor	a1, n23, n27
	seqz	a3, a1
	and	a3, a3, n16
	fmadd.s	ft0, fs1, ft0, ft1
	beqz	a3, .LBB1_118
.LBB1_117:                              #   in Loop: Header=BB1_16 Depth=1
	fmadd.s	fa0, fa0, fa1, ft0
	fcvt.w.s	a1, fa0, rtz
	sub	a4, a4, a1
	bne	a4, t5, .LBB1_121
	j	.LBB1_129
.LBB1_118:                              #   in Loop: Header=BB1_16 Depth=1
	beq	n23, n27, .LBB1_125
# %bb.119:                              #   in Loop: Header=BB1_16 Depth=1
	bnez	a2, .LBB1_125
# %bb.120:                              #   in Loop: Header=BB1_16 Depth=1
	addi	a4, a4, 1
.LBB1_121:                              #   in Loop: Header=BB1_16 Depth=1
	slli	a1, n22, 2
	add	a1, a1, n12
	lw	a1, 0(a1)
	add	a4, a4, a1
	bge	t2, a4, .LBB1_129
# %bb.122:                              #   in Loop: Header=BB1_16 Depth=1
	add	a1, n12, n26
	sw	a4, 0(a1)
	slli	a1, t0, 3
	add	a1, a1, n11
	sw	n24, 4(a1)
	sw	n22, 0(a1)
	mv	t2, a4
	mv	n18, n22
	j	.LBB1_130
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
.LBB1_132:                              #   in Loop: Header=BB1_16 Depth=1
	add	n26, n26, n2
	sw	a1, 0(n26)
	bltz	n24, .LBB1_137
# %bb.133:                              #   in Loop: Header=BB1_16 Depth=1
	lw	a3, 4(t1)
	lw	a1, 0(t1)
	slli	a2, n22, 4
	add	a4, n1, a2
	lw	a2, 0(a4)
	lw	a4, 4(a4)
	sltu	a5, a1, a2
	sub	a3, a3, a4
	sub	a3, a3, a5
	beq	a3, t6, .LBB1_135
# %bb.134:                              #   in Loop: Header=BB1_16 Depth=1
	sltu	a1, t6, a3
	beqz	a1, .LBB1_136
	j	.LBB1_138
.LBB1_135:                              #   in Loop: Header=BB1_16 Depth=1
	sub	a1, a1, a2
	sltu	a1, n15, a1
	bnez	a1, .LBB1_138
.LBB1_136:                              #   in Loop: Header=BB1_16 Depth=1
	slli	a1, n22, 2
	add	a1, a1, n12
	lw	a1, 0(a1)
	bge	a1, t2, .LBB1_138
.LBB1_137:                              #   in Loop: Header=BB1_16 Depth=1
	mv	n22, t0
	mv	n24, n21
.LBB1_138:                              #   in Loop: Header=BB1_16 Depth=1
	addi	t0, t0, 1
	seqz	a1, t0
	add	n21, n21, a1
	bne	n21, n3, .LBB1_15
# %bb.139:                              #   in Loop: Header=BB1_16 Depth=1
	sltu	a1, t0, n4
	bnez	a1, .LBB1_16
.LBB1_140:
	addi	a1, sp, 16
	sw	a1, 12(sp)
	addi	a1, sp, 20
	sw	a1, 8(sp)
	sw	n17, 4(sp)
	sw	n6, 0(sp)
	mv	a1, n4
	mv	a2, n3
	mv	a3, n12
	mv	a4, n11
	mv	a5, n2
	mv	a6, a0
	mv	a7, n5
	mv	n3, a0
	call	mg_chain_backtrack
	lw	n7, 20(sp)
	mv	n4, a0
	sw	n7, 0(n14)
	sw	a0, 0(n13)
	mv	a0, n11
	call	free
	mv	a0, n12
	call	free
	mv	a0, n3
	call	free
	beqz	n7, .LBB1_164
# %bb.141:
	lw	a0, 16(sp)
	slli	a0, a0, 4
	call	malloc
	mv	n3, a0
	srai	n8, n7, 31
	blez	n7, .LBB1_153
# %bb.142:                              # %.preheader1
	li	a7, 0
	li	a6, 0
	li	a4, 0
	li	t0, 0
	j	.LBB1_144
.LBB1_143:                              #   in Loop: Header=BB1_144 Depth=1
	slt	a0, a6, n8
	beqz	a0, .LBB1_153
.LBB1_144:                              # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_149 Depth 2
	slli	a0, a7, 3
	add	a0, a0, n4
	lw	t3, 0(a0)
	bnez	t3, .LBB1_146
# %bb.145:                              #   in Loop: Header=BB1_144 Depth=1
	li	a0, 1
	beqz	a0, .LBB1_147
	j	.LBB1_151
.LBB1_146:                              #   in Loop: Header=BB1_144 Depth=1
	slti	a0, t3, 0
	bnez	a0, .LBB1_151
.LBB1_147:                              #   in Loop: Header=BB1_144 Depth=1
	li	t1, 0
	li	t6, 0
	srai	t5, t3, 31
	add	t4, t3, a4
	j	.LBB1_149
.LBB1_148:                              #   in Loop: Header=BB1_149 Depth=2
	slt	a0, t6, t5
	addi	a4, a4, 1
	seqz	a1, a4
	add	t0, t0, a1
	beqz	a0, .LBB1_151
.LBB1_149:                              #   Parent Loop BB1_144 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	not	a0, t1
	add	a0, a0, t4
	slli	a0, a0, 2
	add	a0, a0, n2
	lw	a0, 0(a0)
	slli	a2, a4, 4
	slli	a0, a0, 4
	add	a0, a0, n1
	lw	a1, 0(a0)
	lw	a3, 4(a0)
	lw	a5, 8(a0)
	add	a2, a2, n3
	sw	a1, 0(a2)
	sw	a3, 4(a2)
	sw	a5, 8(a2)
	lw	a0, 12(a0)
	addi	t1, t1, 1
	seqz	a1, t1
	add	t6, t6, a1
	sw	a0, 12(a2)
	bne	t5, t6, .LBB1_148
# %bb.150:                              #   in Loop: Header=BB1_149 Depth=2
	sltu	a0, t1, t3
	addi	a4, a4, 1
	seqz	a1, a4
	add	t0, t0, a1
	bnez	a0, .LBB1_149
.LBB1_151:                              #   in Loop: Header=BB1_144 Depth=1
	addi	a7, a7, 1
	seqz	a0, a7
	add	a6, a6, a0
	bne	a6, n8, .LBB1_143
# %bb.152:                              #   in Loop: Header=BB1_144 Depth=1
	sltu	a0, a7, n7
	bnez	a0, .LBB1_144
.LBB1_153:
	mv	a0, n2
	call	free
	slli	a0, n7, 4
	call	malloc
	mv	n2, a0
	blez	n7, .LBB1_166
# %bb.154:                              # %.preheader
	li	a2, 0
	li	a0, 0
	li	a1, 0
	li	a6, 0
	j	.LBB1_157
.LBB1_155:                              #   in Loop: Header=BB1_157 Depth=1
	slt	a5, a0, n8
.LBB1_156:                              #   in Loop: Header=BB1_157 Depth=1
	slli	a2, a2, 3
	add	a2, a2, n4
	lw	a2, 0(a2)
	srai	a3, a2, 31
	add	a1, a1, a2
	sltu	a2, a1, a2
	add	a3, a3, a6
	add	a6, a3, a2
	mv	a2, a4
	beqz	a5, .LBB1_159
.LBB1_157:                              # =>This Inner Loop Header: Depth=1
	slli	a4, a1, 4
	add	a4, a4, n3
	lw	a5, 4(a4)
	lw	a4, 0(a4)
	slli	a3, a2, 4
	add	a3, a3, n2
	sw	a5, 4(a3)
	sw	a4, 0(a3)
	or	a4, a1, a0
	sw	a4, 12(a3)
	addi	a4, a2, 1
	seqz	a5, a4
	add	a0, a0, a5
	sw	a2, 8(a3)
	bne	a0, n8, .LBB1_155
# %bb.158:                              #   in Loop: Header=BB1_157 Depth=1
	sltu	a5, a4, n7
	j	.LBB1_156
.LBB1_159:
	slli	n6, n7, 3
	mv	a0, n6
	call	malloc
	mv	n5, a0
	li	n9, 0
	li	n11, 0
	li	n10, 0
	li	n12, 0
	j	.LBB1_161
.LBB1_160:                              #   in Loop: Header=BB1_161 Depth=1
	slt	a0, n11, n8
	add	n10, n10, n13
	sltu	a1, n10, n13
	add	n12, n12, a1
	beqz	a0, .LBB1_163
.LBB1_161:                              # =>This Inner Loop Header: Depth=1
	slli	a0, n9, 4
	add	a0, a0, n2
	lw	a1, 8(a0)
	lw	a2, 12(a0)
	slli	a1, a1, 3
	add	a1, a1, n4
	lw	a0, 4(a1)
	lw	n13, 0(a1)
	slli	a1, n9, 3
	add	a1, a1, n5
	sw	a0, 4(a1)
	sw	n13, 0(a1)
	slli	a0, n10, 4
	add	a0, a0, n1
	slli	a1, a2, 4
	add	a1, a1, n3
	slli	a2, n13, 4
	call	memcpy
	addi	n9, n9, 1
	seqz	a0, n9
	add	n11, n11, a0
	bne	n11, n8, .LBB1_160
# %bb.162:                              #   in Loop: Header=BB1_161 Depth=1
	sltu	a0, n9, n7
	add	n10, n10, n13
	sltu	a1, n10, n13
	add	n12, n12, a1
	bnez	a0, .LBB1_161
.LBB1_163:
	slli	n7, n10, 4
	j	.LBB1_167
.LBB1_164:
	mv	a0, n1
	call	free
	mv	a0, n2
.LBB1_165:
	call	free
	li	n3, 0
	j	.LBB1_168
.LBB1_166:
	slli	n6, n7, 3
	mv	a0, n6
	call	malloc
	mv	n5, a0
	li	n7, 0
.LBB1_167:
	mv	a0, n4
	mv	a1, n5
	mv	a2, n6
	call	memcpy
	mv	a0, n3
	mv	a1, n1
	mv	a2, n7
	call	memcpy
	mv	a0, n1
	call	free
	mv	a0, n2
	call	free
	mv	a0, n5
	call	free
.LBB1_168:
	mv	a0, n3
	lw	ra, 188(sp)                     # 4-byte Folded Reload
	lw	n1, 184(sp)                     # 4-byte Folded Reload
	lw	n2, 180(sp)                     # 4-byte Folded Reload
	lw	n3, 176(sp)                     # 4-byte Folded Reload
	lw	n4, 172(sp)                     # 4-byte Folded Reload
	lw	n5, 168(sp)                     # 4-byte Folded Reload
	lw	n6, 164(sp)                     # 4-byte Folded Reload
	lw	n7, 160(sp)                     # 4-byte Folded Reload
	lw	n8, 156(sp)                     # 4-byte Folded Reload
	lw	n9, 152(sp)                     # 4-byte Folded Reload
	lw	n10, 148(sp)                    # 4-byte Folded Reload
	lw	n11, 144(sp)                    # 4-byte Folded Reload
	lw	n12, 140(sp)                    # 4-byte Folded Reload
	lw	n13, 136(sp)                    # 4-byte Folded Reload
	lw	n14, 132(sp)                    # 4-byte Folded Reload
	lw	n15, 128(sp)                    # 4-byte Folded Reload
	lw	n16, 124(sp)                    # 4-byte Folded Reload
	lw	n17, 120(sp)                    # 4-byte Folded Reload
	lw	n18, 116(sp)                    # 4-byte Folded Reload
	lw	n19, 112(sp)                    # 4-byte Folded Reload
	lw	n20, 108(sp)                    # 4-byte Folded Reload
	lw	n21, 104(sp)                    # 4-byte Folded Reload
	lw	n22, 100(sp)                    # 4-byte Folded Reload
	lw	n23, 96(sp)                     # 4-byte Folded Reload
	lw	n24, 92(sp)                     # 4-byte Folded Reload
	lw	n25, 88(sp)                     # 4-byte Folded Reload
	lw	n26, 84(sp)                     # 4-byte Folded Reload
	lw	n27, 80(sp)                     # 4-byte Folded Reload
	lw	n28, 76(sp)                     # 4-byte Folded Reload
	lw	n29, 72(sp)                     # 4-byte Folded Reload
	lw	n30, 68(sp)                     # 4-byte Folded Reload
	lw	n31, 64(sp)                     # 4-byte Folded Reload
	lw	n32, 60(sp)                     # 4-byte Folded Reload
	lw	n33, 56(sp)                     # 4-byte Folded Reload
	lw	n34, 52(sp)                     # 4-byte Folded Reload
	lw	n35, 48(sp)                     # 4-byte Folded Reload
	lw	n36, 44(sp)                     # 4-byte Folded Reload
	fld	fs0, 32(sp)                     # 8-byte Folded Reload
	fld	fs1, 24(sp)                     # 8-byte Folded Reload
	addi	sp, sp, 192
	ret
.Lfunc_end1:
	.size	mg_lchain_dp, .Lfunc_end1-mg_lchain_dp
                                        # -- End function
	.option	pop
	.option	push
	.option	arch, +a, +c, +m
	.globl	main                            # -- Begin function main
	.p2align	1
	.type	main,@function
main:                                   # @main
# %bb.0:
	addi	sp, sp, -128
	sw	ra, 124(sp)                     # 4-byte Folded Spill
	sw	n1, 120(sp)                     # 4-byte Folded Spill
	sw	n2, 116(sp)                     # 4-byte Folded Spill
	sw	n3, 112(sp)                     # 4-byte Folded Spill
	sw	n4, 108(sp)                     # 4-byte Folded Spill
	sw	n5, 104(sp)                     # 4-byte Folded Spill
	sw	n6, 100(sp)                     # 4-byte Folded Spill
	sw	n7, 96(sp)                      # 4-byte Folded Spill
	sw	n8, 92(sp)                      # 4-byte Folded Spill
	sw	n9, 88(sp)                      # 4-byte Folded Spill
	sw	n10, 84(sp)                     # 4-byte Folded Spill
	sw	n11, 80(sp)                     # 4-byte Folded Spill
	sw	n12, 76(sp)                     # 4-byte Folded Spill
	fsd	fs0, 64(sp)                     # 8-byte Folded Spill
	fsd	fs1, 56(sp)                     # 8-byte Folded Spill
	li	a2, 14
	bne	a0, a2, .LBB2_3
# %bb.1:
	lw	a0, 4(a1)
	mv	n12, a1
	call	atoi
	lw	a1, 8(n12)
	mv	n1, a0
	mv	a0, a1
	call	atoi
	lw	a1, 12(n12)
	mv	n2, a0
	mv	a0, a1
	call	atoi
	lw	a1, 16(n12)
	mv	n3, a0
	mv	a0, a1
	call	atoi
	lw	a1, 20(n12)
	mv	n4, a0
	mv	a0, a1
	call	atoi
	lw	a1, 24(n12)
	mv	n5, a0
	mv	a0, a1
	call	atoi
	lw	a1, 28(n12)
	mv	n6, a0
	mv	a0, a1
	call	atoi
	lw	a1, 32(n12)
	mv	n7, a0
	mv	a0, a1
	call	atof
	lw	a0, 36(n12)
	fcvt.s.d	fs0, fa0
	call	atof
	lw	a0, 40(n12)
	fcvt.s.d	fs1, fa0
	call	atoi
	lw	a1, 44(n12)
	mv	n8, a0
	mv	a0, a1
	call	atoi
	lw	a1, 48(n12)
	mv	n9, a0
	mv	a0, a1
	call	atoll
	lw	a3, 52(n12)
	mv	n10, a0
	mv	n11, a1
	li	a2, 10
	mv	a0, a3
	li	a1, 0
	call	strtoull
	lw	a3, 56(n12)
	sw	a1, 44(sp)
	sw	a0, 40(sp)
	li	a2, 10
	mv	a0, a3
	li	a1, 0
	call	strtoull
	sw	a1, 52(sp)
	sw	a0, 48(sp)
	addi	a0, sp, 32
	sw	a0, 24(sp)
	addi	a0, sp, 36
	sw	a0, 20(sp)
	addi	a0, sp, 40
	sw	a0, 16(sp)
	sw	n11, 12(sp)
	sw	n10, 8(sp)
	sw	n9, 0(sp)
	mv	a0, n1
	mv	a1, n2
	mv	a2, n3
	mv	a3, n4
	mv	a4, n5
	mv	a5, n6
	mv	a6, n7
	fmv.s	fa0, fs0
	fmv.s	fa1, fs1
	mv	a7, n8
	call	mg_lchain_dp
	beqz	a0, .LBB2_4
# %bb.2:
	lw	a3, 4(a0)
	lw	a2, 0(a0)
	lw	a5, 12(a0)
	lw	a4, 8(a0)
	lui	a0, %hi(.L.str.3)
	addi	a0, a0, %lo(.L.str.3)
	call	printf
	j	.LBB2_5
.LBB2_3:
	lui	a0, %hi(_impure_ptr)
	lw	a0, %lo(_impure_ptr)(a0)
	lw	a0, 12(a0)
	lw	a2, 0(a1)
	lui	a1, %hi(.L.str.2)
	addi	a1, a1, %lo(.L.str.2)
	call	fprintf
	li	a0, 1
	j	.LBB2_6
.LBB2_4:
	lui	a0, %hi(.Lstr)
	addi	a0, a0, %lo(.Lstr)
	call	puts
.LBB2_5:
	li	a0, 0
.LBB2_6:
	lw	ra, 124(sp)                     # 4-byte Folded Reload
	lw	n1, 120(sp)                     # 4-byte Folded Reload
	lw	n2, 116(sp)                     # 4-byte Folded Reload
	lw	n3, 112(sp)                     # 4-byte Folded Reload
	lw	n4, 108(sp)                     # 4-byte Folded Reload
	lw	n5, 104(sp)                     # 4-byte Folded Reload
	lw	n6, 100(sp)                     # 4-byte Folded Reload
	lw	n7, 96(sp)                      # 4-byte Folded Reload
	lw	n8, 92(sp)                      # 4-byte Folded Reload
	lw	n9, 88(sp)                      # 4-byte Folded Reload
	lw	n10, 84(sp)                     # 4-byte Folded Reload
	lw	n11, 80(sp)                     # 4-byte Folded Reload
	lw	n12, 76(sp)                     # 4-byte Folded Reload
	fld	fs0, 64(sp)                     # 8-byte Folded Reload
	fld	fs1, 56(sp)                     # 8-byte Folded Reload
	addi	sp, sp, 128
	ret
.Lfunc_end2:
	.size	main, .Lfunc_end2-main
                                        # -- End function
	.option	pop
	.type	.L.str,@object                  # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"minimap_code/chaining.c"
	.size	.L.str, 24

	.type	.L__func__.mg_chain_backtrack,@object # @__func__.mg_chain_backtrack
.L__func__.mg_chain_backtrack:
	.asciz	"mg_chain_backtrack"
	.size	.L__func__.mg_chain_backtrack, 19

	.type	.L.str.1,@object                # @.str.1
.L.str.1:
	.asciz	"n_v < INT32_MAX"
	.size	.L.str.1, 16

	.type	.L.str.2,@object                # @.str.2
.L.str.2:
	.asciz	"Usage: %s max_dist_x max_dist_y bw max_skip max_iter min_cnt min_sc chn_pen_gap chn_pen_skip is_cdna n_seg n a n_u\n"
	.size	.L.str.2, 116

	.type	.L.str.3,@object                # @.str.3
.L.str.3:
	.asciz	"Result: x = %lu, y = %lu\n"
	.size	.L.str.3, 26

	.type	.Lstr,@object                   # @str
.Lstr:
	.asciz	"The function returned NULL"
	.size	.Lstr, 27

	.ident	"Ubuntu clang version 14.0.0-1ubuntu1.1"
	.section	".note.GNU-stack","",@progbits
