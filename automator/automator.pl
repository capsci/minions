#!/usr/bin/perl

use strict;
use warnings;

sub prompt {
    my $cmd = shift;
    print "Executing: $cmd\nContinue(y/n)?";
    my $response = <STDIN>;
    chomp $response;
    if (lc $response eq 'y') {
	return;
    }
    else {
	print "Please enter a valid response\n";
    prompt($cmd);
    }
}

my $myfile = "commands.steps";
open(my $steps, "<", $myfile)
    or die("Error opening file: ($^E)");

while (my $line = <$steps>) {
    chomp $line;
    # If line contains only whitespace; continue
    if ($line =~ /^\s*$/) {
	next;
    }
    # If printable comment(starts with "##")
    elsif ($line =~ /^##/) {
	print "$line\n";
    }
    # If printable comment(starts with "#")
    elsif ($line =~ /^#/) {
	next;
    }
    # Execute the command
    else {
	prompt $line;
	system $line;
    }
}



close($steps);

1;
