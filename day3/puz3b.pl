#!/usr/bin/perl -w

open F, "<", "input.txt" or die "Can't open file\n";
%overlaps = ();
$num_id = 1323;
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

	# Part 2: Find out if it overlaps
	$row = 0;
	$column = 0;
	while ($row < $height) {
		$column = 0;
		while ($column < $width) {
			$cur_row = $row + $top;
			$cur_col = $column + $left;
			if ($overlaps{$cur_row}{$cur_col}) {
				$overlap_id = $overlaps{$cur_row}{$cur_col};		
				$seen{$overlap_id}++;
				$seen{$id}++;
			}
			$overlaps{$cur_row}{$cur_col} = $id;				
			$column += 1;
		}
		$row += 1;
	}


}


$cur_id = 1;
while ($cur_id <= $num_id) {
	if (!$seen{$cur_id}) {
		print "NO OVERLAP ID IS $cur_id\n";
	}
	$cur_id+=1;
}
close F;