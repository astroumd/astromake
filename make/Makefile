#  

FTPDIR = astro
TARNAME = $(FTPDIR)/astromake.tar.gz
#

SRCBIN = astromake wwwget
#DESTBIN = $(ASTROMAKE)/bin
DESTBIN = ../bin

VERSION = `cat ../VERSION`


#	fake this line....
help:
	@echo astromake $(VERSION)

export_olc:
	echo `date` `whoami`@`hostname` > version
	@tar -C / -zcf $(TARNAME) /usr/local/astro \
	    --exclude /usr/local/astro/status  \
   	    --exclude /usr/local/astro/opt
	@echo Wrote $(TARNAME)

install:
	cp $(SRCBIN) $(DESTBIN)

remote:
	make export TARNAME=/tmp/astromake.tar.gz
	scp /tmp/astromake.tar.gz  teuben@apus.astro.umd.edu:/home/ftp/pub/astro

diff:
	@for i in $(SRCBIN); do \
	  diff $$i  $(DESTBIN); done
