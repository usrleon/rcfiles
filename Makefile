# Makefile for deploing unix configs to system
# (c) Max "leon" Lvov
#

# rc files list
USRDIST=home/
BASE=.vim/ .vimrc .screenrc .zshrc .gitconfig .config/
WMII=.wmii/
FLUX=.fluxbox/

# global configs
SYSDIST=sys/
GMAKE=/etc/make.conf
GPORT=/etc/portage/
VEDRO=/usr/src/linux/.config

USER=$(BASE) $(WMII) $(FLUX)
SYS=$(GMAKE) $(GPORT) $(VEDRO)

all : base sys wmii fluxbox

get : 
	for RC in $(USER); do \
		[ -e ~/$$RC ] && cp -ar ~/$$RC $(USRDIST); \
	done
	for GC in $(SYS); do \
		[ -e $$GC ] && cp -ar $$GC $(SYSDIST); \
	done

base :
	cp -ar $(BASE) ~/
sys  :
	for GC in $(SYS); do \
		[ -e ~/$$GC ] && cp -ar $$GC $(SYSDIST); \
	done
wmii :
	cp -ar $(USRDIST)$(WMII) ~/
flux :
	cp -ar $(USRDIST)$(FLUX) ~/

list :
	echo "all\nget\n"
