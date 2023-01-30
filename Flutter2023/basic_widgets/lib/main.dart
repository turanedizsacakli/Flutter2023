import 'package:basic_widgets/screens/student_add.dart';
import 'package:basic_widgets/screens/student_edit.dart';
import 'package:flutter/material.dart';
import 'package:basic_widgets/models/student.dart';

void main() {
  runApp(
    MaterialApp(home: MyApp()),
  );
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Student> students= [Student.withId(1,"Turan Ediz", "Saçaklı", 100),
                           Student.withId(2,"Turan", "Ediz", 50),
                           Student.withId(3,"Namık", "kemal", 30)];

  Student selectedStudent= Student.withId(0, "", "", 0);
  //var students = ["Ali", "Veli", "Hasan", "Hüseyin"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:Text("Student Tracking System..."),
        ),
        body: buildBody(context),
        );
  }

  //POINT STUDENT POINT WE WONT USE...!!!
  String pointResult(int point) {
    String Message = "";
    if (point >= 65) {
      Message = "u passed the exam...";
    } else {
      Message = "u failed...";
    }
    return Message;
  }

  // M E S S A G E B O X ! ! !

  void messageAlert(BuildContext context, String Message) {
    var alert = AlertDialog(
      title: Text(" D İ K K A T ! ! ! "),
      content: Text(Message),
    );
    showDialog(context: context, builder: (BuildContext context) => alert);
  }

  // APP BODY SIDE....

  Widget buildBody(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
            child: ListView.builder(
                itemCount: students.length,
                itemBuilder: (BuildContext context, int index) {
                  //return Text(students[index].firstName);
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage("https://blob.sololearn.com/avatars/34c5ebf5-bae7-413b-8f51-9d451c92562a.jpg"),
                    ),
                    title: Text(students[index].firstName! + " " + students[index].lastName!),
                    subtitle: Text("sınavdan aldığı not : " + students[index].grade.toString()+" ["+students[index].getStatus +"] "),
                    trailing: buildStatusIcon(students[index].grade!),
                    onTap: (){
                      setState(() {
                        selectedStudent=students[index];
                      });
                      print(selectedStudent.firstName);

                    },
                  );
                })),
        Text("choosed student : "+selectedStudent.firstName!),

        // B U T T O N S ! ! !

        Row(
          children: [

            // A D D BUTTON...

            Flexible(
              fit: FlexFit.tight,
              flex: 2,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> StudentAdd(students)));
                    },
                    child: Row(
                      children: [
                        Icon(Icons.add),
                        SizedBox(width: 5.0),
                        Text(" ADD ", style: TextStyle( fontSize: 12, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
            ),
            SizedBox(width: 2.0),

            // U P D A T E BUTTON...

            Flexible(
              fit: FlexFit.tight,
              flex: 3,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> StudentEdit(selectedStudent)));
                },
                child: Row(
                  children: [
                    Icon(Icons.update),
                    SizedBox(width: 5.0),
                    Text(" UPDATE ", style: TextStyle( fontSize: 12, color: Colors.white,backgroundColor: Colors.yellow),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(width: 2.0),

            // D E L E T E BUTTON...

            Flexible(
              fit: FlexFit.tight,
              flex: 2,
              child: ElevatedButton(
                onPressed: () {
                    setState(() {
                        students.remove(selectedStudent);
                        var Message = selectedStudent.firstName! + " deleted...!!!";
                        messageAlert(context, Message);
                    });
                },
                child: Row(
                  children: [
                    Icon(Icons.delete),
                    SizedBox(width: 5.0),
                    Text(" DELETE ", style: TextStyle( fontSize: 12, color: Colors.white,backgroundColor: Colors.red),
                    ),
                  ],
                ),
              ),
            )
          ],
        )
      ],
    );
  }

  // ICONS WHICH ARE RIGHT...

  Widget buildStatusIcon(int grade) {
    if (grade >= 65) {
      return Icon(Icons.done);
    } else {
      return Icon(Icons.dangerous);
    }

  }
}