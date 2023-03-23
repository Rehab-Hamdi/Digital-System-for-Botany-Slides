import 'package:flutter/material.dart';

class RequestView extends StatefulWidget
{
  static const String routeName ='Request';

  const RequestView({super.key});

  @override
  State<RequestView> createState() => _RequestScreenState();
}

class _RequestScreenState extends State<RequestView> {
  @override
  Widget build(BuildContext context) {
   return const Scaffold(
     body: Center(
       child: Text("Welcome"),
     ),
   );
  }
}