#!/usr/bin/env perl

use strict;
use warnings;

use Data::Dumper;
sub p ($) { warn Dumper shift }

use Perl6::Say;

use lib glob 'modules/*/lib';
use lib 'lib';


my $foo = <<EOS;
foo
bar
baz
EOS

open my $io, "<", \$foo;
use Data::Dumper;
warn Dumper fileno($io) ;
for my $line (<$io>) {
	use Data::Dumper;
	warn Dumper chomp($line);
}
use Data::Dumper;
warn Dumper fileno($io) ;
use Data::Dumper;
warn Dumper close $io;
use Data::Dumper;
warn Dumper fileno($io) ;
