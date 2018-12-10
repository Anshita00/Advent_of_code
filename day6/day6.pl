#!/usr/bin/perl -w

open F, "<", "input" or die "Can't open file\n";

$max_x = -1;
$max_y = -1;
# Store the x and y in separate arrays
@x = ();
@y = ();

# Store the area of each coord here
%areas = ();

# A hash which states whether or not a particular coordinate
# has finite area
%cannotBe = ();

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
# Find the closest one and update areas array
# If two closest points, do not update array
foreach $x (0..$max_x) {
	foreach $y(0..$max_y) {
		$closest_one = -1;
		$closest_distance = -1;
		$i = 0;
		$found_two = 0;
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
			if ($manhattan_distance < $closest_distance || $closest_distance == -1) {
				$closest_distance = $manhattan_distance;
				$closest_one = $i;
				$found_two = 0;
			} elsif ($manhattan_distance == $closest_distance) {
				$found_two = 1;
			}
			$i += 1;
		}
		if ($found_two == 0) {
			$areas{$closest_one}++;		
		}

		# Points on the edge of the map have infinite area
		if ($y == 0 || $y == $max_y || $x == 0 || $x == $max_x) {
			$cannotBe{$closest_one} = 1;
		}
	}
}

# Prints all those coords which have finite area along with their areas
print "Coords\n";
foreach $coord (sort {$areas{$b} <=> $areas{$a}} keys %areas) {
	if ($cannotBe{$coord}) {
		next;
	}
	print "$coord $areas{$coord}\n";
}