#--------------------------------------#
# .bashrc 
# 
# https://github.com/jpickell/dotfiles
# https://gitlab.com/jpickell/dotfiles
#
#--------------------------------------#

export UNAME=$(uname)
export HOSTNAME=$(hostname)
export HISTSIZE=2000
export TERM=xterm-color
export PATH=$PATH:/sbin:/usr/sbin:/usr/local/bin:/usr/local/sbin:$HOME/bin
export MANPATH=$MANPATH:/usr/man

if [ -f "/etc/dircolors" ]
then
  eval $(dircolors -b /etc/dircolors)
  if [ -f "$HOME/.dircolors" ]
  then
    eval $(dircolors -b $HOME/.dircolors)
  fi
fi

# Keyboard aliases
alias lsd="ls -al|grep ^d|grep -v '\.'"
alias ld="ls -al|grep drw"
alias ll="ls -al"
alias c="clear"
alias h="history"
alias more="less"
alias l="less"
alias s="sudo -Es"
alias webshare="python -m SimpleHTTPServer 8888"
alias gpgd='gpg --delete-key'
alias gpgds='gpg --delete-secret-key'

source ~/.colors 
rst='\e[0m'    # Text Reset

case "$UNAME" in
   Linux) 
	alias vi="vim"
	export EDITOR=vim
	# Added logging per https://spin.atomicobject.com/2016/05/28/log-bash-history/
	export PROMPT_COMMAND='if [ "$(id -u)" -ne 0 ]; then echo "$(date "+%Y-%m-%d.%H:%M:%S") $(pwd) $(history 1)" >> ~/.logs/bash-history-$(date "+%Y-%m-%d").log; fi; echo -ne "\033]0;$P $LOGNAME@$HOSTNAME $P\007"'
        ;;
   SunOS) 
	alias vi="vi"
        alias s="sudo -E -s"
	export EDITOR=vi
	export TERM=xterm
	export PATH=$PATH::/usr/sfw/bin:/opt/csw/bin
	export MANPATH=$MANPATH:/opt/csw/man:/opt/redhat/rhn/solaris/man
	export PROMPT_COMMAND='echo -ne "\033]0;$P $LOGNAME@$HOSTNAME $P\007"';
        ;;
   Darwin) 
	alias o="open"
	alias fc="curl wttr.in"
	alias gnote="vi -c Geeknote"
	alias gs="git-switch"
	alias hh="ssh home"
	alias synergy="/Applications/Synergy.app/Contents/MacOS/synergyc pickellj.wwt.com"
	alias vi="mvim"
        alias va="mvim --remote-tab"
	alias ww="ssh work"
	alias pz="ssh prodzone1"
	alias zz="open -a /System/Library/Frameworks/ScreenSaver.framework/Versions/A/Resources/ScreenSaverEngine.app"
	export EDITOR=mvim
	export CLICOLOR=1
	export GOPATH=$HOME/bin/gocode
	# Added logging per https://spin.atomicobject.com/2016/05/28/log-bash-history/
	export PROMPT_COMMAND='if [ "$(id -u)" -ne 0 ]; then echo "$(date "+%Y-%m-%d.%H:%M:%S") $(pwd) $(history 1)" >> ~/.logs/bash-history-$(date "+%Y-%m-%d").log; fi; echo -ne "\033]0;$P $LOGNAME@$HOSTNAME $P\007"'
        ;;
esac

#------------------
# Various Functions
#------------------
n() { 
	if [ $* ]
	    then
		$EDITOR ~/Documents/Notes/"$*".txt
	else
		$EDITOR ~/Documents/Notes/`date +%m%d%Y`.txt
        fi

	#$EDITOR ~/Notes/"$*".txt 
}

nls() { 
	ls -c ~/Documents/Notes/ | grep "$*" 
}

W() { 
	if [ $* ]
		then
    			cd ~/Workspace/$*;clear
		else
			ls ~/Workspace/ 
	fi
}

# End Functions 
#------------------



case "$HOSTNAME" in
        sand*) hc=$Cyan;;
        snd*) hc=$Cyan;;
        dev*) hc=$Green;;
        test*) hc=$Yellow;;
        tst*) hc=$Yellow;;
        prod*) hc=$Red;;
        prd*) hc=$Red;;
        *) hc=$White
esac
frame=$hc;

case $UID in
        0 ) root=$Red;
            p=\#;
            P=!!!;
            export PS1="\n\[$frame\][\[$root\]\u\[$frame\] @ \[$hc\]\h\[$frame\]] [\[$root\]\d \T\[$frame\]] [\[$root\]\w\[$frame\]]\n\$(git-branch.pl)\[$Red\]$p\[$frame\]\[$Colour_Off\] "
            ;;

        * ) root=$White;
            p=\$;
            P=;
            export PS1="\n\[$frame\][\[$root\]\u\[$frame\] @ \[$hc\]\h\[$frame\]] [\[$root\]\d \T\[$frame\]] [\[$root\]\w\[$frame\]]\n\$(git-branch.pl)\[$frame\]\[$root\]$p\[$frame\]\[$Colour_Off\] "
            ;;

esac
