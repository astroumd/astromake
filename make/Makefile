#  

FTPDIR = astro
TARNAME = $(FTPDIR)/astromake.tar.gz
#

SRCBIN = astromake wwwget
DESTBIN = /usr/local/bin

VERSION = 0.98


#	fake this line....
help:
	@echo astromake $(VERSION)

export:
	echo `date` `whoami`@`hostname` > version
	@tar -C / -zcf $(TARNAME) /usr/local/astro \
	    --exclude /usr/local/astro/status  \
   	    --exclude /usr/local/astro/packages
	@echo Wrote $(TARNAME)

install:
	cp $(SRCBIN) $(DESTBIN)

remote:
	make export TARNAME=/tmp/astromake.tar.gz
	scp /tmp/astromake.tar.gz  teuben@apus.astro.umd.edu:/home/ftp/pub/astro

diff:
	@for i in $(SRCBIN); do \
	  diff $$i  $(DESTBIN); done
