# .zshrc version 1.0 01/01/2020 jkp
export PATH=$PATH:/sbin:/usr/sbin:/usr/local/bin:/usr/local/sbin:$HOME/bin
export ZSH=$HOME/".oh-my-zsh"
ZSH_THEME="jkp"
DISABLE_AUTO_TITLE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"
# DISABLE_UPDATE_PROMPT="true"
# export UPDATE_ZSH_DAYS=13

#HIST_STAMPS="yyyy.mm.dd"
ZSH_DISABLE_COMPFIX=true

plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration
export NOTESDIR="$HOME/Notes"
# export MANPATH="/usr/local/man:$MANPATH"

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
else
  case `uname` in
    Linux)
      	export EDITOR='gvim'
      	export YESTERDAY=`date --date="1 day ago" +%Y-%m-%d`
	alias au='apt update'
	alias auu='apt upgrade'
	alias as='apt search'
	alias ai='apt install'
	alias ar='apt remove'
	alias al='apt list --upgradable'
    ;;
    Darwin)
      	export EDITOR='mvim'
     	export YESTERDAY=`date -v-1d +%F`
        alias bu='brew update'
        alias bs='brew search'
        alias bi='brew install'
        alias br='brew remove'
        alias bl='brew list'
    ;;
  esac
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

alias zshconfig="vi ~/.zshrc"
alias ohmyzsh="vi ~/.oh-my-zsh"
alias tsftp="sftp -i $HOME/Documents/Tanium/Local_Machine/tancopy_id_rsa"
alias c="clear"
alias h="history"
alias more="less"
alias l="less"
alias s="sudo -Es"
alias lsd="ls -al|grep ^d"
alias vi=$EDITOR
alias weather="curl wttr.in/63366"
alias moon="curl wttr.in/moon"
alias webshare="python -m SimpleHTTPServer 8888"
alias pipup='pip list --outdated | grep -v "^\-e" | cut -d " " -f 1  | xargs -n1 pip install --upgrade'


#precmd() { print -Pn "\e]0;$*\a" }

#------------------
# Various Functions
#------------------
#
# Lets declare some vars here so we only do it once, instead of 
# multiple times in each function.

# Dates need to be functionalized so that they can be called and updated 
# from time to time (and not just when a new shell is spawned)
WIDTH=`tput cols`
HEIGHT=`tput lines`

dt() {
  TODAY=`date +%Y-%m-%d`
  YEAR=`date +%Y`
  MONTH=`date +%B`
  DAY=`date +%a`
  DN=`date +%d`
  YMONTH=`date +%Y-%m`
}

# Call dt to set initial date
dt

# print out the week, highlight today
pw() {
  DAYS="Sun Mon Tue Wed Thu Fri Sat"
  printf "\n"
  printf " $fg_bold[$root]$MONTH $DN$reset_color\n"
  for d in $(echo $DAYS); do
    if [ $d = $DAY ];
    then
      printf " $fg_bold[$root]$d$reset_color  "
    else
      printf " $d  "
    fi
  done
  printf "\n\n"
}

# Workspace navigator
ws() { 
  if [ $* ]
  then
    cd ~/Workspace/$*;clear
  else
    C=1
    printf "\n\n $fg_bold[$root]Workspaces$reset_color\n"
    REPOS=`ls ~/Workspace/`
    for r in $(echo $REPOS); do
      if [ $((C%4)) -gt 0 ]; then
        printf " $fg_bold[$root]# $reset_color"
        printf '%-14s' $r
      else
        printf " $fg_bold[$root]# $reset_color"
        printf '%-14s\n' $r
      fi
    C=$((C+1))
    done
  fi
}

# World Clocks
cl(){
  TIMEZONES="HongKong Pacific Mountain Central Eastern London"

  HongKong=(`TZ=:HongKong date +%T`)
  Pacific=`TZ=:America/Los_Angeles date +%T`
  Mountain=`TZ=:America/Denver date +%T`
  Central=`TZ=:America/Chicago date +%T`
  Eastern=`TZ=:America/New_York date +%T`
  London=`TZ=:Europe/London date +%T`

  # Print the headers 
  for TZ in $(echo $TIMEZONES); do
    if [ $TZ = "Central" ]; then
      CTZ="$fg_bold[$root]$CTZ$reset_color "
      printf "$fg_bold[$root]"
      printf ' %-14s' $TZ
      printf "$reset_color"
    else
      printf ' %-14s' $TZ
    fi
  done
  printf "\n"

  # Print the time
  #for TZ in $(echo $TIMEZONES); do
  #  ZONE = $(echo $TZ)
  #  printf ' %-14s' $ZONE
  #done
  printf ' %-14s %-14s %-14s' $HongKong $Pacific $Mountain
  printf "$fg_bold[$root]"
  printf ' %-14s' $Central
  printf "$reset_color"
  printf ' %-14s %-14s\n' $Eastern $London
  printf '\n'
}

# Archive older notes to the appropriate Year folder
an() {
  # - Need to update to account for 2020-12-31.md, etc
  ARCHIVE=`find $(echo $NOTESDIR)/ -maxdepth 1 -name "$YEAR*" -type f -mtime 1`

  if [ $#ARCHIVE -gt 0 ]
    then
      for a in $(echo $ARCHIVE); do
        echo "Archiving $a"
        mv $a $NOTESDIR/$YEAR/
      done
  fi
}

# Notes - Edit new or existing, defaults to .md
n() { 
  dt
  an

  if [ $* ]
    then
      # Strip the file extension and use .md always
      file=$*:r
      if [ -d $NOTESDIR/$file ]
      then
        $EDITOR $NOTESDIR/$file/$TODAY.md
      else
        $EDITOR $NOTESDIR/"$file".md
      fi
    else # The file exists, so open it in insert mode and add a timestamp.
      if [ ! -f $* ]  # Don't add a newline above the date if the file is new
        then 
        # Check to see if the arg matches a directory, and then 
        # modify the location so that the TODAY file gets created in the 
 	      # proper directory so we don't have to specify DIR/$TODAY
          $EDITOR +star -c '$r!date +\%T;echo' $NOTESDIR/$TODAY.md
        else
          $EDITOR +star -c '$r!echo;date +\%T;echo' $NOTESDIR/$TODAY.md
      fi
  fi
}

# Notes - List all notes (trim off extension for now)
nl() {
  dt
  an
  command clear 

  echo " "
  FILES=""
  DIRS=""
  if [ $* ]
    # Handle subdirectories
  then
    # Test to see if we're enumerating a dir or a file
    echo $NOTESDIR/$* "\n----"
    ls -c $NOTESDIR/$*|cut -f1 -d'.'
  else 
	  ITEMS=`ls -c $NOTESDIR | cut -f1 -d'.'`
    for f in $( echo "$ITEMS"); do 
      if [[ -d $NOTESDIR/$f ]]
      then 
        DIRS+=( $f )
      else
        FILES+=( $f )
      fi
    done
        
    NUM=${#DIRS[@]}
    CWIDTH=14
    COLS=$(($WIDTH/20))

    C=1

    for d in $DIRS; do
      FC=`ls $NOTESDIR/$d|wc -l`
      if [ $((C%4)) -gt 0 ]
      then 
	      printf " $fg_bold[$root][ $reset_color"
        printf '%-14s' $d
        printf "$(echo $FC)"
	      printf " $fg_bold[$root]]$reset_color"
      else
	      printf " $fg_bold[$root][ $reset_color"
        printf '%-14s' $d
        printf "$(echo $FC)"
	      printf " $fg_bold[$root]]$reset_color\n"
      fi
      
      C=$((C+1))
    done
    printf '\n\n'

    C2=1
    for fl in $(echo $FILES); do
      if [ $((C2%3)) -gt 0 ]
      then
	      printf " $fg_bold[$root]> $reset_color"
        printf '%-20s ' $fl
      else
	      printf " $fg_bold[$root]> $reset_color"
        printf "$fl\n"
      fi
      C2=$((C2+1))
    done
  ws
  pw 
  cl
  
  fi
}

# Notes - Search for notes 
# Currently only searches the top level, does not descend directories
ns() { 
	if [ $* ]
	    then
        ITEMS=`find $NOTESDIR/ -name "*.md"`
        for i in $(echo "$ITEMS"); do
		      S=`grep -i $* $i`
          if [[ $? -lt 1 ]]
          then
            echo "$fg_bold[$root]$i $reset_color \n$S\n" #$fg_bold[$root].$reset_color\n"
          fi
        done
	    else
        echo "Please enter a search term\n\nns <search term>"
	fi
}

# Notes View - Show the contents of a given note 
nv() {
	if [ $* ]
	    then 
		view $NOTESDIR/$*.md
	    else
		echo "Please provide the name of a note to view\n\nnv <notename>"
	fi
}

# Notes View - Show the contents of yesterday's note
yn() {
  view $NOTESDIR/$YEAR/$YESTERDAY.md
}

# ASDF Configs
# https://asdf-vm.com/
. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash
