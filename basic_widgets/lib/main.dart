import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(home: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var students = ["Ali", "Veli", "Hasan", "Hüseyin"];
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text("My First Application...")),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
                child: ListView.builder(
                    itemCount: students.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Text(students[index]);
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
        ));
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
}

//body: Column(
//children: <Widget>[
//Expanded(child: ListView(children: <Widget>[Text("Turan Ediz Saçaklı"),Text("Bilinmeyen Saçaklı"),],),),
