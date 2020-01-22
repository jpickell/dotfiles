case $UID in 
	0) root=red
           user="!!! %n !!!"
                ;;
	*) root=green
           user="%n @ %m" 
                ;;
esac
base=green

PROMPT=$'
[%{$fg_bold[$root]%}$user%{$reset_color%}] [%{$fg_bold[$base]%}%D{%c}%{$reset_color%}] [%{$reset_color%}%{$fg_bold[$base]%}%~%{$reset_color%}] $(git_prompt_info)\
%{$fg[blue]%}%{$fg_bold[blue]%}%#%{$reset_color%} '

#RPROMPT="[$D{%y/%m/%f}|%@]"

ZSH_THEME_GIT_PROMPT_PREFIX="[%{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}]"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}*%{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""
