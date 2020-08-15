import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CategoryScroller extends StatelessWidget {

  @override
  Widget build(BuildContext context){
    return SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      child: Container(
                          margin: EdgeInsets.symmetric(
                              vertical: 20, horizontal: 20),
                          child: FittedBox(
                              fit: BoxFit.fill,
                              alignment: Alignment.topCenter,
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.only(right: 10),
                                    width: 150,
                                    height: MediaQuery.of(context).size.height * 0.2,                                     
                                    decoration: BoxDecoration(color: Colors.orange, borderRadius: BorderRadius.all(Radius.circular(20))),
                                    child: Center(child: Text("Menu", style: TextStyle(color: Colors.white)))
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(right: 10),
                                    width: 150,
                                    height: MediaQuery.of(context).size.height * 0.2,                                     
                                    decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.all(Radius.circular(20))),
                                    child: Center(child: Text("Menu", style: TextStyle(color: Colors.white)))
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(right: 10),
                                    width: 150,
                                    height: MediaQuery.of(context).size.height * 0.2,                                     
                                    decoration: BoxDecoration(color: Colors.purple, borderRadius: BorderRadius.all(Radius.circular(20))),
                                    child: Center(child: Text("Menu", style: TextStyle(color: Colors.white)))
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(right: 10),
                                    width: 150,
                                    height: MediaQuery.of(context).size.height * 0.2,                                     
                                    decoration: BoxDecoration(color: Colors.yellowAccent, borderRadius: BorderRadius.all(Radius.circular(20))),
                                    child: Center(child: Text("Menu", style: TextStyle(color: Colors.white)))
                                  ),
                                  
                                ],
                              ))));
  }
}
class Article{
  String thumb;
  String title;
 
 
  Article({this.thumb,this.title});
}
final List<Article> imgList = [
  Article(thumb: 'https://i1-suckhoe.vnecdn.net/2020/08/15/benh-vien-2-6538-1597494423.jpg?w=680&h=0&q=100&dpr=1&fit=crop&s=1vt-CJ9rqDuN1WOkM8NM_A',
   title: 'Bệnh nhân khỏi Covid-19 song không thể về nhà'),
  Article(thumb: 'https://i1-suckhoe.vnecdn.net/2020/08/15/1-1597492895-3606-1597493135.jpg?w=680&h=0&q=100&dpr=1&fit=crop&s=KBgfT7atah-d2x1U61cEnw',
  title: 'Thêm 10 bệnh nhân Đà Nẵng khỏi Covid-19'),
  Article(thumb: 'https://i1-suckhoe.vnecdn.net/2020/08/15/IMG9787-1597500022-6481-1597500068.jpg?w=680&h=408&q=100&dpr=1&fit=crop&s=UKmBxR9OxYYEg4Bika0Zkw',
  title: 'Đà Nẵng tìm người đến đám tang có 3 người nhiễm nCoV'),
  Article(thumb: 'https://i1-suckhoe.vnecdn.net/2020/08/15/200316-coronavirus-new-york-ph-4799-3083-1597459128.jpg?w=680&h=0&q=100&dpr=1&fit=crop&s=gLvDEbfrv3Xa2E_7TP-NVA',
  title: 'Tin giả về Covid-19 tràn lan'),
  Article(thumb: 'https://i1-suckhoe.vnecdn.net/2020/08/15/ah8-jpg-1587272421-6481-159673-8439-4040-1597476172.jpg?w=680&h=0&q=100&dpr=1&fit=crop&s=3Is14mfQJ16LAxBKnLQKCw',
  title: 'Ba bệnh nhân Covid-19 ở Hà Nội tổn thương 60% phổi') ,
  Article(thumb: 'https://i1-suckhoe.vnecdn.net/2020/08/14/Mr-Son-9398-1597422298.jpg?w=680&h=0&q=100&dpr=1&fit=crop&s=EL2t-y9VOr-l7GR_MMqSkA',
  title: 'Ba bài học rút ra từ điều trị Covid-19 ở Đà Nẵng')
];
/*
final List<String> imgList = [
  'https://i1-suckhoe.vnecdn.net/2020/08/15/benh-vien-2-6538-1597494423.jpg?w=680&h=0&q=100&dpr=1&fit=crop&s=1vt-CJ9rqDuN1WOkM8NM_A',
  'https://i1-suckhoe.vnecdn.net/2020/08/15/1-1597492895-3606-1597493135.jpg?w=680&h=0&q=100&dpr=1&fit=crop&s=KBgfT7atah-d2x1U61cEnw',
  'https://i1-suckhoe.vnecdn.net/2020/08/15/IMG9787-1597500022-6481-1597500068.jpg?w=680&h=408&q=100&dpr=1&fit=crop&s=UKmBxR9OxYYEg4Bika0Zkw',
  'https://i1-suckhoe.vnecdn.net/2020/08/15/200316-coronavirus-new-york-ph-4799-3083-1597459128.jpg?w=680&h=0&q=100&dpr=1&fit=crop&s=gLvDEbfrv3Xa2E_7TP-NVA',
  'https://i1-suckhoe.vnecdn.net/2020/08/15/ah8-jpg-1587272421-6481-159673-8439-4040-1597476172.jpg?w=680&h=0&q=100&dpr=1&fit=crop&s=3Is14mfQJ16LAxBKnLQKCw' ,
  'https://i1-suckhoe.vnecdn.net/2020/08/14/Mr-Son-9398-1597422298.jpg?w=680&h=0&q=100&dpr=1&fit=crop&s=EL2t-y9VOr-l7GR_MMqSkA'
];*/

final List<Widget> imageSliders = imgList.map((item) => GestureDetector(
  onTap: (){

  },
  child: Container(
    margin: EdgeInsets.all(5.0),
    child: ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(5.0)),
      child: Stack(
        children: <Widget>[
          Image.network(item.thumb, fit: BoxFit.cover, width: 1000.0),
          Positioned(
            bottom: 0.0,
            left: 0.0,
            right: 0.0,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(200, 0, 0, 0),
                    Color.fromARGB(0, 0, 0, 0)
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              child: Text(             
                '${item.title}',
                maxLines: 2,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      )
    ),
  ),
)).toList();
class CarouselWithIndicatorDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CarouselWithIndicatorState();
  }
}

class _CarouselWithIndicatorState extends State<CarouselWithIndicatorDemo> {
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return  Column(
        children: [
          CarouselSlider(
            items: imageSliders,
            options: CarouselOptions(
              autoPlay: true,
              enlargeCenterPage: true,
              aspectRatio: 2.0,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              }
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: imgList.map((url) {
              int index = imgList.indexOf(url);
              return Container(
                width: 8.0,
                height: 8.0,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _current == index
                    ? Color.fromRGBO(0, 0, 0, 0.9)
                    : Color.fromRGBO(0, 0, 0, 0.4),
                ),
              );
            }).toList(),
          ),
        ]
      
    );
  }
}
class Search extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return 
    Container(
     padding: EdgeInsets.all(10),
        child: Container(
        
          padding: EdgeInsets.only(top: 10),
          width: MediaQuery.of(context).size.width * 0.5,
          
          child: GestureDetector(
            onTap: (){},
            child: Text("Enter",textAlign: TextAlign.center, style: TextStyle(color: Colors.grey, fontSize: 15))
          ),
       decoration: BoxDecoration(color: Colors.grey[200], borderRadius: BorderRadius.all(Radius.circular(20))) 
    )
  );
    
  }
}
class InfoDetail extends StatelessWidget{
  var info;
  InfoDetail({@required  this.info});
  
  @override 
  Widget build(BuildContext context){
    return Container(
      padding: EdgeInsets.only(top : 15, left:25),
      height: MediaQuery.of(context).size.height * 0.3,
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: BoxDecoration(color: Colors.grey[200], borderRadius: BorderRadius.all(Radius.circular(15)), 
      boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.6),
                  spreadRadius: 3,
                  blurRadius: 7,
                  offset: Offset(0, 5), // changes position of shadow
                ),
              ], ) ,
      child: Column(
        children: <Widget>[
          Row(children: <Widget>[
            Container(
              
              height: 70,
              width: 130,
              child: Column(
                children: [
                  Container(height: 7, decoration: BoxDecoration(color: Colors.yellow, borderRadius: BorderRadius.all(Radius.circular(10)))),
                  SizedBox( height: 15),
                  Text("${info.cases}", style: TextStyle(color: Colors.yellow),  textAlign: TextAlign.center,),
                  SizedBox( height: 13),
                  Text("Confirmed",style: TextStyle(color: Colors.yellow, fontWeight: FontWeight.bold,fontSize: 16))
                ],
              ),
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(10)),) ,
            ),
            
            SizedBox(
              width: 15
            ),
            Container(
              
              height: 70,
              width: 130,
              child: Column(
                children: [
                  Container(height: 7, decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.all(Radius.circular(10)))),
                  SizedBox( height: 15),
                  Text("${info.deaths}", style: TextStyle(color: Colors.red),  textAlign: TextAlign.center,),
                  SizedBox( height: 13),
                  Text("Deaths",style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold,fontSize: 16))
                ],
              ),
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(10))) ,
            ),
            
          ],),
          SizedBox(height : 10),
          Row(children: <Widget>[
            Container(
              
              height: 70,
              width: 130,
              child: Column(
                children: [
                  Container(height: 7, decoration: BoxDecoration(color: Colors.green, borderRadius: BorderRadius.all(Radius.circular(10)))),
                  SizedBox( height: 15),
                  Text("${info.recovered}", style: TextStyle(color: Colors.green),  textAlign: TextAlign.center,),
                  SizedBox( height: 13),
                  Text("Recovered",style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold,fontSize: 16))
                ],
              ),
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(10))) ,
            ),
            SizedBox(width: 15),
            Container(
              
              height: 70,
              width: 130,
              child: Column(
                children: [
                  Container(height: 7, decoration: BoxDecoration(color: Colors.blue[700], borderRadius: BorderRadius.all(Radius.circular(10)))),
                  SizedBox( height: 15),
                  Text("${info.active}", style: TextStyle(color: Colors.blue[700]),  textAlign: TextAlign.center,),
                  SizedBox( height: 13),
                  Text("Active",style: TextStyle(color: Colors.blue[700], fontWeight: FontWeight.bold,fontSize: 16))
                ],
              ),
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(10))) ,
            ),
          ],),
        ],
      )
    );
  }
}

class CardList extends StatelessWidget {
  var detail;
  var flag;
  CardList({@required  this.detail, this.flag});
@override
Widget build(BuildContext context){
  return Card(
    elevation: 10,
    child: Row(
    children : <Widget>[
      SizedBox(width: 13),
       Column(
      children: <Widget> [
        (detail.country.length < 15)? Text("${detail.country}"):Text("${detail.country.split(" ")[0]}"),
        Container(
                        width : 55,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(29),
                          border: Border.all(
                          color: Colors.grey,
                          width: 2,
                          ),
                        ),
                        child: CircleAvatar(
                          radius: 25.0,
                          backgroundColor: Colors.transparent,
                          backgroundImage: NetworkImage(flag.toString()),
                        )),
      ]
    ),
    SizedBox( width: 10),
    Column(
      children: <Widget>[

      Text("Cases", style: TextStyle(fontWeight: FontWeight.bold),),
      SizedBox(height: 10),
      Text("${detail.cases}")
      ]
    ),
    SizedBox( width: 10),
    Column(
      children:<Widget> [
      Text("Deaths",style: TextStyle(fontWeight: FontWeight.bold),),
      SizedBox(height: 10),
      Text("${detail.deaths}")
      ]
    ),
    SizedBox( width: 10),
    Column(
      children: <Widget>[
      Text("Recovered", style: TextStyle(fontWeight: FontWeight.bold),),
      SizedBox(height: 10),
      Text("${detail.recovered}")
      ]
    ),
    SizedBox( width: 10),
    Column(
      children: <Widget>[
      Text("Active",style: TextStyle(fontWeight: FontWeight.bold),),
      SizedBox(height: 10),
      Text("${detail.active}")
      ]
    )
    ],
    

    )) ;
}
}