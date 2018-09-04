#!/usr/bin/perl

use strict;
use warnings;

my $myfile = "commands.steps";
open(my $steps, "<", $myfile)
    or die("Error opening file: ($^E)");

while (my $line = <$steps>) {
    chomp $line;
    print "\n";
    # If line contains only whitespace; continue
    if ($line =~ /^\s*$/) {
	next;
    }
    # If printable comment(starts with "##")
    elsif ($line =~ /^##/) {
	print $line;
    }
    # If printable comment(starts with "#")
    elsif ($line =~ /^#/) {
	next;
    }
    else {
	print "Command: $line";
    }
}

close($steps);

1;
