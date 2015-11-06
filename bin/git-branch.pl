#!/usr/bin/perl

# [git@prodgithub01.wwt.com:pickellj/dots.git - refs/heads/master]

if ( ! -e "/usr/bin/git" ){ die "$!" }

chomp($branch=`git symbolic-ref HEAD|cut -f3 -d'/'`);
@repo=split(/[@\.:\/\/]/, `git config --get remote.origin.url`);

if ($repo[0] == "git"){
	$remote = $repo[1];
}

if ($repo[0] == "https"){
	$remote = $repo[1];
}

print ("\n[$Frame$remote - $branch]\n");

