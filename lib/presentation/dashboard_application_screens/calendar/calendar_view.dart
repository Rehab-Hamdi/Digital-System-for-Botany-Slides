import 'package:flutter/material.dart';
import 'package:Botany/core/styles/colors.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarDashboardView extends StatelessWidget {
  static const String routeName = 'calendar dashboard';

  const CalendarDashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
            ),
            Container(
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(
                      5.0,
                      5.0,
                    ),
                    blurRadius: 10.0,
                    spreadRadius: 2.0,
                  ), //BoxShadow
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(0.0, 0.0),
                    blurRadius: 0.0,
                    spreadRadius: 0.0,
                  ), //BoxShadow
                ],
              ),
              width: 800,
              height: 500,
              child: TableCalendar(
                firstDay: DateTime.utc(1900, 10, 20),
                lastDay: DateTime.utc(2050, 10, 20),
                focusedDay: DateTime.now(),
                rowHeight: 60,
                headerVisible: true,
                daysOfWeekVisible: false,
                sixWeekMonthsEnforced: true,
                shouldFillViewport: false,
                headerStyle: const HeaderStyle(titleTextStyle:TextStyle(fontSize: 30, color: MyColors.active),
                    formatButtonVisible: false,
                    titleCentered: true),
                calendarStyle: const CalendarStyle(
                    todayTextStyle: TextStyle(fontSize: 22, color: Colors.red)),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.09,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  "assets/images/plant1.png",
                ),
                Image.asset("assets/images/plant1.png")
              ],
            )
          ],
        ),
      ),
    );
  }
}
