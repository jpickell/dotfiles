# .zshrc version 1.0 01/01/2020 jkp
export PATH=$PATH:/sbin:/usr/sbin:/usr/local/bin:/usr/local/sbin:$HOME/bin
export ZSH=$HOME/".oh-my-zsh"
ZSH_THEME="jkp"
DISABLE_AUTO_TITLE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"
# DISABLE_UPDATE_PROMPT="true"
# export UPDATE_ZSH_DAYS=13

HIST_STAMPS="yyyy.mm.dd"
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
    ;;
    Darwin)
      export EDITOR='mvim'
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

#precmd() { print -Pn "\e]0;$*\a" }

#------------------
# Various Functions
#------------------
#
# Lets declare some vars here so we only do it once, instead of 
# multiple times in each function.
TODAY=`date +%Y-%m-%d`
YESTERDAY=`date -v-1d +%F`
YEAR=`date +%Y`
YMONTH=`date +%Y-%m`

# Archive older notes to the appropriate Year folder
ARCHIVE=`find . -name "$YEAR*" -d 1 -type f -atime 12`

if [ $#ARCHIVE -gt 0 ]
  then
    for a in $(echo $ARCHIVE); do
      echo "Archiving $a"
      mv $NOTESDIR/$a $NOTESDIR/$YEAR/
    done
fi

# Notes - Edit new or existing, defaults to .md
n() { 
  if [ $* ]
    then
      # Strip the file extension and use .md always
      file=$*:r
      $EDITOR $NOTESDIR/"$file".md
    else # The file exists, so open it in insert mode and add a timestamp.
      if [ ! -f $* ]  # Don't add a newline above the date if the file is new
        then 
          #$EDITOR +star -c '$r!date +\%T;echo' $NOTESDIR/`date +%Y-%m-%d`.md
          $EDITOR +star -c '$r!date +\%T;echo' $NOTESDIR/$TODAY.md
        else
          #$EDITOR +star -c '$r!echo;date +\%T;echo' $NOTESDIR/`date +%Y-%m-%d`.md
          $EDITOR +star -c '$r!echo;date +\%T;echo' $NOTESDIR/$TODAY.md
      fi
  fi
}

# Notes - List all notes (trim off extension for now)
nl() {
  command clear 
  echo " "
  FILES=""
  DIRS=""
  if [ $* ]
      # Handle subdirectories
      then
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
        
        for d in $DIRS; do
          #echo "[" $d "]"
          printf ' [ %-15s ]\n' $d
          FLIST=`ls -c $NOTESDIR/$d|sed s/\ /_/g`
          #for fl in $(echo $FLIST); do
          #  echo " "$fl:r
          #done
        done
        echo " " 

        for fl in $(echo $FILES); do
          echo " - "$fl:r
        done
  fi
}



# Notes - Search for notes 
ns() { 
	if [ $* ]
	    then
		    grep -i $* $NOTESDIR/*.md
	    else
        echo "Please enter a search term\n\nns <search term>"
	fi
}

# Notes View - Show the contents of a given note 
nv() {
	if [ $* ]
	    then 
		cat $NOTESDIR/*.md
	    else
		echo "Please provide the name of a note to view\n\nnv <notename>"
	fi
}

# Notes View - Show the contents of yesterday's note
yn() {
  YN=`date -v-1d +%F`
  view $NOTESDIR/$YN.md
}

# Notes View - Show the contents of Friday's note
# so three days ago if its a Monday.  This should 
# get re-writted to allow for params to choose any
# day from the past week/month, etc
# Would be nice to have some sort of chooser menu
fn() {
  YN=`date -v-3d +%F`
  view $NOTESDIR/$YN.md
}
