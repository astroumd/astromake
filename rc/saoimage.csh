# no need to source anything, since it's in /usr/local/{bin,lib} etc.
# NRAO's .rpm version dumps it in /usr/X11/bin though, so be careful
# you don't wind up with two versions


if (-e /usr/X11R6/bin/saoimage && -e /usr/local/bin/saoimage) then
  echo You seem to have two versions of saoimage present:
  echo  /usr/X11R6/bin/saoimage /usr/local/bin/saoimage
endif
