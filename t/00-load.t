use strict;
use warnings;
use Test::More;

BEGIN {
    my @modules = qw(
        Ledger::Command
    );

    for my $module (@modules) {
        use_ok($module) or BAIL_OUT("Failed to load $module");
    }
}

diag(
    sprintf(
        'Testing Ledger::Command %f, Perl %f, %s',
        $Ledger::Command::VERSION, $], $^X
    )
);

done_testing();

