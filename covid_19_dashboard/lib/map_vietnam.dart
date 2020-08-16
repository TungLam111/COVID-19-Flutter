import 'package:syncfusion_flutter_maps/maps.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class MapVietnam extends StatefulWidget {
  var data;
  MapVietnam({@required  this.data});
  @override
  _MapVietnamState createState() => _MapVietnamState();
}

class _MapVietnamState extends State<MapVietnam> {
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
                  text: 'Vietnam Covid-19 distribution (cases.)',
                  padding: EdgeInsets.only(top: 15, bottom: 30),
                ),
                layers: <MapLayer>[
                  MapShapeLayer(
                    delegate: MapShapeLayerDelegate(
                      shapeFile: 'assets/vietnam.json',                  
                      shapeDataField: 'name',                    
                      dataCount:widget.data.length,
                      primaryValueMapper: (int index) =>
                          widget.data[index].province,             
                      shapeColorValueMapper: (int index) => widget.data[index].cases,
                      shapeTooltipTextMapper: (int index) =>
                          widget.data[index].province +
                          ' : ' + '${widget.data[index].cases}' +' cases.',
                      
                      shapeColorMappers: [
                        MapColorMapper(
                            from: 0,
                            to: 1,
                            color: Colors.blue[100],
                            text: '<1'),
                        MapColorMapper(
                            from: 1,
                            to: 10,
                            color: Colors.red[200],
                            text: '<10'),
                        MapColorMapper(
                            from: 10,
                            to: 100,
                            color: Colors.red[400],
                            text: '10 - 100'),
                        MapColorMapper(
                            from: 100,
                            to: 1000,
                            color: Colors.red[600],
                            text: '100 - 1k'),                                     
                        
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


