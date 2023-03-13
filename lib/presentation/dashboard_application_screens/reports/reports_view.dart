import 'package:flutter/material.dart';

class ReportsView extends StatelessWidget
{
  static const String routeName = 'Reports ';

  const ReportsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Reports Screen', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
    );
  }

}