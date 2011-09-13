# Makefile for deploing unix configs to system
# (c) Max "leon" Lvov
#

# rc files list
USERDIR=home
BASE=.vim/ .vimrc .screenrc .zshrc .gitconfig .config/
WMII=.wmii/
FLUX=.fluxbox/

# global configs
SYSDIR=sys
GMAKE=/etc/make.conf
GPORT=/etc/portage/
VEDRO=/usr/src/linux/.config

USER=$(BASE) $(WMII) $(FLUX)
SYS=$(GMAKE) $(GPORT) $(VEDRO)

all : base sys wmii fluxbox

get : 
	for RC in $(USER); do \
		[ -e ~/$$RC ] && cp -ar ~/$$RC .; \
	done
	for GC in $(SYS); do \
		[ -e $$GC ] && cp -ar $$GC $(SYSDIR); \
	done

base :
	cp -ar $(BASE) ~/
sys  :
	for GC in $(SYS); do \
		[ -e ~/$$GC ] && cp -ar $$GC .; \
	done
wmii :
	cp -ar $(USERDIR)$(WMII) ~/
flux :
	cp -ar $(USERDIR)$(FLUX) ~/

list :
	echo "all\nget\n"
