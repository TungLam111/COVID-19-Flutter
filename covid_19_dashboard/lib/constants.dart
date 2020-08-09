import 'package:flutter/material.dart';

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
                                    height: MediaQuery.of(context).size.height * 0.3,                                     
                                    decoration: BoxDecoration(color: Colors.orange, borderRadius: BorderRadius.all(Radius.circular(20))),
                                    child: Center(child: Text("Menu", style: TextStyle(color: Colors.white)))
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(right: 10),
                                    width: 150,
                                    height: MediaQuery.of(context).size.height * 0.3,                                     
                                    decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.all(Radius.circular(20))),
                                    child: Center(child: Text("Menu", style: TextStyle(color: Colors.white)))
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(right: 10),
                                    width: 150,
                                    height: MediaQuery.of(context).size.height * 0.3,                                     
                                    decoration: BoxDecoration(color: Colors.purple, borderRadius: BorderRadius.all(Radius.circular(20))),
                                    child: Center(child: Text("Menu", style: TextStyle(color: Colors.white)))
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(right: 10),
                                    width: 150,
                                    height: MediaQuery.of(context).size.height * 0.3,                                     
                                    decoration: BoxDecoration(color: Colors.yellowAccent, borderRadius: BorderRadius.all(Radius.circular(20))),
                                    child: Center(child: Text("Menu", style: TextStyle(color: Colors.white)))
                                  ),
                                  /*ImageContainer(
                                    height: MediaQuery.of(context).size.height * 0.3,
                                    url: 'https://d.zmtcdn.com/data/pictures/chains/8/16774318/a54deb9e4dbb79dd7c8091b30c642077_featured_v2.png',// restaurant.imageUrl,
              ),*/
                                ],
                              ))));
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
      padding: EdgeInsets.only(top : 15, left:50),
      height: MediaQuery.of(context).size.height * 0.25,
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: BoxDecoration(color: Colors.grey[200], borderRadius: BorderRadius.all(Radius.circular(15))) ,
      child: Column(
        children: <Widget>[
          Row(children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 20),
              height: 60,
              width: 110,
              child: Text("${info.cases}", style: TextStyle(color: Colors.white),  textAlign: TextAlign.center,),
              decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.all(Radius.circular(10))) ,
            ),
            SizedBox(
              width: 15
            ),
            Container(
              padding: EdgeInsets.only(top: 20),
              height: 60,
              width: 110,
              child: Text("${info.deaths}", style: TextStyle(color: Colors.white), textAlign: TextAlign.center,),
              decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.all(Radius.circular(10))) ,
            )
            
          ],),
          SizedBox(height : 10),
          Row(children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 20),
              height: 60,
              width: 110,
              child: Text("${info.recovered}", style: TextStyle(color: Colors.white), textAlign: TextAlign.center,),
              decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.all(Radius.circular(10))) ,
            ),
            SizedBox(
              width: 15
            ),
            Container(
              padding: EdgeInsets.only(top: 20),
              height: 60,
              width: 110,
              child: Text("${info.active}", style: TextStyle(color: Colors.white),  textAlign: TextAlign.center,),
              decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.all(Radius.circular(10))) ,
            )
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