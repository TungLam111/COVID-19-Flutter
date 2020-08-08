import 'package:flutter/material.dart';
import 'constants.dart';
import 'structure.dart';
//import 'chart.dart';
class Listshow extends StatefulWidget{

  var info;
  var value;
  Map mymap;
  Listshow({@required  this.info, this.value,  this.mymap});

  @override
  _ListshowState createState() => _ListshowState();
}

class _ListshowState extends State<Listshow> {

  final CategoryScroller categoriesScroller = CategoryScroller();
  ScrollController controller = ScrollController();
  bool closeTopContainer = false;
  double topContainer = 0;

  @override
  void initState() {
    super.initState();
    controller.addListener(() {

      double value = controller.offset/119;

      setState(() {
        topContainer = value;
        closeTopContainer = controller.offset > 50;
      });
    });

  }
  void sort1(List<Detail> restaurants){
    setState(() {
    Comparator<Detail> deathsCount = (a,b) => int.parse(b.deaths).compareTo(int.parse(a.deaths));
    restaurants.sort(deathsCount);
    });
  }
  void sort2(List<Detail> restaurants){
    setState(() {
    Comparator<Detail> casesCount = (a,b) => int.parse(b.cases).compareTo(int.parse(a.cases));
    restaurants.sort(casesCount);
    });
  }
  void sort3(List<Detail> restaurants){
    setState(() {
    Comparator<Detail> recoverCount = (a,b) => int.parse(b.recovered).compareTo(int.parse(a.recovered));
    restaurants.sort(recoverCount);
    });
  }
  @override
  Widget build(BuildContext context){
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 10,
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(Icons.menu, color: Colors.grey),
            onPressed : (){},
          ),
          actions: <Widget>[
            Search(),
            IconButton(
              icon: Icon(Icons.search, color: Colors.grey),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.person, color: Colors.grey),
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
                    width: MediaQuery.of(context).size.width,
                    alignment: Alignment.topCenter,
                    height: closeTopContainer?0:MediaQuery.of(context).size.height* 0.3,
                    child: CategoryScroller()),
              ),
              SizedBox(height: 5),
              Container(
                child: InfoDetail(info : widget.info),
              ),
              SizedBox(height: 5),
              
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget> [
                  FlatButton(
                onPressed: (){
                  sort1(widget.value);
                },
                child: Text("deaths")
              ),
              FlatButton(
                onPressed: (){
                  sort2(widget.value);
                },
                child: Text("cases")
              ),
              FlatButton(
                onPressed: (){
                  sort3(widget.value);
                },
                child: Text("recovered")
              ),
                ]
              ),

              Expanded(
                child: ListView.builder(
                  controller: controller,
                  itemCount: widget.value.length,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) {             
                      var menu = widget.value[index];
                      var flag = widget.mymap[menu.country.toString()];
                      double scale = 1.0;
                        if (topContainer > 0.5) {
                          scale = index + 0.5 - topContainer;
                          if (scale < 0) {
                            scale = 0;
                          } else if (scale > 1) {
                            scale = 1;
                          }
                        }
                        return CardList(detail: menu, flag: flag );
        }
                )
              )

            ]
          )
        ),
        
    ));
  }
}