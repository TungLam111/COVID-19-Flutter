import 'dart:async';
import 'dart:convert';
import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'structure.dart';
import 'fetch.dart';
import 'constants.dart';

class MainHome extends StatefulWidget{

  MainHome({Key key}) : super(key: key);

  @override
  _MainHomeState createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {

  final CategoryScroller categoriesScroller = CategoryScroller();
  ScrollController controller = ScrollController();
  bool closeTopContainer = false;
  double topContainer = 0;

  List _countries = [];
  HashMap _map = new HashMap<String, Detail>();
//fetch data of list of country
  Future<List<Detail>> fetchDetail() async {
    final response =
      await http.get('https://corona.lmao.ninja/v2/countries');
  
    if (response.statusCode == 200) {
     final jsonObject = json.decode(response.body);
      return jsonObject
        .map<Detail>((json) => Detail.fromJson(json))
        .toList(growable: false);
    
  } else {
    throw Exception('${response.statusCode}');
    
  }
}
// fetch data of world
  
  Future<Detail> fetchAll() async {
    final response = await http.get('https://corona.lmao.ninja/v2/all');
     if (response.statusCode == 200) {
    final jsonObject = json.decode(response.body);
    return Detail.fromJson(jsonObject);
  }
  else {
    throw Exception('${response.statusCode}');
  }
 }
  @override
  void initState() {
    super.initState();

    fetchDetail().then((value){
      for (var i = 0; i< value.length; i++){
        _countries.add(value[i].country);
        value[i].flag = "haha";
        _map[value[i].country] = value[i];
    }
    fetchAll().then((res) {
      return Navigator.push(context, MaterialPageRoute(
            builder: (context) => Worldwide(value: value, info: res, countries: _countries, map: _map,)));
  });
  });
    controller.addListener(() {

      double value = controller.offset/119;

      setState(() {
        topContainer = value;
        closeTopContainer = controller.offset > 50;
      });
    });

  }

  @override
  Widget build(BuildContext context){
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed : (){},
          ),
          actions: <Widget>[
            Search(),
            IconButton(
              icon: Icon(Icons.person),
              onPressed: () {},
            )
          ],
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              AnimatedOpacity(
                duration: const Duration(milliseconds: 200),
                opacity: closeTopContainer?0:1,
                child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    width: MediaQuery.of(context).size.width* 0.9,
                    alignment: Alignment.topCenter,
                    height: closeTopContainer?0:MediaQuery.of(context).size.height* 0.3,
                    child: CategoryScroller()),
              ),

            ]
          )
        ),
        /*Expanded(
          child: ListView.builder(
            controller: controller,
            
          )
        )*/
    ));
  }
}