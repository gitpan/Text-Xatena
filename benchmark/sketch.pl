#!/usr/bin/env perl -d:NYTProf
use strict;
use warnings;

use Data::Dumper;
use Benchmark qw(:all) ;
sub p ($) { warn Dumper shift }

use Perl6::Say;

use lib glob 'modules/*/lib';
use lib 'lib';

use Devel::NYTProf;
use Text::Xatena;

my $syntax = <<EOS;
* This is a head

foobar

barbaz

:foo:bar
:foo:bar

- list1
- list1
- list1

>|perl|
test code
||<

ok?
EOS


my $thx = Text::Xatena->new;
DB::enable_profile;
$thx->format($syntax) for (1..1000);
DB::disable_profile;

