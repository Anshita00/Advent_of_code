#!/usr/bin/perl -w

open F, "<", "input.txt" or die "Can't open file\n";

while ($line = <F>) {
	chomp $line;

}
close F;