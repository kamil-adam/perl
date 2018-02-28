use POE;
POE::Session->create(
	inline_states => {
		_start => \&start,
		hello  => \&hello
	}
);

print "Uruchamiam jadro\n" $poe_kernel->run();
print "Kończę\n";
exit(0);

sub start {
	my ($kernel) = $_[KERNEL];
	print "przygotowywuję sesję\n";
	$kernel->yield("hello");
}

sub hello { print "Hello world\n"; }
