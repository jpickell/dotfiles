export UNAME=$(uname)
export HOSTNAME=$(hostname)
export EDITOR=vi
export HISTSIZE=2000;

# Make MAN pages look better, with some color and formatting.
export LESS_TERMCAP_mb=$'\e[01;31m'
export LESS_TERMCAP_md=$'\e[01;38;5;74m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[38;5;246m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[04;38;5;146m'

# Set various OS specific parameters here based on uname
case "$UNAME" in
        Linux)  alias vi="vim"
                export PATH=$PATH:/sbin:/usr/sbin:/usr/local/bin:/usr/local/sbin:/usr/sfw/bin:/opt/csw/bin:/home/pickellj/bin:/usr/ccs/bin
                export MANPATH=$MANPATH:/usr/man:/opt/csw/man:/opt/redhat/rhn/solaris/man
                ;;
        SunOS)  alias vi="vi"
                export TERM="vt100"
                ;;
        Darwin) alias vi="mvim"
                alias va="mvim --remote-tab"
                export PATH=$PATH:/sbin:/usr/sbin:/usr/local/bin:/usr/local/sbin:/usr/sfw/bin:/opt/csw/bin:/Users/pickellj/bin:/usr/ccs/bin
                ;;
esac

# Colorize ALL THE THINGS!!!
if [ -f "/etc/dircolors" ]
then
  eval $(dircolors -b /etc/dircolors)
  if [ -f "$HOME/.dircolors" ]
  then
    eval $(dircolors -b $HOME/.dircolors)
  fi
fi
export CLICOLOR=1

# My local .colors file
source ~/.colors 

rst='\e[0m'    # Text Reset

# Set the color of the hostname (hc) in the prompt based on matching the first characters of the name 
case "$HOSTNAME" in
        sand*) hc=$Cyan
                ;;
        snd*) hc=$Cyan
                ;;
        dev*) hc=$Green
                ;;
        test*) hc=$Yellow
                ;;
        tst*) hc=$Yellow
                ;;
        prod*) hc=$Red
                ;;
        prd*) hc=$Red
                ;;
        *) hc=$White
esac
frame=$hc;

# check for sudo 

# If we've sudo'd to a root prompt then colorize the name portion of the 
# prompt red and set the terminal name with bangs!!!
case $UID in
        0 ) root=$BRed;p=#;P=!!!;;
        * ) root=$White;p=\$;P=;; 
esac

# Now lets see if git is installed and if it is, show the branch name
# when in a git-controlled directory
if [ -f "/usr/bin/git" ]; then 

function git-branch-name {
	git symbolic-ref HEAD 2>/dev/null | cut -d"/" -f 3
}

function git-branch-prompt {
	local branch=`git-branch-name`
        if [ $branch ]; then printf "\n[$Yellow%s$frame]\n" $branch; fi
}

else
        function git-branch-name { GIT="Not Installed"; }
        function git-branch-prompt { printf ""; }
fi


# Set the prompt and then the terminal window name
export PS1="\n\[$frame\][\[$root\]\u\[$frame\]@\[$hc\]\h\[$frame\]] [\[$root\]\d \T\[$frame\]] [\[$root\]\w\[$frame\]] \$(git-branch-prompt)\n\[$frame\]\[$root\]$p\[$frame\]\[$Colour_Off\] "
export PROMPT_COMMAND='echo -ne "\033]0;$P $LOGNAME@$HOSTNAME $P\007"'

# Keyboard aliases
alias lsd="ls -al|grep ^d|grep -v '\.'"
alias ld="ls -al|grep drw"
alias ll="ls -al"
alias cl="clear"
alias m="more"
alias ss="sudo -s"
alias lock="open -a /System/Library/Frameworks/ScreenSaver.framework/Versions/A/Resources/ScreenSaverEngine.app"
alias synergy="/Applications/Synergy.app/Contents/MacOS/synergyc pickellj.wwt.com"
alias webshare='python -m SimpleHTTPServer 8888'
# git aliases
alias ga="git add ."
alias gs="git status"
alias gc="git commit -m"
alias gp="git push"

