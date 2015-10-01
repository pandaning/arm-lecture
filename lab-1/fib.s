	.syntax unified
	.arch armv7-a
	.text
	.align 2
	.thumb
	.thumb_func

	.global fibonacci
	.type fibonacci, function

fibonacci:
	@ ADD/MODIFY CODE BELOW
	@ PROLOG
	push {r3, lr}
	
    cmp r0,#0		@if term<=0
    ble .L3			@if(term<=0) goto .L3 (return 0)

	cmp r0, #1		@if term = 1
	beq .L4			@if(term==1) goto.L4 (return 1)

	sub r0, r0, #1		@term = term - 1
	add r3, r1, r2		@r3 = val + prev
	add r2, r1, #0		@prev = val
	mov r1,r3		@val = r3
	bl fibonacci		@return fib(term-1,val+prev,val)
	pop {r3, pc}
	@EPILOG
	@ END CODE MODIFICATION
.L3:
	mov r0, r2			@ R0 = prev(=0)
	pop {r3, pc}	@ EPILOG

.L4:
	mov r0, r1			@ R0 = val(=1)
	pop {r3, pc}	@ EPILOG

	.size fibonacci, .-fibonacci
	.end
