#!/usr/bin/perl

use lib qw(blib/lib);

use Config::General::Extended;
use Data::Dumper;

my $conf = new Config::General::Extended("test.rc");
print "complete: " . Dumper($conf);


#my %all = $conf->getall;
my $domain = $conf->obj("domain");
print "domain: " . Dumper($domain);


my $addr = $domain->obj("bar.de");
print "addr: " . Dumper($addr);


my @keys = $conf->keys("domain");
print Dumper(\@keys);



# test various OO methods
if ($conf->is_hash("domain")) {
  my $domains = $conf->obj("domain");
  foreach my $domain ($conf->keys("domain")) {
    print "$domain\n";
    my $domain_obj = $domains->obj($domain);
    print "sub obj: " . Dumper($domain_obj);
    foreach my $address ($domains->keys($domain)) {
      print $address . "\@" . $domain . " forward to: " . $domain_obj->value($address) . "\n";
    }
  }
}


# test AUTOLOAD methods
my $conf = new Config::General::Extended( { name => "Moser", prename => "Hannes"} );
print $conf->name . "\n";
print $conf->prename . "\n";
$conf->name("Meier");
$conf->prename("Max");
$conf->save("test.cfg");





# now test the new notation of new()
my $conf = new Config::General::Extended(
					 -file => "test.rc",
					 #-AllowMultiOptions => "no"
					);

print "complete(ext): " . Dumper($conf);



# another test using the new notation
my $conf = new Config::General::Extended(
					 -hash => {name => "Moser", prename => "Hannes"} ,
					);

print "complete(ext.hash): " . Dumper($conf);
