import 'package:flutter/material.dart';

class AnalyticInfo{
  final String? title, subTitle;
  final Icon? icon;
  final double iconSize;
  final int? count;
  final Color? color;

  AnalyticInfo({
    this.title,
    this.subTitle,
    this.icon,
    this.count,
    this.color,
    this.iconSize=0,
  });
}