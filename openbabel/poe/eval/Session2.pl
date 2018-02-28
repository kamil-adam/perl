use POE;
for my $session_no ( 1 .. 2 ) {
	POE::Session->create(
		inline_states => {
			hello  => \&hello,
			_start => sub { $_[KERNEL]->alias_set( "session_" . $session_no ) }
		  }
	);
}

$poe_kernel->post( "session_1", "hello", "session_2" );
$poe_kernel->run();
exit(0);

sub hello {
	my ( $kernel, $session, $next ) = @_[ KERNEL, SESSION, ARG0 ];
	print "Event in ", $kernel->alias_list($session), "\n";
	$kernel->post( $next, "hello", $session->ID );
}
