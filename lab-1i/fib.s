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
	push {r3, r4, r5, lr}
	subs r3, r0, #0 @ r3 = r0 - 0
	mov r4, #0 @previous
	mov r5, #1 @result = 1
	cmp r4, r3 @compare r4 and r3 
	ble .L5 @goto for loop

	pop {r3, r4, r5, pc}
	@EPILOG
	@ END CODE MODIFICATION
.L5:
	adds r0, r4, r5 @sum = result + previous
	adds r4, r5, #0 @previous = result + 0
	adds r5, r0, #0 @result = sum + 0
	subs r3, r3, #1 @i--
	cmp r3, #1      @if r3(i) > 1
	bgt .L5 	@loop
	pop {r3, r4, r5, pc}

@
@fibonacci:
@	@ ADD/MODIFY CODE BELOW
@	@ PROLOG
@	push {r3, r4, r5, lr}
@	subs r3, r0, #0 @ i = r0 - 0
@	mov r4, #-1 @previous = -1
@	mov r5, #1 @result = 1
@	add r4, r4, #1 @for compare
@	cmp r3, r4 @compare r4 and r3  (if (previous < i) =>if(i>-1)
@	bgt .L5    @if(i>=0) loop
@	pop {r3, r4, r5, pc}
@	@EPILOG
@	@ END CODE MODIFICATION
@

