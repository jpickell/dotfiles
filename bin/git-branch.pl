#!/usr/bin/perl

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

if ($repo[0] =~  m/ssh/){
	$remote = $repo[4];
}

print ("[$Frame$remote - $branch]\n");

