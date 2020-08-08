import 'dart:async';
import 'dart:convert';
import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'structure.dart';
//import 'constants.dart';
import 'mainpage.dart';
import 'data.dart';

class MainHome extends StatefulWidget{

  MainHome({Key key}) : super(key: key);

  @override
  _MainHomeState createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
 // List _flag;
  List _countries = [];
  HashMap _map = new HashMap<String, Detail>();
  HashMap _mymap = new HashMap<String, String>();
//fetch data of list of country
  Future<List<Detail>> fetchDetail() async {
    var response =
      await http.get('https://corona.lmao.ninja/v2/countries');
  
    if (response.statusCode == 200) {
     var jsonObject = json.decode(response.body);
      return jsonObject
        .map<Detail>((json) => Detail.fromJson(json))
        .toList(growable: false);
  } else {
    throw Exception('${response.statusCode}');
    
  }
}
Future<Map<String, List<Detail>>> fetchTimeSeri() async {
    var response =
      await http.get('https://pomber.github.io/covid19/timeseries.json');
  
    if (response.statusCode == 200) {
     var jsonObject = json.decode(response.body);
      return jsonObject
        .map<Detail>((json) => Detail.fromJson(json))
        .toList(growable: false);
  } else {
    throw Exception('${response.statusCode}');
    
  }
}
// fetch data of world
  Future<Detail> fetchAll() async {
    var response = await http.get('https://corona.lmao.ninja/v2/all');
     if (response.statusCode == 200) {
    var jsonObject = json.decode(response.body);
    return Detail.fromJson(jsonObject);
  }
  else {
    throw Exception('${response.statusCode}');
  }
 }
  @override
  void initState() {
    super.initState();
    //_flag = getFlag();
    fetchDetail().then((value){
      for (var i = 0; i< value.length; i++){
        _countries.add(value[i].country);
        _mymap[value[i].country] = flag[i];
        _map[value[i].country] = value[i];

    }
    fetchAll().then((res) {
      return Navigator.push(context, MaterialPageRoute(
            builder: (context) => Worldwide(value: value, info: res, countries: _countries, map: _map, mymap: _mymap)));
    });
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(0, 100, 0, 50),
                child: Image(
                  image: AssetImage('assets/images/meliquestreet_20200723_111219_0.jpg'),
                ),
              ),
              RichText(
                text: TextSpan(
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                  ),
                  children: <TextSpan> [
                    TextSpan(
                        text: 'STAY ',
                        style: TextStyle(color: Colors.white)),
                    TextSpan(
                        text: 'HOME  ',
                        style: TextStyle(color: Colors.blueAccent)),
                    TextSpan(
                        text: 'STAY ',
                        style: TextStyle(color: Colors.white)),
                    TextSpan(
                        text: 'SAFE',
                        style: TextStyle(color: Colors.green)),
                  ]
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}