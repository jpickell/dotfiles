#!/usr/bin/perl

# This script will pull all of the active files into the repo to be synced
#

@files = `ls -a`;

foreach $f(@files){
	chomp $f;
	if(($f =~ /^\.[a-z]/)&&(! -l $f)&&($f ne ".git")){
		# need to make sure that the file isn't a symlink (.vimrc)
		if(! -l $f){
		print("copying $f to ~/$f\n");
		system("cp -pr $f ~/$f");
		print("cp -pr $f ~/$f\n");
		}
	}
}
