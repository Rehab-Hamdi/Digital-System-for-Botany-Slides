import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);
  static const String routeName = 'homePage';
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body:const  Center(
          child: Text("Home Screen ", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22, color: Colors.black ),),
        ),
      ),
    );
  }
}
