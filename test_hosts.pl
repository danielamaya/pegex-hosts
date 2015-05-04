#!/usr/bin/env perl
use strict;
use Pegex::Parser;
use lib 'lib';
use Pegex::Hosts::Grammar;
use Data::Dumper;

{
    package Pegex::Hosts::AST;
    use base 'Pegex::Tree';
    use Data::Dumper;
    
    sub got_host {
      my ($self,$ip) = @_;
      print Dumper $ip;
    }
}

my $infile = shift or
    die "No input file specified.\n";

open my $in, $infile or
    die "Cannot open $infile for reading: $!\n";

my $src = do { local $/; <$in> };

my $ast =
  Pegex::Parser->new(
    grammar => Pegex::Hosts::Grammar->new,
    receiver => Pegex::Hosts::AST->new,
    debug => 1,
  )->parse($src);

print Dumper $ast;
