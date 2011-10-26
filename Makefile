# Makefile for deploing unix configs to system
# (c) Max "leon" Lvov
#

# rc files list
<<<<<<< HEAD
USERDIR=home
=======
USRDIST=home/
>>>>>>> d65e27449c9c95ce3533c308f5b137fdbbc3812a
BASE=.vim/ .vimrc .screenrc .zshrc .gitconfig .config/
WMII=.wmii/
FLUX=.fluxbox/

# global configs
<<<<<<< HEAD
SYSDIR=sys
=======
SYSDIST=sys/
>>>>>>> d65e27449c9c95ce3533c308f5b137fdbbc3812a
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
<<<<<<< HEAD
		[ -e $$GC ] && cp -ar $$GC $(SYSDIR); \
=======
		[ -e $$GC ] && cp -ar $$GC $(SYSDIST); \
>>>>>>> d65e27449c9c95ce3533c308f5b137fdbbc3812a
	done

base :
	cp -ar $(BASE) ~/
sys  :
	for GC in $(SYS); do \
		[ -e ~/$$GC ] && cp -ar $$GC $(SYSDIST); \
	done
wmii :
<<<<<<< HEAD
	cp -ar $(USERDIR)$(WMII) ~/
flux :
	cp -ar $(USERDIR)$(FLUX) ~/
=======
	cp -ar $(USRDIST)$(WMII) ~/
flux :
	cp -ar $(USRDIST)$(FLUX) ~/
>>>>>>> d65e27449c9c95ce3533c308f5b137fdbbc3812a

list :
	echo "all\nget\n"
