import 'package:basic_widgets/models/student.dart';
import 'package:flutter/material.dart';
import '../validation/student_validator.dart';


class StudentAdd extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _StudentAddState();
  }
}

class _StudentAddState extends State with StudentValidationMixin {
  var student= Student.withNoInfo();
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
          child: Column(

            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: "Student Name", hintText: "Please Write the Name..."),
                //i couldnt start that...
                //validator: validateFirstName,
                onSaved: (String? value){
                  student.firstName=value;
                },
              ),

              SizedBox(height: 5.0),

              TextFormField(
                decoration: InputDecoration(labelText: "Student Name", hintText: "Please Write the Name..."),
              ),

            ],
          ),
        ),
      ),

    );
  }
}
