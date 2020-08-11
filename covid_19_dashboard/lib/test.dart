import 'package:flutter/material.dart';

class Test extends StatefulWidget{

  Map map;
  Test({@required this.map});
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {

  @override 
  Widget build(BuildContext context){
    return Scaffold(
      body: Text("${widget.map['2020-1-22']['confirmed']}")
    ) ;
  }
}