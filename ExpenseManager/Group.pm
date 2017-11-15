package Group;

push(@INC,"E:/Programs/ExpenseManager");
use Person;
my $debug=1;
sub new {
	my $class=shift;
	my $self={
		_groupName=>shift,
		_members=>shift,
		_arr=>[],
	};					
	print "New group created with name $self->{_groupName} and with $self->{_members} members";
	bless $self,$class;
	return $self;
}

sub getGroupName{
	my($self)=@_;
	return $self->{_groupName};
}
sub getMembers{
	my($self)=@_;
	return @{$self->{_arr}};
}

sub addMembers{
	my($self,$memberName,$contribution)=@_;
	$object=new Person($memberName,$contribution);
	print"inside add members after creating object. ";
	@members=@{$self->{_arr}};
	push(@members,$object);
	$self->{_arr}=\@members;
	$ob=$self->{_arr}[0];
	$username=$ob->getFirstName();
	print "\n$username";
}
sub showMembers{
	my($self)=@_;
	for($i=2;$i<$self;$i++){
		$username=$self->[$i];
		print "\nUsername is $username->getFirstName()";
	}
		
}

sub generateReport {
	my($self)=@_;
	my $totalExpenditure=0;
	my @members=@{$self->{_arr}};
	my $size=@members;
	my $ob;
	for(my $i=0;$i<$size;$i++){
		$ob=$members[$i];
		$totalExpenditure+=$ob->getContribution();
	}
	for(my $i=0;$i<$size;$i++){
		$ob=$members[$i];
		$contribution=$ob->getContribution();
		$netContribution=$contribution-$totalExpenditure/$size;
		$ob->setNetContribution($netContribution);
		
		if($debug==1){
		my	$firstName=$ob->getFirstName;
		my	$contribution=$ob->getContribution();
		my	$net=$ob->getNetContribution();
			print "\n|$firstName	|$contribution	|$net	|";
		}
	}
	print "Total expenditure $totalExpenditure";
}
1;