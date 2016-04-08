#!/usr/bin/perl

# [git@prodgithub01.wwt.com:pickellj/dots.git - refs/heads/master]
# https://prodgithub01.wwt.com/pickellj/dots.git

if ( ! -e "/usr/bin/git"){exit;}
if ( ! -d ".git"){exit;}

chomp($branch=`git symbolic-ref HEAD|cut -f3 -d'/'`);

@repo=split(/[\@\.:\/+]/, `git config --get remote.origin.url`);
@repo=split(/[\@:\/+]/, `git config --get remote.origin.url`);

#foreach $r (@repo){ print"$r\n"; }

if ($repo[0] == "git"){
	$remote = $repo[1];
}

if ($repo[0] =~  m/http/){
	$remote = $repo[3];
}

print ("[$Frame$remote - $branch]\n");

