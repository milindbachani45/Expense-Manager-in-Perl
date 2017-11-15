push(@INC,'E:/Programs/ExpenseManager');
use Person;
$object=new Person("Akash","Chaudhary","123456");
$firstname=$object->getFirstName();
print "First name is: $firstname";
$object->setFirstName("Nilesh");
$firstname=$object->getFirstName();
print "\nFirst name after modification $firstname";