#


help:
	@echo No help here

install:	.dirs .bin

.bin:
	(cd make; make install)

.dirs:	
	mkdir -p bin opt status

cvsu:
	cvsu | grep ^M

