import 'package:basic_widgets/models/student.dart';
import 'package:flutter/material.dart';
import 'package:basic_widgets/validation/student_validator.dart';


class StudentAdd extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _StudentAddState();
  }
}

class _StudentAddState extends State with StudentValidationMixin {
  var student= Student();
  var formKey= GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("Add New Student..."),
      ),

      body: Container(
        //margin: EdgeInsets.only(top:10.0,left: 60),
        margin: EdgeInsets.all(10.0),
        padding: EdgeInsets.all(10.0),
        child: Form(
          key: formKey,
          child: Column(

            children: <Widget>[
              buildFirstNameField(),
              buildLastNameField(),
              buildGradeNameField(),
              buildSubmitButton()

            ],
          ),
        ),
      ),

    );
  }

  Widget buildFirstNameField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Student Name", hintText: "Please Write the Name..."),
      //i couldnt start that...
      validator: validateFirstName,
      onSaved: (String? value){
        student.firstName=value!;
      },
    );
  }

  Widget buildLastNameField() {return TextFormField(
    decoration: InputDecoration(labelText: "Student LastName", hintText: "Please Write the LastName..."),
    //i couldnt start that...
    //validator: validateLastName,
    onSaved: (String? value){
      student.lastName=value!;
    },
  );}

  Widget buildGradeNameField() {return TextFormField(
    decoration: InputDecoration(labelText: "Student Point", hintText: "Please Write the Point..."),
    //i couldnt start that...
    //validator: validateGrade,
    onSaved: (String? value){
      student.grade=int.parse(value!);
    },
  );}

  Widget buildSubmitButton() {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          if(formKey.currentState!.validate()){
            formKey.currentState!.save();
            saveStudent();
          }
        });
      },
      child: Row(
        children: [
          Icon(Icons.dangerous),
          SizedBox(width: 5.0),
          Text(" SUBMIT ", style: TextStyle( fontSize: 12, color: Colors.white),
          ),
        ],
      ),
    );
  }

  void saveStudent() {
    print(student.firstName);
    print(student.lastName);
    print(student.grade);

  }

}
