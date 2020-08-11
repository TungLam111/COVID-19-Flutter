import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/classes/event_list.dart';
import 'package:intl/intl.dart' show DateFormat;
class Calender extends StatefulWidget {
  var country;
  Map date;
  Calender({@required  this.country, this.date});
  @override
 _CalenderState createState() =>  _CalenderState();
}
class _CalenderState extends State<Calender> {
  DateTime _currentDate = DateTime(2020, 8, 8);
  DateTime _currentDate2 = DateTime(2020, 8, 8);
  String _currentMonth = DateFormat.yMMM().format(DateTime(2020, 8,8));
  DateTime _targetDateTime = DateTime(2020, 8,8);
//  List<DateTime> _markedDate = [DateTime(2018, 9, 20), DateTime(2018, 10, 11)];
  static Widget _eventIcon =  Container(
    decoration:  BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(1000)),
        border: Border.all(color: Colors.blue, width: 2.0)),
    child:  Icon(
      Icons.person,
      color: Colors.amber,
    ),
  );

  EventList<Event> _markedDateMap =  EventList<Event>(
    events: {
       DateTime(2019, 2, 10): [
         Event(
          date:  DateTime(2019, 2, 10),
          title: 'Event 1',
          icon: _eventIcon,
          dot: Container(
            margin: EdgeInsets.symmetric(horizontal: 1.0),
            color: Colors.red,
            height: 5.0,
            width: 5.0,
          ),
        ),
         Event(
          date:  DateTime(2019, 2, 10),
          title: 'Event 2',
          icon: _eventIcon,
        ),
         Event(
          date:  DateTime(2019, 2, 10),
          title: 'Event 3',
          icon: _eventIcon,
        ),
      ],
    },
  );

  CalendarCarousel  _calendarCarouselNoHeader;

  @override
  void initState() {
    /// Add more events to _markedDateMap EventList
    _markedDateMap.add(
         DateTime(2019, 2, 9),
         Event(
          date:  DateTime(2019, 2, 9),
          title: 'Event 5',
          icon: _eventIcon,
        ));

    _markedDateMap.add(
         DateTime(2019, 2, 10),
         Event(
          date:  DateTime(2019, 2, 10),
          title: 'Event 4',
          icon: _eventIcon,
        ));

    _markedDateMap.addAll( DateTime(2019, 2, 11), [
       Event(
        date:  DateTime(2019, 2, 11),
        title: 'Event 1',
        icon: _eventIcon,
      ),
       Event(
        date:  DateTime(2019, 2, 11),
        title: 'Event 2',
        icon: _eventIcon,
      ),
       Event(
        date:  DateTime(2019, 2, 11),
        title: 'Event 3',
        icon: _eventIcon,
      ),
    ]);
    super.initState();
  }
  String convert(DateTime date){
    
    return "${date.year}-${date.month}-${date.day}";
  
  }
  @override
  Widget build(BuildContext context) {

    /// Example Calendar Carousel without header and custom prev & next button
    _calendarCarouselNoHeader = CalendarCarousel<Event>(
      todayBorderColor: Colors.green,
      onDayPressed: (DateTime date, List<Event> events) {
        this.setState(() => _currentDate2 = date);
        events.forEach((event) => print(event.title));
        print(_currentDate2.day);
        print(_currentDate2.month);
        print(_currentDate2.year);
        print(convert(_currentDate2));
      },
      daysHaveCircularBorder: true,
      showOnlyCurrentMonthDate: false,
      weekendTextStyle: TextStyle(
        color: Colors.red,
      ),
      thisMonthDayBorderColor: Colors.grey,
      weekFormat: false,
//      firstDayOfWeek: 4,
      markedDatesMap: _markedDateMap,
      height: 350.0,
      selectedDateTime: _currentDate2,
      targetDateTime: _targetDateTime,
      customGridViewPhysics: NeverScrollableScrollPhysics(),
      markedDateCustomShapeBorder: CircleBorder(
        side: BorderSide(color: Colors.yellow)
      ),
      markedDateCustomTextStyle: TextStyle(
        fontSize: 18,
        color: Colors.blue,
      ),
      showHeader: false,
      todayTextStyle: TextStyle(
        color: Colors.blue,
      ),
      // markedDateShowIcon: true,
      // markedDateIconMaxShown: 2,
      // markedDateIconBuilder: (event) {
      //   return event.icon;
      // },
      // markedDateMoreShowTotal:
      //     true,
      todayButtonColor: Colors.yellow,
      selectedDayTextStyle: TextStyle(
        color: Colors.yellow,
      ),
      minSelectedDate: _currentDate.subtract(Duration(days: 720)),
      maxSelectedDate: _currentDate.add(Duration(days: 720)),
      prevDaysTextStyle: TextStyle(
        fontSize: 16,
        color: Colors.pinkAccent,
      ),
      inactiveDaysTextStyle: TextStyle(
        color: Colors.tealAccent,
        fontSize: 16,
      ),
      onCalendarChanged: (DateTime date) {
        this.setState(() {
          _targetDateTime = date;
          _currentMonth = DateFormat.yMMM().format(_targetDateTime);
        });
      },
      onDayLongPressed: (DateTime date) {
        print('long pressed date $date');
      },
    );
    
    return new  Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(
                  top: 30.0,
                  bottom: 16.0,
                  left: 16.0,
                  right: 16.0,
                ),
                child: new Row(
                  children: <Widget>[
                    Expanded(
                        child: Text(
                      _currentMonth,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24.0,
                      ),
                    )),
                    FlatButton(
                      child: Text('PREV'),
                      onPressed: () {
                        setState(() {
                          _targetDateTime = DateTime(_targetDateTime.year, _targetDateTime.month -1);
                          _currentMonth = DateFormat.yMMM().format(_targetDateTime);
                        });
                      },
                    ),
                    FlatButton(
                      child: Text('NEXT'),
                      onPressed: () {
                        setState(() {
                          _targetDateTime = DateTime(_targetDateTime.year, _targetDateTime.month +1);
                          _currentMonth = DateFormat.yMMM().format(_targetDateTime);
                        });
                      },
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16.0),
                child: _calendarCarouselNoHeader,
              ),
             
              widget.date[widget.country][convert(_currentDate2)] != null ? Text("${widget.date[widget.country][convert(_currentDate2)]['confirmed']}"): Text("null"),
              widget.date[widget.country][convert(_currentDate2)] != null ? Text("${widget.date[widget.country][convert(_currentDate2)]['deaths']}"): Text("null"),
              widget.date[widget.country][convert(_currentDate2)] != null ? Text("${widget.date[widget.country][convert(_currentDate2)]['recovered']}"): Text("null"),
              Column(
                children: <Widget> [
                  Row(children: <Widget> [
                    
                  ]),
                  Row(children: <Widget> [

                  ])
                ],
              )
            ],
          
        );
  }
}
