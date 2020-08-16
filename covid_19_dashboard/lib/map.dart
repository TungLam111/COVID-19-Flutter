import 'package:syncfusion_flutter_maps/maps.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class MapColor extends StatefulWidget {

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
    
    return  Scaffold(
    body: Padding(
      padding: EdgeInsets.all(15),
      child: SfMaps(
        layers: [
          MapShapeLayer(
            delegate: const MapShapeLayerDelegate(
              shapeFile: 'assets/vietnam.json',
              shapeDataField: 'name',
            ),
          ),
        ],
      ),
    ),
  );
  }
        
}


