#!/usr/bin/perl -w

open F, "<", "input.txt" or die "Can't open file\n";
%count = ();
$count2 = 0;
$count3 = 0;
$seen2 = 0;
$seen3 = 0;
$i = 0;

while ($line = <F>) {
	chomp $line;
	$seen2 = 0;
	$seen3 = 0;
	@letters = split //, "$line";
	foreach $letter (@letters) {
		$count{$i}{$letter}++;
	}
	foreach $letter (@letters) {
		if ($count{$i}{$letter} == 2 && !($seen2)) {
			$count2++;
			$seen2 = 1;
		} elsif ($count{$i}{$letter} == 3 && !($seen3)) {
			$count3++;
			$seen3 = 1;
		} 
	}
	print "$count2 $count3\n";
	$i++;
}

close F;
$product = $count2 * $count3;
print "$count2 $count3 $product\n";