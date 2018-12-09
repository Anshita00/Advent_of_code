#!/usr/bin/perl -w

open F, "<", "input.txt" or die "Can't open file\n";
%letters = ();
@words = ();
while ($line = <F>) {
	chomp $line;
	@letters = split //, $line;
	$i = 0;
	foreach $letter (@letters) {
		$letters{$line}{$i} = $letter;
		$i += 1;
	}

	foreach $word (@words) {

		if (length $word != length $line) {
			next;
		}
		$i = 0;
		$differences = 0;
		while ($i < length $word) {
			if ($letters{$word}{$i} ne $letters{$line}{$i}) {
				$differences++;
			}
			$i += 1;
		}

		if ($differences == 1) {
			print "$line $word\n";
			exit 0;
		}

	}
	push @words, $line;
}

close F;