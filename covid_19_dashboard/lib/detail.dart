import 'package:flutter/material.dart';

class Countrydata extends StatefulWidget{
  final value;
  final info;
  final List countries;
  final Map map;
  Countrydata({@required this.value, this.info, this.countries, this.map});

  @override
  _CountrydataState createState() => _CountrydataState();
}

class _CountrydataState extends State<Countrydata> {

  @override 
  Widget build(BuildContext context){
    return Scaffold();
  }
}