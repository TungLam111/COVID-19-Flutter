import 'package:syncfusion_flutter_maps/maps.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class MapColor extends StatefulWidget {
  var data;
  MapColor({@required  this.data});
  @override
  _MapColorState createState() => _MapColorState();
}

class _MapColorState extends State<MapColor> {
  @override
  void initState() {
   
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    
    return Container(  
            color: Colors.white,     
              child: SfMaps(
                title: const MapTitle(
                  text: 'World Confirmed Covid-19 (cases.)',
                  padding: EdgeInsets.only(top: 15, bottom: 30),
                ),
                layers: <MapLayer>[
                  MapShapeLayer(
                    delegate: MapShapeLayerDelegate(
                      shapeFile: 'assets/world_map.json',                  
                      shapeDataField: 'name',                    
                      dataCount:widget.data.length,
                      primaryValueMapper: (int index) =>
                          widget.data[index].country,             
                      shapeColorValueMapper: (int index) => int.parse(widget.data[index].cases),
                      shapeTooltipTextMapper: (int index) =>
                          widget.data[index].country +
                          ' : ' + widget.data[index].cases +' cases.',
                      
                      shapeColorMappers: [
                        MapColorMapper(
                            from: 0,
                            to: 1,
                            color: Colors.blue,
                            text: '<1'),
                        MapColorMapper(
                            from: 1,
                            to: 1000,
                            color: Colors.red[200],
                            text: '<1000'),
                        MapColorMapper(
                            from: 1000,
                            to: 10000,
                            color: Colors.red[300],
                            text: '1k - 10k'),
                        MapColorMapper(
                            from: 10000,
                            to: 100000,
                            color: Colors.red[400],
                            text: '10k - 100k'),
                        MapColorMapper(
                            from: 100000,
                            to: 1000000,
                            color: Colors.red[700],
                            text: '100k - 1m'),                        
                        MapColorMapper(
                            from: 1000000,
                            to: 10000000,
                            color: Colors.red[900],
                            text: '1m - 10m'),                       
                        
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
        
}


