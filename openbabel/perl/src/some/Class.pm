package some::Class;
use UNIVERSAL;

sub new {

	#print "new\n";
	my $self  = shift;
	my $class = ref($self) || $self;
	my $hash  = {};
	bless $hash, $class; 
	$hash->init if $hash->can("init");
	return $hash;
}

sub singleton_methods {
	my ( $self, $name, $lambda ) = @_;
	my $super = ref $self;
	my $extend = "OO::" . ( 0 + $self );
	*{ $extend . "::" . $name } = $lambda;
	if ( $extend ne $super ) {
		@{ $extend . "::ISA" } = ($super);
		bless $self, $extend;
	}
}

1;
