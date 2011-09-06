# Makefile for deploing unix configs to system
# (c) Max "leon" Lvov
#

# rc files list
BASE=~/.vim/ ~/.vimrc ~/.screenrc ~/.zshrc ~/.gitconfig
WMII=~/.wmii/

GET=$(BASE) $(WMII)

all : base wmii

get : 
	for RC in $(GET); do \
		[ -e $$RC ] && cp -r $$RC .; \
	done

base :
	cp -r $(BASE) ~

wmii :
	cp -r $(WMII) ~/

list :
	echo "all\nget\n"
