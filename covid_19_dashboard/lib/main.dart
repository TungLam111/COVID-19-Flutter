import 'dart:async';
import 'package:flutter/material.dart';
import 'structure.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'mainhome.dart';
import 'data.dart';
import 'calendar_select.dart';
void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MainHome());
  }
}

Future<List<Detail>> fetchDetail() async {
    final response =
      await http.get('https://disease.sh/v3/covid-19/countries');
  
    if (response.statusCode == 200) {
     final jsonObject = json.decode(response.body);
      return jsonObject
        .map<Detail>((json) => Detail.fromJson(json))
        .toList(growable: false);
    
  } else {
    throw Exception('${response.statusCode}');
    
  }
}
class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //Future<List<Detail>> futureAlbum;
  List futureFlag ;
  @override
  void initState() {
    super.initState();
    //futureAlbum = fetchDetail();
    futureFlag = getFlag();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Fetch Data Example'),
        ),
        body: Center(
          child: ListView.builder(
                  itemCount: flag.length,
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {             
          return Center(
            child:  Text("${flag[index]}")
                );
        }   
          ),
          ),
        ),
    );
  }
}