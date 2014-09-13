#!/usr/bin/perl

use strict;
use warnings;
use Test::More;
use FindBin qw/$Bin/;

my $output = `perl $Bin/../bin/mysqldump_sql2csv $Bin/help_keyword.sql`;
$output =~ s/^\s+|\s+$//g;
my @lines = split(/[\r\n]+/, $output);

is $lines[0], "0,'JOIN'";
is $lines[-1], "472,'ROW_FORMAT'";
is scalar(@lines), 473;

done_testing;
