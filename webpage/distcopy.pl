#!/usr/bin/perl
use strict;
use FastGlob;
use File::Basename;
chdir "download" or die $!;
my $symlink = "dTemplate";
foreach my $file (sort (FastGlob::glob("../../dTemplate*tar.gz"))) {
    system("unp",$file) == 0 or die $?;
    my $dirname = basename $file, ".tar.gz";
    unlink $symlink if -e $symlink;
    symlink $dirname, $symlink;
    unlink $file;
}
