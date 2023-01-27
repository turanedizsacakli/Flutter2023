class StudentValidationMixin{

  String validateFirstName(String value){
    var message;
    if(value.length<2){
      message= "You have to write the real name which is longer than 2...";
    }
    return message;
  }
}