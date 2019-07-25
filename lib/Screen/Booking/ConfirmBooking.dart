import 'package:flutter/material.dart';
import 'package:google_fonts_arabic/fonts.dart';

class ConfirmBooking extends StatefulWidget {
  final String centerId;
  final String departmentId;
  final String bookingDay;
  final String committee;

  ConfirmBooking({
    this.centerId,
    this.departmentId,
    this.bookingDay,
    this.committee,
  });

  @override
  _ConfirmBookingState createState() => _ConfirmBookingState();
}

class _ConfirmBookingState extends State<ConfirmBooking> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'تأكيد الحجز',
          style: TextStyle(
            fontFamily: ArabicFonts.Cairo,
            package: 'google_fonts_arabic',
            fontSize: 14.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            shadows: <Shadow>[
              Shadow(
                offset: Offset(3.0, 3.0),
                blurRadius: 3.0,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
              Shadow(
                offset: Offset(3.0, 3.0),
                blurRadius: 8.0,
                color: Color.fromARGB(125, 0, 0, 255),
              ),
            ],
          ),
        ),
      ),
      body: new Container(
        child: Column(
          children: <Widget>[
            Text('centerId: ${widget.centerId}'),
            Text('departmentId: ${widget.departmentId}'),
            Text('bookingDay: ${widget.bookingDay}'),
            Text('committee: ${widget.committee}'),
          ],
        ),
      ),
    );
  }
}
