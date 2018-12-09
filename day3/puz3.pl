#!/usr/bin/perl -w

open F, "<", "input.txt" or die "Can't open file\n";
#$side = 8;
%overlaps = ();
$overlaps = 0;
while ($line = <F>) {

	chomp $line;

	# Part 1 : Extract required values
	#1 @ 1,3: 4x4
	$line =~ /#([0-9]+) @ ([0-9]+),([0-9]+): (\d+)x(\d+)/;
	$id = $1;
	$left = $2;
	$top = $3;
	$width = $4;
	$height = $5;

	print "$id $left $top $width $height\n";

	# Part 2: Find out what overlaps
	$row = 0;
	$column = 0;
	while ($row < $height) {
		$column = 0;
		while ($column < $width) {
			$cur_row = $row + $top;
			$cur_col = $column + $left;
			$overlaps{$cur_row}{$cur_col}+=1;
			if ($overlaps{$cur_row}{$cur_col} == 2) {
				$overlaps++;
			}
			$column += 1;
		}
		$row += 1;
	}


}
print "$overlaps\n";

close F;