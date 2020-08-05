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
    return Row(
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width * 0.8,
          child: GestureDetector(
            onTap: (){},
            child: Text("Enter location", style: TextStyle(color: Colors.grey, fontSize: 15))
          ),
       decoration: BoxDecoration(color: Colors.grey[200], borderRadius: BorderRadius.all(Radius.circular(20))) 
       ),
        SizedBox(),
        IconButton(
              icon: Icon(Icons.search),
              onPressed: () {},
            ),
      ],
    ) ;
  }
}