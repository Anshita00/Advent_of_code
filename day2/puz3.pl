#!/usr/bin/perl -w

open F, "<", "input.txt" or die "Can't open file\n";

while ($line = <F>) {

	chomp $line;

	#1 @ 1,3: 4x4
	$line =~ /#([0-9]+) @ ([0-9]+),([0-9]+): (\d+)x(\d+)/;
	$id = $1;
	$left = $2;
	$top = $3;
	$length = $4;
	$width = $5;
	print "$id $left $top $length $width\n";
}

close F;