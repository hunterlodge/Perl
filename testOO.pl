#!/usr/bin/perl

require Animal;
require People;

sub println(){
    print "@_"."\n";
}

my $animal = {
	"legs"   => 4,
	"colour" => "brown",
};                       # $animal是一个普通的hash的引用
&println(ref $animal);       # "HASH"
bless $animal, "Animal"; # 现在它是"Animal"类的对象
bless $animal, "People"; # 现在它是"Animal"类的对象
&println(ref $animal);   # "Animal"


$animal->eat("insects", "curry", "eucalyptus");

&println("Animal has ", $animal->{"legs"}, " leg(s)");
