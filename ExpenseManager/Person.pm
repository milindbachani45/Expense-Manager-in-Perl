package Person;

sub new {
	my $class=shift;
	my $self={
		_firstname=>shift,
		_contribution=>shift,
		_net=>0,
	};
	print "First name is $self->{_firstname}\n";
	print "Contribution is $self->{_contribution}\n";
	bless $self,$class;
	return  $self;
}
sub setFirstName{
	my ($self,$firstname)=@_;
	$self->{_firstname}=$firstname if defined($firstname);
	return $self->{_firstname};
}

sub getFirstName {
	my($self)=@_;
	return $self->{_firstname};
}
sub getContribution{
	my($self)=@_;
	return $self->{_contribution};
}

sub setNetContribution{
	my ($self,$netContribution)=@_;
	$self->{_net}=$netContribution if defined($netContribution);
}

sub getNetContribution{
	my($self)=@_;
	return $self->{_net};
}

1;

