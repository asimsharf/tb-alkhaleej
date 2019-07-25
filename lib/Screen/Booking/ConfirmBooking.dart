import 'package:flutter/material.dart';

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
        title: Text('تأكيد الحجز'),
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
