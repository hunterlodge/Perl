#!/usr/bin/perl

use warnings;

my %ip_host=(
    "1.1.1.1" => "frank",
    "2.2.2.2" => "snowfox",
    "3.3.3.3" => "fred",
);

print "%ip_host\n";
while ( ($key, $value) = each %ip_host ) {
    print "$key => $value\n";
}

print "$ENV{PATH}";