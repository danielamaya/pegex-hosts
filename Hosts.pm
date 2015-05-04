package Neuadmin::Files::Hosts;
BEGIN { $ENV{PERL_PEGEX_AUTO_COMPILE} = 'Neuadmin::Files::Hosts::Grammar' }
our $VERSION = '0.27';

use Pegex::Base;

use Pegex::Parser;
use Neuadmin::Files::Hosts::Grammar;
use Neuadmin::Files::Hosts::Data;

sub load {
  my ($self, $json) = @_;
  Pegex::Parser->new(
    grammar =>  Neuadmin::Files::Hosts::Grammar->new,
    receiver => Neuadmin::Files::Hosts::Data->new,
    # debug => 1,
  )->parse($json);
}

1;
