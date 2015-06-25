#!/usr/bin/perl

print "Hello, world!\n";

# # print a list
# print "The answer is ", 6 * 7, ".\n";

# interpolation in double-quoted string
# $meal = "brontosaurus steak";
# $barney = "fred ate a $meal \n"; # $barney is now "fred ate a brontosaurus steak"
# print $barney;
# $barney = 'fred ate a ' . $meal; # another way to write that
# $meal = "apple";
# print "frank ate ${meal}s \n";# use curly braces to separate the var with its following char

# boolean: '0' means false
# if ( !'0'){
#     print '\'0\' is evaluated FALSE in perl'."\n";
# }

# # interactive perl
# chomp($user_input = <STDIN>);
# print $user_input;


# # To tell whether a value is undef and not the empty string, use the
# #  defined function, which returns false for undef, and true for everything else
# # $madonna = <STDIN>;
# # if (defined($madonna)){
#	print "The input was $madonna";
#}else{
#	print "No input available!\n";
#}


# # qw: stands for “quoted words” or “quoted by whitespace,” 
# # delimiter can be any punctuation character
# print qw{ 
#             abc 
#             def 
#             ghi 
#             jkl 
#             mno 
#             pqr     
#         };

# # list assignment: multiple assignments
# ($fred, $frank, $dino) = ("flintstone", "rubble", "world");
# print $fred, "  ", $frank, "\n";
# 
# # dino will be assigned undef
# ($wilma, $dino) = qw[hello];
# print "$wilma"." "."$dino"."\n";


# # array name
# @rocks = qw/ bedrock slate lava /;
# print @rocks, "\n";
# @giant = 1..1e1; # a list with 10 elements
# print @giant, "\n";


# # swap those values
# ($fred, $barney) = ($barney, $fred); 

# # an array name expands to the list it contains, like @rock in this example
# # An array doesn’t become an element in the list, because these arrays can contain only scalars, not other arrays
# $frank = "snowfox";
# @expanded_array = (@rocks, $frank);
# print "@expanded_array"."\n";


# #splice (array_name, start_pos, length, replacement_list)
# # the latter two parameters are optional
# #Perl expands the array and automatically adds spaces between the elements
# @array = qw( pebbles dino fred barney betty );
# @removed = splice @array, 1, 2, qw(wilma); # remove nothing
# print "@removed"."\n"; # @removed is qw()
# print "@array". "\n"; # @array is qw(pebbles wilma dino fred barney betty)

# # foreach
# # Note: the value of the control var @fruit will be restored its original after the loop
# $fruit = "strawberry"; 
# foreach $fruit (qw/ apple orange pear /) {
#     print "One fruit is $fruit.\n"; # Prints names of three rocks
# }
# print "$fruit"."\n";
# 
# # default control var: $_
# foreach (1..10) { # Uses $_ by default
#     print "I can count to $_!\n";
# }


# Remember that reverse returns the reversed list; it doesn’t affect its arguments.
# @fruit = qw/ apple orange pear /;
# reverse @fruit; # WRONG - doesn't change @fred
# print "@fruit"."\n";
# @fruit = reverse @fruit; # that's better
# print "@fruit";
# 
# each: returns both the index and the value

# # use VERSION enables 'use strict', which forces you declare the scope of each variable
# use 5.012; 
# 
# my @rocks = qw/ bedrock slate rubble granite /;
# while( my( $index, $value ) = each @rocks ) {
#  say "$index: $value";
# }


# # context: List vs Scalar
# # eg : “name”* of an array. In a list context, it gives the list of elements. But in a scalar context, it returns
# # the number of elements in the array
# $number = 42 + @people; # scalar context: 42 + 3 gives 45

# Since undef is a scalar value, assigning undef to an array doesn’t clear the array. The better way to do that is to assign an empty list
@wilma = undef; # OOPS! Gets the one-element list (undef)
print "\@wilma: @wilma size of wilma:", scalar @wilma, "\n";
 # which is not the same as this:
@betty = ( ); # A correct way to empty an array

print "\@betty: @betty size of betty:", scalar @betty, "\n";


# # On occasion, you may need to force scalar context where Perl is expecting a list. In that
# # case, you can use the fake function scalar. It’s not a true function because it just tells
# # Perl to provide a scalar context:
# @rocks = qw( talc quartz jade obsidian );
# print "How many rocks do you have?\n";
# print "I have ", @rocks, " rocks!\n"; # WRONG, prints names of rocks
# print "I have ", scalar @rocks, " rocks!\n"; # Correct, gives a number

# store STDIN into list
@lines = <STDIN>; # Read all the lines
chomp(@lines); # discard all the newline characters for each line
print "@lines ", scalar @rocks;






























