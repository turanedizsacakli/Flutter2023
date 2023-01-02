import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: MyApp()
    ),
  );
}


class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("My First Application...")),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            int point=65;
            String Message="";
            if (point>=65){
              Message="u passed the exam...";
            }
            else{
              Message="u failed...";
            }
            var alert = AlertDialog(
              title: Text("hello dear..."),
              content: Text(Message),
            );
            showDialog(context: context, builder: (BuildContext context)=>alert);
          },
          child: Text(" Show Result ", style: TextStyle(
              fontSize: 25, color: Colors.white, fontWeight: FontWeight.w400),
          ),
        ),
      ),
    );
  }
  
}