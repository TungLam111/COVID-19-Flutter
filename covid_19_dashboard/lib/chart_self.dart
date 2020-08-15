import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart'; 

class Chart extends StatefulWidget {
    Map date;
    var country;
    Chart({this.country, this.date});


  @override
  _ChartState createState() => _ChartState();
}

class LinearSales {
  final String year;
  final int cases;
  final int death;
  int count ;
  LinearSales({this.year,this.count, this.cases,this.death});
  factory LinearSales.fromJson(Map json) {
    return LinearSales(
      year : json['date'],
      cases: json['confirmed'],
      death: json['deaths'],
    );
  }
}
class _ChartState extends State<Chart> {
  List<LinearSales> haha = [];
  @override
  void initState() {
    super.initState();
    widget.date[widget.country].forEach((key, value) { 
      haha.add(LinearSales.fromJson(value));

      });
  }
  
  @override
  Widget build(BuildContext context) {
    
    Comparator<LinearSales> caseCount = (a,b) => a.cases.compareTo(b.cases);
    haha.sort(caseCount);

    for(int i = 0; i< haha.length;i++) {
      haha[i].count = i+1;
 
    }
    var chartt = <LineSeries<LinearSales, num>>[
      LineSeries<LinearSales, num>(
          enableTooltip: false,
          dataSource: haha,
          xValueMapper: (LinearSales sales, _) => sales.count,
          yValueMapper: (LinearSales sales, _) => sales.cases,
          width: 2,
          name: widget.country,
          markerSettings: MarkerSettings(isVisible: false)),
    LineSeries<LinearSales, num>(
          color: Colors.red,
          enableTooltip: false,
          dataSource: haha,
          xValueMapper: (LinearSales sales, _) => sales.count,
          yValueMapper: (LinearSales sales, _) => sales.death,
          width: 2,
          name: widget.country,
          markerSettings: MarkerSettings(isVisible: false))];
    return Container(
                    child: SfCartesianChart(
                        series: chartt
                    )
    );
}
}
