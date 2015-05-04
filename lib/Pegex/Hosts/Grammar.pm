package Pegex::Hosts::Grammar;
use Pegex::Base;
extends 'Pegex::Grammar';

use constant file => 'pgx/hosts.pgx';

sub make_tree {   # Generated/Inlined by Pegex::Grammar (0.60)
  {
    '+grammar' => 'hosts',
    '+toprule' => 'hosts',
    '+version' => '0.0.1',
    '_' => {
      '.rgx' => qr/\G\s*/
    },
    'blanks' => {
      '.rgx' => qr/\G\s*\r?\n/
    },
    'comments' => {
      '.rgx' => qr/\G\s*\#.*\r?\n/
    },
    'host' => {
      '.all' => [
        {
          '.ref' => 'ip'
        },
        {
          '.ref' => '_'
        },
        {
          '.ref' => 'name'
        },
        {
          '.rgx' => qr/\G\s*\r?\n?/
        }
      ]
    },
    'hosts' => {
      '.any' => [
        {
          '.ref' => 'host'
        },
        {
          '.ref' => 'blanks'
        },
        {
          '.ref' => 'comments'
        }
      ]
    },
    'ip' => {
      '.any' => [
        {
          '.ref' => 'ipv4'
        },
        {
          '.ref' => 'ipv6'
        }
      ]
    },
    'ipv4' => {
      '.rgx' => qr/\G((?:[0-9]{1,3}\.){3}[0-9]{1,3})/
    },
    'ipv6' => {
      '.rgx' => qr/\G((?:[0-9a-fA-F]*:{1,2}[0-9a-fA-F]*)+)/
    },
    'name' => {
      '.all' => [
        {
          '.ref' => '_'
        },
        {
          '.rgx' => qr/\G(.*)/
        },
        {
          '.ref' => '_'
        }
      ]
    }
  }
}
1;
