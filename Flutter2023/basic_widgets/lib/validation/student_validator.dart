class StudentValidationMixin{

  String validateFirstName(value){
    var message;
    if(value.length<2){
      message= "You have to write the real name which is longer than 2...";
    }
    return message;
  }

  String validateLastName(value){
    var message;
    if(value.length<2){
      message= "You have to write the real lastname which is longer than 2...";
    }
    return message;
  }

  String validateGrade(value){
    var grade=int.parse(value);
    var message;
    if(grade<0 || grade>100){
      message= "Grade has to be between 0 and 100...";
    }
    return message;
  }
}