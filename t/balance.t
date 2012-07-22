use strict;
use warnings;
use Test::More;
use Ledger::Command;

my $ledger = Ledger::Command->new();
$ledger->init_file('t/data/init.dat');
$ledger->file('t/data/example.dat');
my $balance = $ledger->balance();

is( $balance->{Assets}, '$10,900.00' );
is( $balance->{Income}, '$-1,000.00' );

done_testing();

