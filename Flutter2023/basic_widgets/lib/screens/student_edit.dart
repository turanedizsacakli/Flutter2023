import 'package:basic_widgets/models/student.dart';
import 'package:flutter/material.dart';
import 'package:basic_widgets/validation/student_validator.dart';


class StudentEdit extends StatefulWidget {
  Student selectedStudent;
  StudentEdit(Student this.selectedStudent);

  @override
  State<StatefulWidget> createState() {
    return _StudentEditState(selectedStudent);
  }
}

class _StudentEditState extends State with StudentValidationMixin {
  Student selectedStudent;
  //var student = Student();
  var formKey = GlobalKey<FormState>();

  _StudentEditState(Student this.selectedStudent);

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
      initialValue: selectedStudent.firstName,
      decoration: InputDecoration(
          labelText: "Student Name", hintText: "Please Write the Name..."),
      //i couldnt start that...
      validator: (value) {
        if(value==null||value.isEmpty){return "enter sth";}else{return null;}
      },
      //validateFirstName,
      onSaved: (value) {
        selectedStudent.firstName = value!;
      },
    );
  }

  Widget buildLastNameField() {
    return TextFormField(
      initialValue: selectedStudent.lastName,
      decoration: InputDecoration(labelText: "Student LastName", hintText: "Please Write the LastName..."),
      //i couldnt start that...
      validator: (value) {
        if(value==null||value.isEmpty){return "enter sth";}else{return null;}
      },
      //validator: validateLastName,
      onSaved: (value) {
        selectedStudent.lastName = value!;
      },
    );
  }

  Widget buildGradeNameField() {
    return TextFormField(
      initialValue: selectedStudent.grade.toString(),
      decoration: InputDecoration(
          labelText: "Student Point", hintText: "Please Write the Point..."),
      //i couldnt start that...
      validator: (value) {
        if(value==null||value.isEmpty){return "enter sth";}else{return null;}
      },
      //validator: validateGrade,
      onSaved: (value) {
        selectedStudent.grade = int.parse(value!);
      },
    );
  }

  Widget buildSubmitButton() {
    return ElevatedButton(
      onPressed: () {
        if (formKey.currentState!.validate()) {
          formKey.currentState!.save();
          saveStudent();
          Navigator.pop(context);
        }
      },
      child: Row(
        children: [
          Icon(Icons.delete),
          SizedBox(width: 5.0),
          Text(" SUBMIT ", style: TextStyle(fontSize: 12,
            color: Colors.white,
          ),),
        ],
      ),
    );
  }

  void saveStudent() {
    print(selectedStudent.firstName);
    print(selectedStudent.lastName);
    print(selectedStudent.grade);
  }
}