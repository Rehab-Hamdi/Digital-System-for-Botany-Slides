import 'package:flutter/material.dart';

class DrawerListTile extends StatelessWidget {
  const DrawerListTile(
      {super.key,
      required this.title,
      required this.icon,
      this.tap});

  final String title;
  final VoidCallback? tap;
  final Icon icon;
  static Color color = Colors.black;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: tap,
      horizontalTitleGap: 0.0,
      leading:icon,
      title: Text(title, style: TextStyle(fontSize: 14, color: color),),
    );
  }
}
