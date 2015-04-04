#!/usr/bin/perl -w
use strict;
use warnings;
use Getopt::Long;

=pod
[ purpose ]
The task of this script is to deal with large size of data by basical sampling.

[ usage ]
> perl [PLSCRIPT] -t [FILANEM] [-peroid NUMBER  -on NUMBER]

[ parameters ]
fname := filename, input file path
peroid := sampling unit. 
on := number of adopted samples in period

[ example ]
<PARAMS>
period = 5, on = 3
<DATA>
1 A
2 B
3 C
4 D
5 E
6 F
6 G
7 H
8 I
9 J 
10 K
<OUT>
1 A
2 B
3 C
4 F
5 G
6 H

[ reference ]
 http://www.php-oa.com/2009/04/04/perl_getopt-long.html
 http://tw.perlmaven.com/open-and-read-from-files
 http://perldoc.perl.org/functions/next.html
=cut


my $fname   = "NONE";
my $on_period = 1;
my $all_period = 10;


GetOptions (
	"fname|f=s"       => \$fname,  # string
    "period:i"  => \$all_period,   # integer
    "on:i"  	 => \$on_period    # integer
);

my $verbose = 0;
my $count = 0;
my @matchinglines;

if ($all_period le $on_period) {
	$on_period = 1;
}

if ($verbose eq 1) {  print "open file: '$fname'\n"; }

open(my $DATA, $fname) or die "unable to open file '$fname' $!";

while (my $row = <$DATA>) {

    $count = ($count+1)%$all_period;

    if ($count ge $on_period) {
    	next;
    }

    if($count==0) {
        push (@matchinglines, $row);
    }
}

if ($verbose eq 1) {  print "finished file: '$fname'\n"; }

print @matchinglines;