#!/usr/bin/perl



my $cmd_blocks = 1;
my $apnName2sharedIpPool = {};
my $apnName2nbrIPAddr = {};
my $cmd = "show configuration services epg pgw shared-ip-pool ip-pool-test.bj";

sub println(){
    ($string) = @_;
    print "$string"."\n";
}

sub main {

   
    #open(CMDOUT_FILE, "< ./out.txt") ;
    #$cmd_name="show configuration services epg pgw apn wapgw pdp-context shared-ip-pool";
    #if ($cmd_name =~ /show configuration services epg pgw apn\s+(\S+)\s+pdp-context shared-ip-pool/)
    #{
    #  my $apnName = $1;
    #  print $apnName."\n";
    #  
    #  while(<\*CMDOUT_FILE>)
    #  {
    #    return $1 if ($_=~ /^$g_cmd_prefix(.*)/ );
    #    if ($_ =~ /^\s*(\S+);.*$/)
    #    {
    #      $$apnName2sharedIpPool{$apnName} = $1;
    #      $$apnName2nbrIPAddr{$apnName} = "";
    #    } 
    #    
    #  }   
    #}
    #open(CMDOUT_FILE, "< ./out.txt") ;
    #&parser_show_configuration_services_epg_pgw_sharedIpPool(\*CMDOUT_FILE, $cmd, $cmd_blocks);
    #my $apnInfoList = "abc";
    #print $apnInfoList .="|$apnInfoList^$nbrIpAddr";

    print &escapeString("abcdef.jlkdjsl, {}", "abc");
    # my @stack;
    # if (!@stack) {
    #     &println("stack is undefined");
    # }
    # push @stack, "abc";
    # if (@stack) {
    #     &println("stack is defined");
    # }
    # &println($stack[0]);
    # push @stack, "def";
    # &println($stack[0]);
    # pop @stack;
    # pop @stack;
    # if (!@stack) {
    #     &println("stack is undefined");
    # }
    

}
sub escapeString{
	my $this=shift;
	my $str=shift;
    &println("this:".$this);
    &println("str:".$str);
	if($str=~/\S/)
	{
		foreach my $key( keys %{$this->{'{}high'}})
		{
			$str=~s/$key/$this->{'{}high'}->{$key}->{DB}/g;
            &println($str);
		}
		foreach my $key( keys %{$this->{'{}low'}})
		{
			$str=~s/$key/$this->{'{}low'}->{$key}->{DB}/g;
		}
	}
	return $str;
}
sub new{
	my $this = shift;	
	my $class = ref($this) || $this;	
	my $self = {};	
	bless $self, $class;
    &println("this:".$this);
    &println("class:".$str);
    &println("self:".$self);
	return $self;
}
sub parser_show_configuration_services_epg_pgw_sharedIpPool
{
  my $cmdout;
  my $cmd_name;
  my $cmd_blocks;


  my $sum = 0;
  my $apnName;
  
  ($cmdout, $cmd_name, $cmd_blocks) = @_;
  print "@_\n";

  if ($cmd_name =~ /show configuration services epg pgw shared-ip-pool\s+(\S+)\s*/)
  {
    $apnName = $1;
    print $apnName."\n";
    foreach my $key (keys %apnName2sharedIpPool) {
      if ( $$apnName2sharedIpPool{$key} == $1 ){
        $apnName = $key;
        print "matched apn Name\n";
      }
    }
  }
  
  my @stack;
  if (defined($apnName)){
    while( <$cmdout> )
    {
      my $line = $_;
      if( $line =~ /^>\s(.*)/ )
      {
        return $1;# last;
      }
      
      if($line =~ /\d+\.\d+\.\d+\.\d+\/(\d+)/)
      {
        print "32n: $1\n";
        my $val=(2**(32-$1))-1;
        push @stack, $val;
        print "32val: $val\n";
      } elsif($line =~ /:.*:.*:.*:.*\/(\d+)/) {
        print "64n: $1\n";
        my $val=(2**(128-$1));
        push @stack, $val; 
        print "64val: $val\n";        
      }    
    }
    my $loop;
    for($loop=0; $loop < @stack; $loop++)
    {
      $sum  = $sum + $stack[$loop];
      next;
    }
    $$apnName2nbrIPAddr{$apnName} = $sum;
    print $sum;
  }
  else {
    print "no match";
  }
  print  "\naddr: ".$$apnName2nbrIPAddr{$apnName};
  
}
  
  
&main();