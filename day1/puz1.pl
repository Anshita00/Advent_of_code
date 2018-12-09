#!/usr/bin/perl -w

%seen = ();
$sum = 0;
$seen{$sum}+=1;
OUTER: while (1 == 1) {
	open F, "<", "input.txt" or die "Can't open file";
	while ($line = <F>) {
		chomp $line;
		$sum += $line;
		if ($seen{$sum}) {
			last OUTER;
		}
		$seen{$sum}+=1;
	}

	close F;
}
print "$sum\n";