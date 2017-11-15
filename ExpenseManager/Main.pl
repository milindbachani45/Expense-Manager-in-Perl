push(@INC,"E:/Programs/ExpenseManager");
use Group;
my $var=<<'EOF';
	          /\
	         /  \
	________/    \_______
Welcom to expense manager !  
EOF
print "\n$var\n";

my @groups;
$var=<<'EOF';
1. Create a group.
2. Update existing group.
3. See all group.
4. Delete group.
5. EXIT
EOF
$flag=1;
while($flag==1){
	print "\n$var\n";
	my $option = <STDIN>;
	chomp $option;
	
	if($option==1){
		print "\nCreating a group......\n";	
		print "\nProvide the name of group:";
		my $groupName=<STDIN>;
		print "\n\nNumber of members:";
		my $groupSize=<STDIN>;
		my $object=new Group($groupName,$groupSize);
		push(@groups,$object);
		
		for($i=0;$i<$groupSize;$i+=1){
			$j= $i+1;
			print "\nEnter the name of member #$j \n";
			$Member=<STDIN>;
			print "\nHe contributed :  \n";
			$Contribution=<STDIN>;
			$object->addMembers($Member,$Contribution);
		}
		
		if($object ne NULL){
		print "\nGroup created sucessfully!";	
		}
		print "\n_____________________________________________\n";
		print "|Name	|Contribution	|Net Contribution	|";
		$object->generateReport();
		print "\n____________________________________________";
	}
	if($option==2){
	print "Updating a group......";
	print "Select from the following  group......";
	my $count=0;
		foreach my $c(@groups) {
			$groupName=$c->getGroupName();
			$count++;
			print "\n$count $groupName";
		}
		print "Enter choice:";
		$choice=<STDIN>;
		$choice--;
		$ob=$groups[$choice];
		$groupName=$ob->getGroupName();
		print "\n$groupName";
		 $count=0;
		@members=$ob->getMembers();
		foreach my $c(@members){
			$firstName=$c->getFirstName();
			$count++;
			print "\n$count $firstName";
		}
			
	
	}
	if($option==3){
	print "See all group......";
	my $count=0;
		foreach my $c(@groups) {
			$groupName=$c->getGroupName();
			$count++;
			print "\n$count $groupName";
		}     
			print "\nEnter your choice:";
			my $choice=<STDIN>;
			$choice--;
			$ob=$groups[$choice];
			$groupname=$ob->getGroupName();
			print "\n$groupname";
			
			print "\n_____________________________________________\n";
			print "|Name	|Contribution	|Net Contribution	|";
			$ob->generateReport();
			print "\n____________________________________________";
			
			
	}
	if($option==4){
		print "Deleting a group......";
		my $count=0;
		foreach my $c(@groups) {
			$groupName=$c->getGroupName();
			$count++;
			print "\n$count $groupName";
		}
		print "\nEnter your choice:";
			my $choice=<STDIN>;
			$choice--;
			delete $groups[$choice];
		
	}
	if($option==5){
		print "Exit";
		$flag=0;
	}
}