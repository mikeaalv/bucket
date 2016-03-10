#!/usr/bin/perl -w
use strict;

foreach my $test_num (10000..10500)
{
    print "./bucket.pl 11,13,15,19,21 $test_num\n";
	system("./bucket.pl", "11,13,15,19,21", "$test_num");
}
print "***********************\n";
my $array = join(",",(2..100));
foreach my $test_num (101..1000)
{
    print "./bucket.pl $array $test_num\n";
	system("./bucket.pl","$array", "$test_num");
}
print "*********************\n";
foreach my $test_num (13..1000)
{
    print "./bucket.pl 7,9,11 $test_num\n";
	system("./bucket.pl","7,9,11","$test_num");
}
print "*********************\n";
foreach my $test_num (15..1000)
{
    print "./bucket.pl 11,13 $test_num\n";
    system("./bucket.pl","11,13","$test_num");
}
print "*************\n";
foreach my $test_num (15..100)
{
    print "./bucket.pl 2,9,17 $test_num\n";
    system("./bucket.pl","2,9,17","$test_num");
}