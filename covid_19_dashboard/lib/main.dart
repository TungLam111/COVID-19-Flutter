import 'dart:async';
import 'package:flutter/material.dart';
import 'structure.dart';
//import 'package:covid_19_dashboard/fetch.dart';
import 'package:http/http.dart' as http;
//import 'dart:async';
import 'dart:convert';
import 'data.dart';
void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MyApp());
  }
}
Future<List<Detail>> fetchDetail() async {
    final response =
      await http.get('https://disease.sh/v3/covid-19/countries');// https://corona.lmao.ninja/v2/countries');
  
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
  Future<List<Detail>> futureAlbum;
  List futureFlag ;
  @override
  void initState() {
    super.initState();
    futureAlbum = fetchDetail();
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
          child: FutureBuilder<List<Detail>>(
            future: futureAlbum,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final result = snapshot.data;
                print(result.length);
                return ListView.builder(
                  itemCount: result.length,
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {             
          final menu = result[index];
          return Center(
            child:  Text("${menu.flag}")
          );
        }
                );
                
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }

              // By default, show a loading spinner.
              return CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}