import 'dart:async';
import 'dart:convert';
import 'dart:collection';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'structure.dart';
import 'package:covid_19_dashboard/overall.dart';
import 'package:covid_19_dashboard/detail.dart';

class RoutePage{
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
  route (BuildContext context) {
    fetchDetail().then((value){
      for (var i = 0; i< value.length; i++){
        _countries.add(value[i].country);
        _map[value[i].country] = value[i];
    }
    fetchAll().then((res) {
      return Navigator.push(context,MaterialPageRoute(
            builder: (context) => Worldwide(value: value, info: res, countries: _countries, map: _map,)));
            // info is general information worldwide, map is map of countries, value is list of info of countries
  });

  });
 }
}
class Worldwide extends StatefulWidget{
  var value;
  var info;
  List countries;
  Map map;
  Worldwide({@required this.value, this.info, this.countries, this.map});

  @override
  _WorldwideState createState() => _WorldwideState();
}

class _WorldwideState extends State<Worldwide> {
  RoutePage r =  RoutePage();
  int index = 0;
  int _currentIndex = 0;
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override 
  Widget build(BuildContext context){
    var _page = [
      Listshow(info: widget.info),
      Countrydata(value: widget.value, info: widget.info, countries: widget.countries, map: widget.map)
    ];
    return Scaffold(
      body: 
        //children[_currentIndex],
        SizedBox.expand(
          child: PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() => _currentIndex = index);
            },
            children: <Widget>[
              _page[0],
              _page[1], // forum
            ],
          ),
        ),

       bottomNavigationBar: BottomNavyBar(
        iconSize: 30,
        backgroundColor: Colors.white,
        onItemSelected: (index) {
          setState(() => _currentIndex = index);
          _pageController.animateToPage(
            _currentIndex,
            duration: Duration(
              milliseconds: 200,
            ),
            curve: Curves.easeIn,
          );
        }, // new
        selectedIndex: _currentIndex,
        items: [
          BottomNavyBarItem(
            icon: new Icon(Icons.person),
            title: new Text('Mentor'),
            activeColor: Colors.indigoAccent,
            inactiveColor: Colors.blueGrey[200],
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: new Icon(Icons.home),
            title: new Text('Home'),
            activeColor: Colors.teal,
            inactiveColor: Colors.blueGrey[200],
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: new Icon(Icons.chat_bubble),
            title: new Text('Forum'),
            activeColor: Colors.blue[700],
            inactiveColor: Colors.blueGrey[200],
            textAlign: TextAlign.center,
          ),
        ] )
    ) ;
  }
}