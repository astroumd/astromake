# top level makefile for astromake

help:
	@echo "Nothing to be made, you can proceed with 'make install'"
	@echo "you may need to run config.status to regenerate config file"

install:	.dirs .bin

update:		.update .bin 

.bin:
	(cd make; make install)

.dirs:	
	mkdir -p bin lib include opt status

.update:
	cvs update

cvsu:
	cvsu | grep ^M

AVERSION = `cat VERSION`
DIST_DIR = astromake_$(AVERSION)
FTP_DIR = apus:/home/ftp/pub/astro
MSG = `date` `whoami`@`hostname` : `pwd` 

dist:
	rm -rf $(DIST_DIR)
	cvs -q export -D tomorrow -d $(DIST_DIR) astromake 2>&1 > /tmp/astromakedist.log
	echo "dist: $(MSG)" > $(DIST_DIR)/VERSION.dist
	tar -zcf $(DIST_DIR).tar.gz $(DIST_DIR)
	rm -rf $(DIST_DIR)

ftp:
	scp $(DIST_DIR).tar.gz $(FTP_DIR)

msg:
	echo $(MSG)
