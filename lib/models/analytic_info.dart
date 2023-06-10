import 'package:flutter/material.dart';

class AnalyticInfo{
  final String? title, subTitle;
  final Icon? icon;
  final double iconSize;
  final dynamic count;
  final Color? color;

  AnalyticInfo({
    this.title,
    this.subTitle,
    this.icon,
    required this.count,
    this.color,
    this.iconSize=0,
  });
}