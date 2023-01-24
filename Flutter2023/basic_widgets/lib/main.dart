import 'package:flutter/material.dart';
import 'package:basic_widgets/models/student.dart';

void main() {
  runApp(
    MaterialApp(home: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  List<Student> students= [Student("Turan Ediz", "Saçaklı", 100),Student("Turan", "Ediz", 50),Student("Namık", "kimdir", 30)];

  //var students = ["Ali", "Veli", "Hasan", "Hüseyin"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:Text("student tracking system..."),
        ),
        body: buildBody(context),
        );
  }

  String pointResult(int point) {
    String Message = "";
    if (point >= 65) {
      Message = "u passed the exam...";
    } else {
      Message = "u failed...";
    }
    return Message;
  }

  void messageAlert(BuildContext context, String Message) {
    var alert = AlertDialog(
      title: Text("hello dear..."),
      content: Text(Message),
    );
    showDialog(context: context, builder: (BuildContext context) => alert);
  }

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
                    title: Text(students[index].firstName + " " + students[index].lastName),
                    subtitle: Text("sınavdan aldığı not : " + students[index].grade.toString()),
                    trailing: buildStatusIcon(students[index].grade),
                    onTap: (){
                      print(students[index].firstName + " " + students[index].lastName);
                    },
                  );
                })),
        Center(
          child: ElevatedButton(
            onPressed: () {
              var Message = pointResult(20);
              messageAlert(context, Message);
            },
            child: Text(" Show Result ", style: TextStyle( fontSize: 25, color: Colors.white, fontWeight: FontWeight.w400),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildStatusIcon(int grade) {

    if (grade >= 65) {
      return Icon(Icons.done);
    } else {
      return Icon(Icons.dangerous);
    }

  }
}

//body: Column(
//children: <Widget>[
//Expanded(child: ListView(children: <Widget>[Text("Turan Ediz Saçaklı"),Text("Bilinmeyen Saçaklı"),],),),

