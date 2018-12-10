#!/usr/bin/perl -w

open F, "<", "input" or die "Can't open file\n";

$max_x = -1;
$max_y = -1;
# Store the x and y in separate arrays
@x = ();
@y = ();

# The max distance it should total up to to be within the region
$desired_total = 10000;

# The area of the region
$area = 0;

# Initialise arrays, get max x and y
while ($line = <F>) {
	chomp $line;
	$line =~ /(\d+),\s*(\d+)/;
	$x = $1;
	$y = $2;
	if ($x > $max_x) {
		$max_x = $x;
	}
	if ($y > $max_y) {
		$max_y = $y;
	}
	push @x, $x;
	push @y, $y;

}

# For every point on the map.
# find manhattan distance from all coords
# Total this distance
# If it is less than the desired total
# Increment area by one
foreach $x (0..$max_x) {
	foreach $y(0..$max_y) {
		$total_distance = 0;
		$i = 0;
		while ($i < scalar @x) {
			$comp_x = $x[$i];
			$comp_y = $y[$i];
			if ($comp_x >= $x) {
				$x_distance = $comp_x - $x;			
			} else{
				$x_distance = $x - $comp_x;
			}

			if ($comp_y >= $y) {
				$y_distance = $comp_y - $y;
			} else {
				$y_distance = $y - $comp_y;
			}
			$manhattan_distance = $x_distance + $y_distance;
			$total_distance += $manhattan_distance;
			$i += 1;
		}
		#print "$total_distance\n";
		if ($total_distance < $desired_total) {
			$area += 1;
		}
	}
}

print "$area\n";