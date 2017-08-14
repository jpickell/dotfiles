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
export LOCATION=$(locateme)
export HISTTIMEFORMAT="%Y%m%d%H%M%S "
export TERM=xterm-color
export PATH=$PATH:/sbin:/usr/sbin:/usr/local/bin:/usr/local/sbin:$HOME/bin
export MANPATH=$MANPATH:/usr/man
export BROWSER="lynx"
export GCAL="/usr/local/bin/gcalcli"

if [ -f "/etc/dircolors" ]
then
  eval $(dircolors -b /etc/dircolors)
  if [ -f "$HOME/.dircolors" ]
  then
    eval $(dircolors -b $HOME/.dircolors)
  fi
fi

#-- Keyboard aliases --#
### Misc Aliases ###
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
alias news="newsbeuter -r"
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

### Puppet Aliases ###
alias pupt='puppet agent -t'
alias eyamlprd='ln -fs ~/Workspace/Puppet/keys/eyaml/prdpemaster01/public_key.pkcs7.pem ~/Workspace/Puppet/keys/eyaml; rm -f ~/Workspace/Puppet/keys/eyaml/private_key.pkcs7.pem'
alias eyamlvag='ln -fs ~/Workspace/Puppet/keys/eyaml/vagrant/public_key.pkcs7.pem ~/Workspace/Puppet/keys/eyaml; ln -fs ~/Workspace/Puppet/keys/eyaml/vagrant/private_key.pkcs7.pem ~/Workspace/Puppet/keys/eyaml'

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

### GcalCLI Aliases ###
alias week='$GCAL calw'
alias month='$GCAL calm'
alias agenda='$GCAL agenda'

### END ALIASES ###

source ~/.colors 
rst='\e[0m'    # Text Reset

### OS Specific Aliases / Configs ###
case "$UNAME" in
   Linux) 
	alias vi="vim"
	export EDITOR=vim
	# Added logging per https://spin.atomicobject.com/2016/05/28/log-bash-history/
	export PROMPT_COMMAND='if [ "$(id -u)" -ne 0 ]; then echo "$(date "+%Y-%m-%d.%H:%M:%S") $(pwd) $(history 1)" >> ~/.logs/bash-history-$(date "+%Y-%m-%d").log; fi; echo -ne "\033]0;$P $LOGNAME@$HOSTNAME $P\007"'
        ;;
   Darwin) 
	alias o="open"
	alias gs="git-switch"
	alias hh="ssh home"
	alias vi="mvim"
        alias va="mvim --remote-tab"
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
}

nls() { 
	ls -c ~/Documents/Notes/ | grep "$*" 
}

wr () { if [ $* ] 
	    then 
		$EDITOR "$*".txt 
	    else 
		$EDITOR `date +%m%d%Y`.txt 
	fi
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

set -o vi
