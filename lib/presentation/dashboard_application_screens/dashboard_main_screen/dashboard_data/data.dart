import 'package:flutter/material.dart';
import 'package:our_test_project/models/analytic_info.dart';


List analyticData = [
  AnalyticInfo(
      title: "Total Students",
      subTitle: "Student",
      icon: const Icon(Icons.groups),
      count: 856,
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
      count: 17,
      color: Colors.pinkAccent
  ),
];