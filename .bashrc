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
export HISTTIMEFORMAT="%Y%m%d%H%M%S "
export TERM=xterm-color
export PATH=$PATH:/sbin:/usr/sbin:/usr/local/bin:/usr/local/sbin:$HOME/bin
export MANPATH=$MANPATH:/usr/man
export BROWSER="lynx"
export NOTESDIR="$HOME/Documents/Notes"

IFS='.' read -r -a SYSFULL <<< "$HOSTNAME"
SYSNAME=${SYSFULL[0]}
export SYSNAME

if [ -f "/etc/dircolors" ]
then
  eval $(dircolors -b /etc/dircolors)
  if [ -f "$HOME/.dircolors" ]
  then
    eval $(dircolors -b $HOME/.dircolors)
  fi
fi

#-- Keyboard aliases --#
### GENERIC Aliases ###
alias lsd="ls -al|grep ^d|grep -v '\.'"
alias ld="ls -al|grep drw"
alias ll="ls -al"
alias c="clear"
alias h="history"
alias more="less"
alias l="less"
alias s="sudo -Es"
alias weather="curl wttr.in/63366"
alias moon="curl wttr.in/moon"
alias webshare="python -m SimpleHTTPServer 8888"
alias pipup='pip list --outdated | grep -v "^\-e" | cut -d " " -f 1  | xargs -n1 pip install --upgrade' 

### Gopher Links ###
alias mefi='$BROWSER gopher://gopher.metafilter.com'
alias gwiki='$BROWSER gopher://gopherpedia.com'

### GPG Aliases ###
alias gpgls='gpg --list-secret-key'
alias gpgd='gpg --delete-key'
alias gpgds='gpg --delete-secret-key'

### Ansible Aliases ###
alias ap='ansible-playbook'
alias al='ansible-lint'

### Vagrant Aliases ###
alias vst='vagrant status'
alias vgst='vagrant global-status'
alias vup='vagrant up'
alias vssh='vagrant ssh'
alias vsus='vagrant suspend'
alias vdel='vagrant destroy'
alias vrdp='vagrant rdp'
alias vprune='vagrant global-status --prune'

### VirtualBox Aliases ###
alias listhdds='VBoxManage list hdds'
alias delhdd='VBoxManage closemedium disk $1 --delete'

### END GENERIC ALIASES ###

source ~/.colors 
rst='\e[0m'    # Text Reset

### OS Specific Aliases / Configs ###
case "$UNAME" in
   Linux) 
	export EDITOR=vi
	alias vi="gvim"
        alias va="gvim --remote-tab $*"
	alias au='apt update'
	alias auu='apt upgrade'
	alias as='apt search'
	alias ai='apt install'
	alias ar='apt remove'
	alias alu='apt list --upgradable'

	# Added logging per https://spin.atomicobject.com/2016/05/28/log-bash-history/
	export PROMPT_COMMAND='if [ "$(id -u)" -ne 0 ]; then echo "$(date "+%Y-%m-%d.%H:%M:%S") $(pwd) $(history 1)" >> ~/.logs/$SYSNAME-bash-history-$(date "+%Y-%m-%d").log; fi; echo -ne "\033]0;$P $LOGNAME@$HOSTNAME $P\007"'
        ;;
   Darwin) 
	alias o="open"
	alias gs="git-switch"
	alias hh="ssh home"
	alias cat="ccat"
	alias vi="mvim"
        alias va="mvim --remote-tab"
	alias zz="open -a /System/Library/Frameworks/ScreenSaver.framework/Versions/A/Resources/ScreenSaverEngine.app"
	# export LOCATION=$(locateme)
	# export EDITOR=mvim
	export EDITOR=vi
	export CLICOLOR=1
	export GOPATH=$HOME/bin/gocode
	# Added logging per https://spin.atomicobject.com/2016/05/28/log-bash-history/
	export PROMPT_COMMAND='if [ "$(id -u)" -ne 0 ]; then echo "$(date "+%Y-%m-%d.%H:%M:%S") $(pwd) $(history 1)" >> ~/.logs/$SYSNAME-bash-history-$(date "+%Y-%m-%d").log; fi; echo -ne "\033]0;$P $LOGNAME@$HOSTNAME $P\007"'
        ;;
esac

#------------------
# Various Functions
#------------------

# Notes - Edit new or existing, defaults to .md
n() { 
	if [ $* ]
	    then
		$EDITOR $NOTESDIR/"$*".md
            else
		$EDITOR $NOTESDIR/`date +%m%d%Y`.md
        fi
}

# Notes - List all notes (trim off extension for now)
nls() { 
	ls -c $NOTESDIR | cut -f1 -d'.' 
}

# Notes - Search for notes 
ns() { 
	if [ $* ]
	    then
		grep -i $* $NOTESDIR/*.md
	fi
}

# Workspace navigator
W() { 
	if [ $* ]
		then
    			cd ~/Workspace/$*;clear
		else
			ls ~/Workspace/ 
	fi
}

# VPN Connect
vpnup () {
  PIDFILE="/var/run/openvpn.pid"
  if [ -f $PIDFILE ]
  then
    echo "OpenVPN already Running!"
  else
    sudo openvpn --daemon --writepid $PIDFILE --log-append /var/log/openvpn.log --config $HOME/Documents/vpn/smart_phone.ovpn 
  fi  
}

# VPN Disconnect
vpndown () {
  PIDFILE="/var/run/openvpn.pid"
  if [ -f $PIDFILE ]
  then
    PID=`cat $PIDFILE`
    sudo kill "$PID"
    sudo rm $PIDFILE
  else
    echo "OpenVPN does not appear to be running."
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
            export PS1="\n\[$frame\][\[$root\]\u\[$frame\] \$(vpncheck) \[$hc\]\h\[$frame\]] [\[$root\]\d \T\[$frame\]] [\[$root\]\w\[$frame\]]\n\$(git-branch.pl)\[$Red\]$p\[$frame\]\[$Color_Off\] "
            ;;

        * ) root=$BIBlue;
            p=\$;
            P=;
            export PS1="\n\[$frame\][\[$root\]\u\[$frame\] \$(vpncheck) \[$hc\]\h\[$frame\]] [\[$root\]\d \T\[$frame\]] [\[$root\]\w\[$frame\]]\n\$(git-branch.pl)\[$frame\]\[$root\]$p\[$frame\]\[$Color_Off\] "
            ;;

esac

set -o vi
if [ $TILIX_ID ] || [ $VTE_VERSION ] ; then source /etc/profile.d/vte.sh; fi # Ubuntu Budgie END

