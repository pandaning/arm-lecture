CC	= arm-linux-gnueabihf-gcc
CFLAGS	= -O1 -Wall
LDFLAGS = -fno-stack-protector

objects	= fibseq.o fib.o

default: fibseq

.PHONY: default clean qemu

fibseq: $(objects)
	$(CC) $(LDFLAGS) -o $@ $^

fib.o: fib.s
fibseq.o: fibseq.c

%.o: %.c
	$(CC) -c $(CFLAGS) -o $@ $<

%.o: %.s
	$(CC) -c $(CFLAGS) -o $@ $<

clean:
	rm -f $(objects) fibseq

QEMU_CMD = qemu-arm -L /usr/arm-linux-gnueabihf ./fibseq &
CMD = yes 9 | $(call QEMU_CMD) && sleep 1
qemu: fibseq
	@num=1 ; x=0 ; y=1 ; z=0 ; \
	ans0=`yes 0 | $(call QEMU_CMD)` ; \
	echo $$ans0 ; \
	ans0=`echo $$ans0 | cut -d ' ' -f 7` ; \
	if [ "0" -eq "$$ans0" ] ; then \
		echo "O" ; \
	else \
		echo "X" ; \
	fi ; \
	while [ $$num -le 10 ] ; do \
		ans=`yes $$num | $(call QEMU_CMD)` ; \
		num=`expr $$num + 1` ; \
		echo $$ans ; \
		sleep 0.1 ; \
		ans=`echo $$ans | cut -d ' ' -f 7` ; \
		z=$$y ; y=`expr $$x + $$y` ; x=$$z ; \
#		echo "$$x" ; \
#		echo "$$y" ; \
#		echo "$$z" ; \
		if [ "$$x" -eq "$$ans" ] ; then \
			echo "O" ; \
		else \
			echo "X" ; \
		fi ; \
	done	
