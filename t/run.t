#
# Testscript for Config::General::Extended
#

BEGIN { $| = 1; print "1..7"; }

use lib qw(blib/lib);

use Config::General::Extended;
print "ok\n";
print STDERR "\n1 .. ok (loading Config::General::Extended)\n";




my $conf = new Config::General::Extended("t/test.rc");
print "ok\n";
print STDERR "\n2 .. ok (Creating a new object from config file)\n";




# now test the new notation of new()
my $conf2 = new Config::General::Extended(
					  -file              => "t/test.rc",
					  -AllowMultiOptions => "yes"
					);
print "ok\n";
print STDERR "\n3 .. ok (Creating a new object using the hash parameter way)\n";




my $domain = $conf->obj("domain");
print "ok\n";
print STDERR "\n4 .. ok (Creating a new object from a block)\n";




my $addr = $domain->obj("bar.de");
print "ok\n";
print STDERR "\n5 .. ok (Creating a new object from a sub block)\n";




my @keys = $conf->keys("domain");
print "ok\n";
print STDERR "\n6 .. ok (Getting values from the object)\n";





# test various OO methods
if ($conf->is_hash("domain")) {
  my $domains = $conf->obj("domain");
  foreach my $domain ($conf->keys("domain")) {
    my $domain_obj = $domains->obj($domain);
    foreach my $address ($domains->keys($domain)) {
      my $blah = $domain_obj->value($address);
    }
  }
}
print "ok\n";
print STDERR "\n7 .. ok (Using keys() and values() )\n";



# test AUTOLOAD methods
my $conf3 = new Config::General::Extended( { name => "Moser", prename => "Hannes"} );
my $n = $conf3->name;
my $p = $conf3->prename;
$conf3->name("Meier");
$conf3->prename("Max");
$conf3->save("t/test.cfg");

print "ok\n";
print STDERR "\n8 .. ok (Using AUTOLOAD methods)\n";

