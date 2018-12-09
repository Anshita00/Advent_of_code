#!/usr/bin/perl -w

open F, "<", "input.txt" or die "Can't open file\n";
$guard = "";
$start = "";
$end = "";
%asleep = ();
while ($line = <F>) {
	chomp $line;

	$
	#[1518-11-01 00:00] Guard #10 begins shift
	if ($line =~ /Guard #(\d+)/) {
		$guard = $1;
	} elsif ($line =~ /falls asleep/) {
		$line =~ /\[1518-\d{2}-\d{2} \d{2}:(\d{2})\]/;
		$start = $1;
	} else {
		$line =~ /\[1518-\d{2}-\d{2} \d{2}:(\d{2})\]/;
		$end = $1;
		$i = $start;
		while ($i < $end) {
			$asleep{$guard}{$i}++;
			$i += 1;
		}
	}

}

guards = sort 
close F;