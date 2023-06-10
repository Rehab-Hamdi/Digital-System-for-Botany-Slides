import 'package:Botany/models/analytic_info.dart';
import 'package:flutter/material.dart';

class AnalyticInformation{
  static dynamic usersCount = 0 ;
  static dynamic requestsNum = 0 ;

  static List analyticData = [
    AnalyticInfo(
        title: "Total Users",
        subTitle: "Student",
        icon: const Icon(Icons.groups),
        count: usersCount,
        color: Colors.green
    ),
    AnalyticInfo(
        title: "Slide View",
        subTitle: "Viewers",
        icon: const Icon(Icons.vibration),
        count: 3342,
        color: Colors.purple
    ),
    AnalyticInfo(
        title: "Total slides",
        subTitle: "Slide",
        icon: const Icon(Icons.add),
        count: 35000,
        color: Colors.deepPurple
    ),
    AnalyticInfo(
        title: "Requested Slides",
        subTitle: "Slide",
        icon: const Icon(Icons.app_registration),
        count: requestsNum,
        color: Colors.pinkAccent
    ),
  ];
}