import 'dart:async';
import 'dart:convert';
import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'structure.dart';
import 'mainpage.dart';
import 'data.dart';

class RoutePage{
  List _flag ; 
  List _countries = [];
  HashMap _map = new HashMap<String, Detail>();
  HashMap mymap = new HashMap<String, String>();
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
    _flag = getFlag();
    fetchDetail().then((value){
      for (var i = 0; i< value.length; i++){
        _countries.add(value[i].country);
        mymap[value[i].country] = _flag[i];
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
