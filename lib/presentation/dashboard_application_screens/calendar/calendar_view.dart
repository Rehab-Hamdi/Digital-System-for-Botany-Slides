
import 'package:flutter/material.dart';
import 'package:our_test_project/core/custom_widgets/page_title.dart';
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
            const SizedBox(height: 15,),
            const PageTitle(title: 'Calender', wdth: 0.20,),
            const SizedBox(height: 15,),
            Container(
              decoration:  const BoxDecoration(
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
                lastDay: DateTime.utc(2050,10, 20),
                focusedDay: DateTime.now(),
                rowHeight: 60,
                headerVisible: true,
                daysOfWeekVisible: false,
                sixWeekMonthsEnforced: true,
                shouldFillViewport: false,
                // headerStyle: const HeaderStyle(titleTextStyle:TextStyle(fontSize: 30, color: MyColors.active),
                //     formatButtonVisible: false,
                //     titleCentered: true),
                calendarStyle: const CalendarStyle(todayTextStyle: TextStyle(fontSize: 22, color: Colors.red)),

              ),
            ),
          ],
        ),
      ),
    );

  }
}