#--------------------------------------#
# .bashrc 
# 
# https://github.com/jpickell/dotfiles
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
alias wwt="ssh wwt"

source ~/.colors 
rst='\e[0m'    # Text Reset

case "$UNAME" in
   Linux) 
	alias vi="vim"
	export EDITOR=vim
        ;;
   SunOS) 
	alias vi="vi"
	export EDITOR=vi
	export TERM=xterm
	export PATH=$PATH::/usr/sfw/bin:/opt/csw/bin
	export MANPATH=$MANPATH:/opt/csw/man:/opt/redhat/rhn/solaris/man
        ;;
   Darwin) 
	alias vi="mvim"
        alias va="mvim --remote-tab"
	alias o="open"
	alias synergy="/Applications/Synergy.app/Contents/MacOS/synergyc pickellj.wwt.com"
	alias z="open -a /System/Library/Frameworks/ScreenSaver.framework/Versions/A/Resources/ScreenSaverEngine.app"
	alias gnote="vi -c Geeknote"
	export EDITOR=mvim
	export CLICOLOR=1
	export GOPATH=$HOME/bin/gocode
        ;;
esac

n() { 
	$EDITOR ~/Notes/"$*".txt 
}

nls() { 
	ls -c ~/Notes/ | grep "$*" 
}

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

export PROMPT_COMMAND='echo -ne "\033]0;$P $LOGNAME@$HOSTNAME $P\007"';
