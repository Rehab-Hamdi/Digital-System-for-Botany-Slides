import 'package:flutter/material.dart';
import 'package:our_test_project/models/analytic_info.dart';

class AnalyticInformation{
  static int usersCount = 0;
  static int? registeredSlidesNum = 0;

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
        title: "Registered Slides",
        subTitle: "Slide",
        icon: const Icon(Icons.app_registration),
        count: registeredSlidesNum,
        color: Colors.pinkAccent
    ),
  ];
}