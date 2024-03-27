import 'package:flutter/material.dart';

class CalendarDatePickerCustom extends StatefulWidget {
  const CalendarDatePickerCustom({Key? key}) : super(key: key);

  @override
  _CalendarDatePickerCustomState createState() =>
      _CalendarDatePickerCustomState();
}

class _CalendarDatePickerCustomState extends State<CalendarDatePickerCustom> {
  DateTime selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    print(selectedDate);
    return CalendarDatePicker(
      initialDate: selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      onDateChanged: (date) {
        setState(() {
          selectedDate = date;
        });
      },
    );
  }
}
