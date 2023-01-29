import 'package:flutter/foundation.dart';

class Student{
 // @required
  int? id;

  String? firstName;
  String? lastName;
  int? grade;
  String _status="";
  /*final name;*/

  Student();
  Student.withId(this.id,this.firstName,this.lastName,this.grade){
    /*firstName=firstName;
    lastName=lastName;
    grade=grade;
    id=id;*/
  }
  //  Student(this.firstName,this.lastName,this.grade){firstName=firstName;    lastName=lastName;    grade=grade;  }
  //  Student.withNoInfo(){  }

  String get getStatus{
    String Message = "";
    if (this.grade! >= 65) {
      Message = "u passed the exam...";
    } else {
      Message = "u failed...";
    }
    return Message;
  }
}