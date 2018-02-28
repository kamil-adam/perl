
use some::Class;

#################
print "UNIVERSAL TEST\n";
my $a = some::Class->new;
print "ref  => ref $a\n";
 
#################
print "sigleton method test\n";
$a->singleton_method("name" => sub {print "lambda"});
print "ref  => ref $a\n";

$a->name; 



