#!/usr/bin/perl

print "Ch5: IO\n";

while (defined($line = <STDIN>)) {
    print "I saw $line";
}