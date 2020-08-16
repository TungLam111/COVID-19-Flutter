import 'package:flutter/material.dart';
import 'constants.dart';
import 'structure.dart';
import 'package:flutter/rendering.dart';
import 'map_world.dart';
import 'map_vietnam.dart';
class Listshow extends StatefulWidget{
  List province;
  var info;
  var value;
  Map mymap;
  Listshow({@required  this.info, this.value,  this.mymap, this.province});

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
        body: SingleChildScrollView(
        child: Column(
            children: <Widget>[

              AnimatedOpacity(
                duration: const Duration(milliseconds: 200),
                opacity: closeTopContainer?0:1,
                child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    width: MediaQuery.of(context).size.width,
                    alignment: Alignment.topCenter,
                    height: closeTopContainer?0:MediaQuery.of(context).size.height* 0.33,
                    child: CarouselWithIndicatorDemo()),
              ),
              
              SizedBox(
              
                child: InfoDetail(info : widget.info),
              ),
              SizedBox(height: 5),
              MapColor(data: widget.value),
              SizedBox(height: 5),
              MapVietnam(data: widget.province),
              SizedBox(height: 5),
              Container(
                color: Colors.red[200], 
                 padding: EdgeInsets.symmetric(vertical: 10),
                 margin: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                children: [
                  Container(
                         width: 100,
                         child: Text("Province", style: TextStyle(color: Colors.white))
                       ),
                       Container(
                         width: 70,
                         child: Text("Confirmed",style: TextStyle(color: Colors.white))
                       ),
                       Container(
                         width: 50,
                         child: Text("Cured",style: TextStyle(color: Colors.white))
                       ),
                       Container(
                         width: 50,
                         child: Text("Critical",style: TextStyle(color: Colors.white))
                       ),
                       Container(
                         width: 50,
                         child: Text("Death",style: TextStyle(color: Colors.white))
                       )
                ],
              )),
              SingleChildScrollView(child:
              ListView.builder(
               shrinkWrap: true,
               primary: false,
               physics: BouncingScrollPhysics(),
               itemCount: widget.province.length,
               itemBuilder: (context, index){
                 var prov = widget.province[index];
                 Color color = index%2==1 ? Colors.red[100] : Colors.white ;
                 return Container(
                   color: color,
                   margin: EdgeInsets.symmetric(horizontal: 20),
                   padding: EdgeInsets.symmetric(vertical: 10),
                   child: Row(
                     children: [
                       
                       Container(
                         width: 100,
                         child: Text("${prov.province}")
                       ),
                       Container(
                         width: 70,
                         child: Text("${prov.cases}")
                       ),
                       Container(
                         width: 50,
                         child: Text("${prov.cure}")
                       ),
                       Container(
                         width: 50,
                         child: Text("${prov.critical}")
                       ),
                       Container(
                         width: 50,
                         child: Text("${prov.death}")
                       )
                     ],
                   )
                 );
               },
             ),
              ),
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
             
             ListView.builder(
                  shrinkWrap: true,
                  primary: false,
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
              
             
            ]
          )
          ,
          
          ),
        
    ));
  }

}