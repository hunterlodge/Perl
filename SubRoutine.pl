#!/usr/bin/perl

print "Ch4: Sub Routines\n";

# All Perl subroutines have a return value—there’s no distinction between those that return values and 
# those that don’t. Not all Perl subroutines have a useful return value, however

# As Perl chugs along in a subroutine, it calculates values as part of its series of actions. 
# Whatever calculation is last performed in a subroutine is automatically also the return value

# the built-in parameter list for a subroutine: @_.  It's a reference of the argument, which means any modification
# made to it in the subroutine will take effect on the passed argument. This is different than the behavior of assignment which 
# copy the value of the right side var to the left-side var.

@list = (3, 5, 10, 4, 6);
$maximum = &max(@list);
&println($maximum);
&println(@list);
sub max {
    my($max_so_far) = shift @_; # the first one is the largest yet seen
    foreach (@_) { # look at the remaining arguments
        if ($_ > $max_so_far) { # could this one be bigger yet?
            $max_so_far = $_;
        }
    }
    @_[1] = 100;
    $max_so_far;
    
}

# # A pragma is a hint to a compiler, telling it something about the code. In this case, the
# # use strict pragma tells Perl’s internal compiler that it should enforce some good programming rules for the rest of this block or source file.
# 
# # Most people recommend that programs that are longer than a screenful of text generally need use strict. And we agree
# # the purpose of 'use strict' pragma can be explained by the code below:
# # it forces all global variables following it to be declared with 'my'.
# use strict;
# my $bamm_bamm = 3; # New lexical variable . my is required
# $bamm_bamm += 1; # No such variable: Compile time fatal error. Without my, compiler will regard $bammbamm as a new variable.
# 
# 
# 
# my @names = qw/ fred barney betty dino wilma pebbles bamm-bamm /;
# &println(@names);
# my $result = &which_element_is("dino", @names);
# sub which_element_is {
#     my($what, @array) = @_;
#     @_[1] = "changed_by_implicit_var";
#     @array[1] = "changed_by_local_var";
#     $what = "changed";
# }
# 
# &println(@names);
# 
# 
sub println {
    print "@_";
    print "\n";
}

# # Without the ampersand, you’d be calling the built-in chomp, even though you’ve defined the subroutine &chomp
# chomp(undef);


# # Persistent, Private Variables: state $n which is an equivalent to the keyword 'static' in C
# use 5.010;
# sub marine {
#  state $n = 0; # private, persistent variable $n
#  $n += 1;
#  print "Hello, sailor number $n!\n";
# }
# &marine;
# &marine;
# &marine;


###################  exercises  ##########################
sub total{
    my $sum = 0;
    foreach (@_){
        $sum += $_;
    }
    $sum;
}

sub above_average{
    my $sum = &total(@_);
    my $avg = $sum / @_;
    my @above_avg_list = ();
    foreach (@_) {
        if ($_ > $avg ){
            push @above_avg_list, $_;
        }
    }
    @above_avg_list;
}
my @fred = above_average(1..10);
print "\@fred is @fred\n";
print "(Should be 6 7 8 9 10)\n";
my @barney = above_average(100, 1..10);
print "\@barney is @barney\n";
print "(Should be just 100)\n";

use 5.010;
sub greet{
    state $count = 0;
    state @name_list;
    if ($count == 0){
        $count += 1;
        println "Hi "."@_"."! You are the first one here";
        push @name_list, @_;
    }else{
        println "Hi "."@_"."!"."@name_list is also here";
        push @name_list, @_;
    }    
    
}
&greet("frank");
&greet("snowfox");
&greet("fang");