freebsd_stuff() {
	export CLICOLOR="yes"
	export LSCOLORS="Hxfxcxdxbxegedabagacad"
	export PATH="$PATH:/usr/local/libexec/git-core/"
}

linux_stuff() {
        LS_COLORS='no=00:fi=00:di=01;37:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.svgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.lzma=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.dz=01;31:*.gz=01;31:*.bz2=01;31:*.bz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.rar=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:';
	export LS_COLORS
	alias ls='ls --color=auto'
	alias ll='ls -hl --color=auto'
	alias la='ls -a --color=auto'
	
	# ruby stuff
	export PATH="/var/lib/gems/1.8/bin/:/usr/lib/git-core/:${PATH}"
}

solaris_stuff() {
	export PATH="/opt/local/bin:/opt/local/sbin:/usr/sfw/bin:/usr/sfw/sbin:$PATH"
	export MANPATH="/usr/share/man:/opt/local/man:$MANPATH"
	alias ls='gls --color=auto'
	alias grep='ggrep'
}

darwin_stuff() {
	export CLICOLOR="yes"
	export LSCOLORS="Hxfxcxdxbxegedabagacad"
	
	export PATH="/opt/local/bin:/opt/local/libexec/git-core:$PATH"
}

uname=`uname`

case $uname in
	FreeBSD*)
		freebsd_stuff
		;;
	Linux*)
		linux_stuff
		;;
	SunOS*)
		solaris_stuff
		;;
	Darwin*)
		darwin_stuff
esac

git_prompt_info() {
	ref=$(git symbolic-ref HEAD 2> /dev/null) || return
	echo "[${ref#refs/heads/}]"
}

function cdp () {
    cd "$(python -c "import os.path as _, ${1}; \
        print _.dirname(_.realpath(${1}.__file__[:-1]))"
    )"
}

#fpath=(~/.zsh/functions $fpath)

setopt LOCAL_OPTIONS # allow functions to have local options
setopt LOCAL_TRAPS # allow functions to have local traps
#setopt CORRECT_ALL

#autoload -U ~/.zsh/functions/*(:t)
autoload colors zsh/terminfo
autoload -U colors
colors


# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
#export LC_MESSAGES="C"
unsetopt beep
bindkey -v
setopt prompt_subst
#PROMPT="(%D{%H:%M}) %n@%m:%~ $(git_prompt_info)% %#> "
#PROMPT='%{$fg_bold[green]%}%n@%m %{$fg[blue]%}%c %{$fg_bold[red]%}$(git_prompt_info)%{$fg[blue]%} %% %{$reset_color%}'
#PROMPT='(%D{%H:%M}) %n@%m:%~%{$fg_bold[cyan]%}$(git_prompt_info)%{$reset_color%} %#> ' #%% ' # %{$reset_color%}'
PROMPT='%n@%m:%~%# '
RPROMPT='(%D{%H:%M})%{$fg_bold[cyan]%}$(git_prompt_info)%{$fg_bold[red]%}%(?..[%?])%{$reset_color%}'



export PATH="/sbin:/usr/sbin:/usr/local/sbin:${HOME}/bin:${PATH}"
export PATH="/usr/games/bin:${PATH}"
# End of lines added by compinstall
# The following lines were added by compinstall

zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' menu select=5
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:kill:*' force-list always
zstyle ':completion:*:processes' command 'ps xuf'
zstyle ':completion:*:processes' sort false
zstyle ':completion:*:processes-names' command 'ps xho command'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# grep
export GREP_COLOR="auto"

# editor
export EDITOR="vim"
export PAGER="less"

alias cssh='ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no '

# fix keys
bindkey -e
bindkey '^[[A' up-line-or-search
bindkey '^[[B' down-line-or-search
case "$TERM" in
	screen*)
                bindkey '\e[1~' beginning-of-line       # Home
                bindkey '\e[4~' end-of-line		# End
                bindkey '\e[3~'	delete-char		# Del
		bindkey '\e[2~' overwrite-mode          # Insert
        ;;
        xterm)
                bindkey '\eOH' beginning-of-line        # Home
                bindkey '\eOF' end-of-line		# End
                bindkey '\e[3~'	delete-char		# Del
		bindkey '\e[2~' overwrite-mode          # Insert
	;;
esac

preexec () {
	if [[ "$TERM" == "screen" ]]; then
		local CMD=${1}
		echo -ne "\ek$CMD\e\\"
	fi
}
