#!/bin/bash

if [ -f "/usr/bin/git" ]; then
function git-branch-name {
	git symbolic-ref HEAD 2>/dev/null | cut -d"/" -f 3
}
else
        function git-branch-name { GIT="Not Installed"; }
        function git-branch-prompt { printf ""; }
fi

function git-branch-prompt {
	branch=`git-branch-name`
        if [ $branch ]; then printf "\n[$Yellow%s$frame]\n" $branch; fi
}

echo $(git-branch-prompt)
