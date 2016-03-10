#!/usr/bin/perl -w
use strict;

sub buck
{
	my $num = shift @_;
	my @bucket = @_;
	#divisibility test
	foreach my $bucket_one (@bucket)
	{
		if($num % $bucket_one == 0)
		{
			return 1;
		}
	}

	if(@bucket == 1)
	{
		return 0;
	}
	#choose next number to seperate
	my $biggest = 0;
	my $splits = 0;
	while($splits <= 0)
	{
		$biggest = shift @bucket;
		$splits = int $num / $biggest;
		if(@bucket == 0)
		{
			return 0;
		}	
	}
	#split and recursion
	my $return_num  = 0;
	foreach my $split_num (reverse (0..$splits))
	{	
		######for the process: print $biggest."&&$num:\t".$split_num."\t".$split_num*$biggest."\t".($num-$split_num*$biggest)."\n";
		$return_num = buck($num-$split_num*$biggest, @bucket);
		if($return_num == 1)
		{
			return 1;
		}
	} 
	return $return_num;
}

#input
if(!(defined $ARGV[0]))
{
	print "./bucket.pl <buckets> <number>\n\tthe buckets are seperated by comma\n\tfor example:\n\t./bucket 3,7 98\n";
	die "\n";
}
my @bucket = split(",", $ARGV[0]);
my $num = $ARGV[1];
###for the input: print "bucket:@bucket\nnum:$num\n";
#find whether Ture or not
my $result;
@bucket = reverse sort {$a <=> $b}@bucket;
$result = buck($num, @bucket);
print "result:".$result."\n";
