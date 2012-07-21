package Ledger::Command;

# ABSTRACT: Wrapper class for the ledger command line utility

use strict;
use warnings;
use Moo;
use MooX::Types::MooseLike;

# usage: ledger [options] COMMAND [ACCT REGEX]... [-- [PAYEE REGEX]...]

has command => (
    is      => 'ro',
    isa     => Str,
    default => 'ledger',
);

#Basic options:

#  -H, --full-help        display this help text
#  -h, --help             display summarized help text
#  -v, --version          show version information

#  -f, --file FILE        read ledger data from FILE
has file => (
    is  => 'rw',
    isa => Str,
);

#  -o, --output FILE      write output to FILE

#  -i, --init-file FILE   initialize ledger using FILE (default: ~/.ledgerrc)
has init_file => (
    is  => 'rw',
    isa => Str,
);

#      --cache FILE       use FILE as a binary cache when --file is not used
#      --no-cache         don't use a cache, even if it would be appropriate

#  -a, --account NAME     use NAME for the default account (useful with QIF)
has account => (
    is  => 'rw',
    isa => Str,
);

#Report filtering:

#  -c, --current          show only current and past entries (not future)
has current => (
    is  => 'rw',
    isa => Bool,
);

#  -b, --begin DATE       set report begin date
has begin => (
    is  => 'rw',
    isa => Str,
);

#  -e, --end DATE         set report end date
has end => (
    is  => 'rw',
    isa => Str,
);

#  -p, --period STR       report using the given period
has period => (
    is  => 'rw',
    isa => Str,
);

#      --period-sort EXPR sort each report period's entries by EXPR
has period_sort => (
    is  => 'rw',
    isa => Str,
);

#  -C, --cleared          consider only cleared transactions
has cleared => (
    is  => 'rw',
    isa => Bool,
);

#  -U, --uncleared        consider only uncleared transactions
has uncleared => (
    is  => 'rw',
    isa => Bool,
);

#  -R, --real             consider only real (non-virtual) transactions
has real => (
    is  => 'rw',
    isa => Bool,
);

#  -L, --actual           consider only actual (non-automated) transactions
has actual => (
    is  => 'rw',
    isa => Bool,
);

#  -r, --related          calculate report using related transactions
has related => (
    is  => 'rw',
    isa => Bool,
);

#      --budget           generate budget entries based on periodic entries
has budget => (
    is  => 'rw',
    isa => Bool,
);

#      --add-budget       show all transactions plus the budget
has add_budget => (
    is  => 'rw',
    isa => Bool,
);

#      --unbudgeted       show only unbudgeted transactions
has unbudgeted => (
    is  => 'rw',
    isa => Bool,
);

#      --forecast EXPR    generate forecast entries while EXPR is true
has forecast => (
    is  => 'rw',
    isa => Str,
);

#  -l, --limit EXPR       calculate only transactions matching EXPR
has limit => (
    is  => 'rw',
    isa => Str,
);

#  -t, --amount EXPR      use EXPR to calculate the displayed amount
has amount => (
    is  => 'rw',
    isa => Str,
);

#  -T, --total EXPR       use EXPR to calculate the displayed total
has total => (
    is  => 'rw',
    isa => Str,
);

#Output customization:

#  -n, --collapse         register: collapse entries; balance: no grand total
has collapse => (
    is  => 'rw',
    isa => Bool,
);

#  -s, --subtotal         balance: show sub-accounts; other: show subtotals
has subtotal => (
    is  => 'rw',
    isa => Bool,
);

#  -P, --by-payee         show summarized totals by payee
has by_payee => (
    is  => 'rw',
    isa => Bool,
);

#  -x, --comm-as-payee    set commodity name as the payee, for reporting
has comm_as_payee => (
    is  => 'rw',
    isa => Bool,
);

#  -E, --empty            balance: show accounts with zero balance
has empty => (
    is  => 'rw',
    isa => Bool,
);

#  -W, --weekly           show weekly sub-totals
has weekly => (
    is  => 'rw',
    isa => Bool,
);

#  -M, --monthly          show monthly sub-totals
has monthly => (
    is  => 'rw',
    isa => Bool,
);

#  -Y, --yearly           show yearly sub-totals
has yearly => (
    is  => 'rw',
    isa => Bool,
);

#      --dow              show a days-of-the-week report
has dow => (
    is  => 'rw',
    isa => Bool,
);

#  -S, --sort EXPR        sort report according to the value expression EXPR
has sort => (
    is  => 'rw',
    isa => Str,
);

#  -w, --wide             for the default register report, use 132 columns

#      --head COUNT       show only the first COUNT entries (negative inverts)
has head => (
    is  => 'rw',
    isa => Int,
);

#      --tail COUNT       show only the last COUNT entries (negative inverts)
has tail => (
    is  => 'rw',
    isa => Int,
);

#      --pager PAGER      send all output through the given PAGER program

#  -A, --average          report average transaction amount
has average => (
    is  => 'rw',
    isa => Bool,
);

#  -D, --deviation        report deviation from the average
has deviation => (
    is  => 'rw',
    isa => Bool,
);

#  -%, --percentage       report balance totals as a percentile of the parent
has percentage => (
    is  => 'rw',
    isa => Bool,
);

#      --totals           in the "xml" report, include running total
has totals => (
    is  => 'rw',
    isa => Bool,
);

#  -j, --amount-data      print only raw amount data (useful for scripting)
has amount_data => (
    is  => 'rw',
    isa => Bool,
);

#  -J, --total-data       print only raw total data
has total_data => (
    is  => 'rw',
    isa => Bool,
);

#  -d, --display EXPR     display only transactions matching EXPR
has display => (
    is  => 'rw',
    isa => Str,
);

#  -y, --date-format STR  use STR as the date format (default: %Y/%m/%d)
has date_format => (
    is  => 'rw',
    isa => Str,
);

#  -F, --format STR       use STR as the format; for each report type, use:

#      --balance-format      --register-format       --print-format

#      --plot-amount-format  --plot-total-format     --equity-format

#      --prices-format       --wide-register-format

#Commodity reporting:

#      --price-db FILE    sets the price database to FILE (def: ~/.pricedb)
has price_db => (
    is  => 'rw',
    isa => Str,
);

#  -L, --price-exp MINS   download quotes only if newer than MINS (def: 1440)
has price_exp => (
    is  => 'rw',
    isa => Int,
);

#  -Q, --download         download price information when needed
has download => (
    is  => 'rw',
    isa => Bool,
);

#  -O, --quantity         report commodity totals (this is the default)
has quantity => (
    is  => 'rw',
    isa => Bool,
);

#  -B, --basis            report cost basis of commodities
has basis => (
    is  => 'rw',
    isa => Bool,
);

#  -V, --market           report last known market value
has market => (
    is  => 'rw',
    isa => Bool,
);

#  -g, --performance      report gain/loss for each displayed transaction
has performance => (
    is  => 'rw',
    isa => Bool,
);

#  -G, --gain             report net gain/loss
has gain => (
    is  => 'rw',
    isa => Bool,
);

#Commands:

#  balance  [REGEXP]...   show balance totals for matching accounts
sub balance {
    my $self = shift;
}

#  register [REGEXP]...   show register of matching transactions
sub register {
    my $self = shift;
}

#  print    [REGEXP]...   print all matching entries
sub print {
    my $self = shift;
}

#  xml      [REGEXP]...   print matching entries in XML format
sub xml {
    my ( $self, %args ) = @_;
}

#  equity   [REGEXP]...   output equity entries for matching accounts
sub equity {
    my ( $self, %args ) = @_;
}

#  prices   [REGEXP]...   display price history for matching commodities
sub prices {
    my ( $self, %args ) = @_;
}

#  entry DATE PAYEE AMT   output a derived entry, based on the arguments
sub entry {
    my ( $self, %args ) = @_;
}

__PACKAGE__->meta->make_immutable;

1;

__END__

=pod

=head1 SYNOPSIS

    use Ledger::Command;
    my $ledger = Ledger::Command->new('/usr/local/bin/ledger');
    $ledger->file('your-ledger.dat');
    my $balance = $ledger->balance(account_regex => '^Assets');

=head1 DESCRIPTION

What does this module do?

=head1 METHODS

=head2 method

=head1 CAVEATS

=head1 BUGS

=head1 RESTRICTIONS

=head1 NOTES

=head1 SEE ALSO

=over 4

=item * L<Ledger|http://www.newartisans.com/software/ledger.html>

=back

=cut

