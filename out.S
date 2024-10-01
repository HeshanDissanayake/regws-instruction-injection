.LBB3_4:                                   # @main
# %bb.0:
	addi	sp, sp, -288
	sd	ra, 280(sp)                     # 8-byte Folded Spill
regsw_c 001 000 001 001 000 000 000 
	sd	x1, 272(sp)
	sd	a1, 272(sp)                     # 8-byte Folded Spill
	sd	x2, 264(sp)                     # 8-byte Folded Spill
	sd	x3, 256(sp)                     # 8-byte Folded Spill
	lui	a1, %hi(.L__const.main.arr)
	addi	a1, a1, %lo(.L__const.main.arr)
	mv	a0, sp
	li	a2, 256
	call	memcpy
	lui	a0, %hi(.Lstr)
	addi	a0, a0, %lo(.Lstr)
regsw_c 100 110 000 010 000 100 100 
	call	puts
	lui	x1, %hi(.L.str)
	addi	x1, x1, %lo(.L.str)
	li	a1, 64
	mv	a0, x1
	call	printf
	addi	x3, sp, 4
	addi	x2, sp, 256
.LBB4_1:                                # =>This Inner Loop Header: Depth=1
regsw_c 010 010 000 110 011 000 000 
	lw	a1, 0(x3)
	mv	a0, x1
	call	printf
	addi	x3, x3, 4
	bne	x3, x2, .LBB4_1
# %bb.2:
	li	a0, 10
	call	putchar
	mv	a0, sp
regsw_c 100 000 000 000 000 000 100 
	li	a2, 63
	mv	x3, sp
	li	a1, 0
	call	quickSort
	lui	a0, %hi(.Lstr.4)
	addi	a0, a0, %lo(.Lstr.4)
	call	puts
	lui	x1, %hi(.L.str)
	addi	x1, x1, %lo(.L.str)
