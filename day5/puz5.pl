#!/usr/bin/perl -w

open F, "<", "input" or die "Can't open file\n";


$line = <F>;
chomp $line;

# Make it an array
@letters = split //, "$line";

# Just out of interest to see how much the polymer has collapsed
print scalar @letters, "\n";

# First and second refer to the two letters we will be comparing during each iteration of the loop
$first = 0;
$second = 1;

# Boolean variable to notify us if any reactions have taken us during that iteration so that
# we know when to stop
$reactions = 1;

# Main loop - keep going until no more reactions are possible
while ($reactions) {

	# Ineer loop - go through polymer again in case more reactions are possible
	$reactions = 0;
	$first = 0;
	$second = 1;
	while ($second < scalar @letters) {

		# If the two letters are of same type but opposite polarity, remove them
		if (lc $letters[$first] eq lc $letters[$second] && $letters[$first] ne $letters[$second]) {
			$reactions = 1;
			splice @letters, $first, 2;
		} else {
			$first += 1;
			$second += 1;
		}
	}	

}


print scalar @letters, "\n";

close F;