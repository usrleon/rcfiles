# Makefile for deploing unix configs to system
# (c) Max "leon" Lvov
#

# rc files list
BASE=.vim/ .vimrc .screenrc .zshrc .gitconfig
WMII=.wmii/
FLUX=.fluxbox/

# global configs
GMAKE=/etc/make.conf
GPORT=/etc/portage/

USER=$(BASE) $(WMII) $(FLUX)
SYS=$(GMAKE) $(GPORT)

all : base sys wmii fluxbox

get : 
	for RC in $(USER); do \
		[ -e ~/$$RC ] && cp -ar ~/$$RC .; \
	done
	for GC in $(SYS); do \
		[ -e $$GC ] && cp -ar $$GC .; \
	done

base :
	cp -ar $(BASE) ~/
sys  :
	for GC in $(SYS); do \
		[ -e ~/$$GC ] && cp -ar $$GC .; \
	done
	cp -ar `basename $(GMAKE)` $(GMAKE)
wmii :
	cp -ar $(WMII) ~/
flux :
	cp -ar $(FLUX) ~/

list :
	echo "all\nget\n"
