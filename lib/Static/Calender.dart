import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/classes/event_list.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart'
    show CalendarCarousel;

class CalendarPage2 extends StatefulWidget {
  @override
  _CalendarPage2State createState() => new _CalendarPage2State();
}

List<DateTime> availableDaes = [
  DateTime(2019, 7, 1),
  DateTime(2019, 7, 3),
  DateTime(2019, 7, 4),
  DateTime(2019, 7, 5),
  DateTime(2019, 7, 6),
  DateTime(2019, 7, 9),
  DateTime(2019, 7, 10),
  DateTime(2019, 7, 11),
  DateTime(2019, 7, 15),
  DateTime(2019, 7, 11),
  DateTime(2019, 7, 15),
];
List<DateTime> notAvailableDaes = [
  DateTime(2019, 7, 2),
  DateTime(2019, 7, 7),
  DateTime(2019, 7, 8),
  DateTime(2019, 7, 12),
  DateTime(2019, 7, 13),
  DateTime(2019, 7, 14),
  DateTime(2019, 7, 16),
  DateTime(2019, 7, 17),
  DateTime(2019, 7, 18),
  DateTime(2019, 7, 17),
  DateTime(2019, 7, 18),
];

class _CalendarPage2State extends State<CalendarPage2> {
//  DateTime _currentDate2 = DateTime.now();

  static Widget _availableIcon(String day) => Container(
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.all(
            Radius.circular(1000),
          ),
        ),
        child: Center(
          child: Text(
            day,
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
      );

  static Widget _notAvailableIcon(String day) => Container(
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.all(
            Radius.circular(1000),
          ),
        ),
        child: Center(
          child: Text(
            day,
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
      );

  EventList<Event> _markedDateMap = new EventList<Event>(
    events: {},
  );

  CalendarCarousel _calendarCarouselNoHeader;

  var len = 9;
  double cHeight;

  @override
  Widget build(BuildContext context) {
    cHeight = MediaQuery.of(context).size.height;
    for (int i = 0; i < len; i++) {
      _markedDateMap.add(
        availableDaes[i],
        new Event(
          date: availableDaes[i],
          title: 'Event 5',
          icon: _availableIcon(
            availableDaes[i].day.toString(),
          ),
        ),
      );

      for (int i = 0; i < len; i++) {
        _markedDateMap.add(
          notAvailableDaes[i],
          new Event(
            date: notAvailableDaes[i],
            title: 'Event 5',
            icon: _notAvailableIcon(
              notAvailableDaes[i].day.toString(),
            ),
          ),
        );
      }
    }

    _calendarCarouselNoHeader = CalendarCarousel<Event>(
      height: cHeight * 0.54,
      weekendTextStyle: TextStyle(
        color: Colors.red,
      ),
      todayButtonColor: Colors.blue[200],
      markedDatesMap: _markedDateMap,
      markedDateShowIcon: true,
      markedDateIconMaxShown: 1,
      markedDateMoreShowTotal: null,
      // null for not showing hidden events indicator
      markedDateIconBuilder: (event) {
        return event.icon;
      },
    );

    return new Scaffold(
      appBar: new AppBar(
        title: new Text("إختيار تاريخ الحجز"),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            _calendarCarouselNoHeader,
            markerRepresent(Colors.red, "غير متوفر الان"),
            markerRepresent(Colors.green, "متوفر الان"),
          ],
        ),
      ),
    );
  }

  Widget markerRepresent(Color color, String data) {
    return new ListTile(
      leading: new CircleAvatar(
        backgroundColor: color,
        radius: cHeight * 0.022,
      ),
      title: new Text(
        data,
      ),
    );
  }
}
