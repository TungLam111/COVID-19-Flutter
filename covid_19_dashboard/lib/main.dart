import 'package:flutter/material.dart';
import 'mainhome.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/gestures.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MainHome());
  }
}
class CountryDensityModel {
  const CountryDensityModel(this.country, this.density);

  final String country;
  final String density;
}

final data = <CountryDensityModel>[
      CountryDensityModel('China', '26337'),
      CountryDensityModel('Brazil', '21717'),
      CountryDensityModel('Australia', '8358'),
      CountryDensityModel('United States of America', '7140'),
      CountryDensityModel('Russia','3369'),
      CountryDensityModel('Canada','2239'),
      CountryDensityModel('Indonesia', '1820'),
      CountryDensityModel('India', '1802'),
    ];

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  
  @override
  void initState() {
    super.initState();
  }
       @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center( child: Container(color: Colors.red, child: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "HAHAHA",
              ),
              TextSpan(
              
                text: "huhu",
                recognizer: TapGestureRecognizer()
                  ..onTap = () async {
                    final url = 'https://github.com/flutter/gallery/';
                    if (await canLaunch(url)) {
                      await launch(
                        url,
                        forceSafariVC: false,
                      );
                    }
                  },
              ),
              TextSpan(
                text: "kk",
              ),
            ],
          ),
    ))));
    }
  /*@override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("${vietnam['2020-1-22']['confirmed']}"),
        ),
        body: ListView.builder(
        itemCount: kkk.length,
        itemBuilder: (context, index) {
          var project = kkk[index];
          return Text(project);
                 
        })
       /* Center(
          child: FutureBuilder<List<Detail>>(
                future: futureAlbum,
                builder: (context, snapshot){
              
                var result = snapshot.data;
                return ListView.builder(
        itemCount: result.length,
        itemBuilder: (context, index) {
          var project = result[index];
          return Text("${project.country}");
                 
                });
                }),
        ),*/
    ));*/}
