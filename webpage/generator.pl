#!/usr/bin/perl
use dTemplate;
system("pod2html","--outfile=manual.html","--infile=download/dTemplate/dTemplate.pod");
my $index = define dTemplate "index.htm";
my $changes = define dTemplate "download/dTemplate/Changes";
$dTemplate::parse{DATE} = time;

$dTemplate::ENCODERS{dt} = sub { date(shift()) };

open OUT, ">index.html";
print OUT $index->parse(
    CHANGES => $changes->parse(),
);
close OUT;
