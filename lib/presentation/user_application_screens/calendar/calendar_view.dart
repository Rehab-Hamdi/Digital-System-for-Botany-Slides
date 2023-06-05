import 'package:flutter/material.dart';
import 'package:Botany/core/styles/colors.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarView extends StatelessWidget {
  static const String routeName = 'calendar';

  const CalendarView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: TableCalendar(
        firstDay: DateTime.utc(1900, 10, 20),
        lastDay: DateTime.utc(2050, 10, 20),
        focusedDay: DateTime.now(),
        rowHeight: 70,
        headerVisible: true,
        daysOfWeekVisible: false,
        sixWeekMonthsEnforced: true,
        shouldFillViewport: false,
        headerStyle:  HeaderStyle(
            titleTextStyle: TextStyle(fontSize: 24, color: MyColors.darkGray),
            formatButtonVisible: false,
            titleCentered: true),
        // calendarStyle: CalendarStyle(todayTextStyle: TextStyle(fontSize: 22, color: MyColors.lightGray)),
      ),
    );
  }
}
