# top level makefile for astromake

help:
	@echo No help here

install:	.dirs .bin

.bin:
	(cd make; make install)

.dirs:	
	mkdir -p bin lib opt status

cvsu:
	cvsu | grep ^M

AVERSION = `cat VERSION`
DIST_DIR = astromake_$(AVERSION)

dist:
	rm -rf $(DIST_DIR)
	cvs -q export -D tomorrow -d $(DIST_DIR) astromake 2>&1 > /tmp/astromakedist.log
	tar -zcf $(DIST_DIR).tar.gz $(DIST_DIR)
	rm -rf $(DIST_DIR)
