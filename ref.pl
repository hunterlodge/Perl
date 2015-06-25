#!/usr/bin/perl

print "Ch5: IO\n";


$value=10;  
$pointer=\$value;  
printf "\nPointer Address: $pointer of $value\n";  
printf "\nWhat Pointer* ($pointer)points to: $$pointer\n"