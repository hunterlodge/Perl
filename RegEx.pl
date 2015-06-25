#!/usr/bin/perl


$_ = "yabba dabba doo";
if (/abba/) {
 print "It matched!\n";
}

if (/\p{Space}/) {
 print "It contains space!\n";
}

# You can also match characters that don’t have a particular Unicode property. Instead
# of a lowercase p, you use an uppercase one to negate the property
$_ = "yabbadabbadoo";
if (/\P{Space}/) {
 print "It doesn't contain space!\n";
} 

