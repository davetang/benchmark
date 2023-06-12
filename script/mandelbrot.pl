#!/usr/bin/env perl

use warnings;
use strict;

my $usage = "Usage: $0 <max_iter>\n";
my $MAX_ITERATIONS = shift or die $usage;
my $BAILOUT = 16;

my $begin = time();

sub mandelbrot {
   my ($x,$y) = @_;
   my $cr = $y - 0.5;
   my $ci = $x;
   my $zi = my $zr = my $i = 0;

   while (1){
      $i += 1;
      my $temp = $zr * $zi;
      my $zr2 = $zr * $zr;
      my $zi2 = $zi * $zi;
      $zr = $zr2 - $zi2 + $cr;
      $zi = $temp + $temp + $ci;
      if ($zi2 + $zr2 > $BAILOUT){
         return $i;
      }
      if ($i > $MAX_ITERATIONS){
         return 0;
      }
   }
}

for (my $y = -39; $y < 39; $y++){
   print("\n");
   for (my $x = -39; $x < 39; $x++){
      my $i = mandelbrot($x/40, $y/40);
      if ($i == 0){
         print("*");
      }
      else{
         print(" ");
      }
   }
}
print("\n");

my $end = time() - $begin;

printf ("Elapsed %.0f seconds\n",$end);

exit(0);
