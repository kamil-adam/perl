package UNIVERSAL;

sub AUTOLOAD {

}
	
sub singleton_method {
	my ($self, $name, $lambda) = @_;
	my $super = ref $self;
	my $extend = "SINGLETONS::".(0+$self);
	*{$extend."::".$name} = $lambda;
	if ($extend ne $super) {
		@{$extend."::ISA"} = ($super);
		bless $self, $extend
	}	
}


	
1;