import 'package:flutter/material.dart';
import 'constants.dart';
import 'structure.dart';
import 'package:flutter/rendering.dart';
import 'map_world.dart';

class Listshow extends StatefulWidget{
  //Widget color;
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
  /*Widget _getMapsWidget(List<Detail> value) {
          
          return Container(  
            color: Colors.white,     
              child: SfMaps(
                title: const MapTitle(
                  text: 'World Population Density (per sq. km.)',
                  padding: EdgeInsets.only(top: 15, bottom: 30),
                ),
                layers: <MapLayer>[
                  MapShapeLayer(
                    delegate: MapShapeLayerDelegate(
                      shapeFile: 'assets/world_map.json',                  
                      shapeDataField: 'name',                    
                      dataCount:value.length,
                      primaryValueMapper: (int index) =>
                          value[index].country,             
                      shapeColorValueMapper: (int index) => int.parse(value[index].cases),
                      shapeTooltipTextMapper: (int index) =>
                          value[index].country +
                          ' : ' + value[index].cases + ' per sq. km.',                     
                      shapeColorMappers: [
                        MapColorMapper(
                            from: 0,
                            to: 50,
                            color: Color.fromRGBO(128, 159, 255, 1),
                            text: '<50'),
                        MapColorMapper(
                            from: 50,
                            to: 100,
                            color: Color.fromRGBO(51, 102, 255, 1),
                            text: '50 - 100'),
                        MapColorMapper(
                            from: 100,
                            to: 250,
                            color: Color.fromRGBO(0, 57, 230, 1),
                            text: '100 - 250'),
                        MapColorMapper(
                            from: 250,
                            to: 500,
                            color: Color.fromRGBO(0, 51, 204, 1),
                            text: '250 - 500'),
                        MapColorMapper(
                            from: 500,
                            to: 1000,
                            color: Color.fromRGBO(0, 45, 179, 1),
                            text: '500 - 1k'),
                        MapColorMapper(
                            from: 1000,
                            to: 5000,
                            color: Color.fromRGBO(0, 38, 153, 1),
                            text: '1k - 5k'),
                        MapColorMapper(
                            from: 5000,
                            to: 10000,
                            color: Colors.red,
                            text: '5k - 10k'),
                        MapColorMapper(
                            from: 10000,
                            to: 50000,
                            color: Colors.blue,
                            text: '10k - 30k'),
                      ],
                    ),
                    color: Colors.grey[100],
                    showLegend: true,
                    enableShapeTooltip: true,
                    strokeColor: Colors.white,
                    legendSettings: const MapLegendSettings(
                        position: MapLegendPosition.bottom,
                        iconType: MapIconType.square,
                        overflowMode: MapLegendOverflowMode.wrap,
                        padding: EdgeInsets.only(top: 15)),
                    tooltipSettings: MapTooltipSettings(
                        color:   Colors.red,
                        strokeColor:
                          
                                 Colors.black),
                  ),
                ],
              ),
            
          );
        
  }
*/
}