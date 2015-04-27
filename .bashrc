HDIR=$home
export PATH=$PATH:/sbin:/usr/sbin:/usr/local/bin:/usr/local/sbin:/usr/sfw/bin:/opt/csw/bin:~/bin:/usr/ccs/bin
export EDITOR=vi
export MANPATH=$MANPATH:/opt/csw/man
export HISTSIZE=2000;
UNAME=$(uname)

if [ -f "/etc/dircolors" ]
then
  eval $(dircolors -b /etc/dircolors)
  if [ -f "$HDIR/.dircolors" ]
  then
    eval $(dircolors -b $HDIR/.dircolors)
  fi
fi

# Keyboard aliases
alias lsd="ls -al|grep ^d|grep -v '\.'"
alias ld="ls -al|grep drw"
alias ll="ls -als"
alias cls="clear"
alias m="more"
alias ss="sudo -Es"
alias webshare='python -m SimpleHTTPServer 8888'

case "$UNAME" in
        Linux) alias vi="vim"
                ;;
        SunOS) alias vi="vi"
		export TERM=xterm
		alias ss="sudo -s"
                ;;
        Darwin) alias vi="mvim"
                alias va="mvim --remote-tab"
                ;;
esac

source /home/pickellj/.colors

frame=$Cyan;
# check for sudo
case $UID in
        0 ) echo "I AM ROOT!";root=$BRed;p=#;P=!!!;;
        * ) root=$White;p=\$;P=;;
esac

function git-branch-name {
  git symbolic-ref HEAD 2>/dev/null | cut -d"/" -f 3
}
function git-branch-prompt {
  local branch=`git-branch-name`
  if [ $branch ]; then printf "\n[$Yellow%s$frame]\n" $branch; fi
}

export PS1="\n\[$frame\][\[$root\]\u\[$frame\]@\[$root\]\h\[$frame\]] [\[$root\]\d \T\[$frame\]] [\[$root\]\w\[$frame\]] \$(git-branch-prompt)\n\[$frame\]\[$root\]$p\[$frame\]\[$Colour_Off\] "
export PROMPT_COMMAND='echo -ne "\033]0;$P $LOGNAME@$HOSTNAME $P\007"'
