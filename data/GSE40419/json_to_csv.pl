#!/usr/bin/env perl

use strict;
use warnings;

my %col = ();

while(<>){
   chomp;
   s/\s"//g;
   s/[",{}]*//g;
   s/\s//g;
   next if /^$/;
   (my $key, my $value) = split(/:/, $_, 2);
   if(exists $col{$key}){
      my $i = scalar(@{$col{$key}});
      $col{$key}[$i] = $value;
   } else {
      $col{$key}[0] = $value;
   }
}

my @cols = sort {$a cmp $b} keys %col;
my @rows = 0 .. scalar(@{$col{$cols[0]}} - 1);

print(join(",", @cols), "\n");
for(my $i = 0; $i < scalar(@rows); ++$i){
   my $line = '';
   foreach my $c (@cols){
      $line .= "$col{$c}[$i],";
   }
   $line =~ s/,$//;
   print("$line\n");
}
