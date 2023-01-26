import 'package:flutter/material.dart';

class StudentAdd extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _StudentAddStata();
  }
}

class _StudentAddStata extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add New Student..."),
      ),
      body: Center(
        child: Text("Body Side..."),
      ),
    );
  }
}
