class Student{
  int id;
  String firstName;
  String lastName;
  int grade;
  String _status="";


  Student.withId(this.id,this.firstName,this.lastName,this.grade){
    firstName=firstName;
    lastName=lastName;
    grade=grade;
    id=id;
  }
  //Student(this.firstName,this.lastName,this.grade){firstName=firstName;lastName=lastName;grade=grade;}

  String get getStatus{
    String Message = "";
    if (this.grade >= 65) {
      Message = "u passed the exam...";
    } else {
      Message = "u failed...";
    }
    return Message;
  }
}