#!/usr/bin/perl -w

open F, "<", "tmp" or die "Can't open file\n";
$guard = "";
$start = "";
$end = "";
%asleep = ();
while ($line = <F>) {
	chomp $line;

	#[1518-11-01 00:00] Guard #10 begins shift
	if ($line =~ /Guard #(\d+)/) {
		$guard = $1;
	} elsif ($line =~ /falls asleep/) {
		$line =~ /\[1518-\d{2}-\d{2} \d{2}:(\d{2})\]/;
		$start = $1;
		if ($start =~ /0([^0])/) {
			$start = $1;
		}
	} else {
		$line =~ /\[1518-\d{2}-\d{2} \d{2}:(\d{2})\]/;
		$end = $1;
		if ($end =~ /0([^0])/) {
			$end = $1;
		}
		$i = $start;
		if ($guard == 131) {
			print "start: $start and end: $end\n";
		}
		while ($i < $end) {
			$asleep{$guard}{$i}++;
			$i += 1;
		}
	}

}
close F;
# 2351 sleeps most
$max_min = -1;
$max_min_count = -1;
$max_guard = -1;
foreach $guard (sort keys %asleep) {
	foreach $minute (sort keys $asleep{$guard}) {
		if ($asleep{$guard}{$minute} > $max_min_count) {
			$max_min_count = $asleep{$guard}{$minute};
			$max_min = $minute;
			$max_guard = $guard;
		}

	}
} 

print "Guard is $max_guard Mins is $max_min count is $max_min_count\n";
@minutes = sort {$asleep{$max_guard}{$a} <=> $asleep{$max_guard}{$b}} keys $asleep{$max_guard};
print "@minutes\n";
