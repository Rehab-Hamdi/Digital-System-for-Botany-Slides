
import 'package:flutter/material.dart';

class NoNetworkApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Center(
            child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                //zheight: MediaQuery.of(context).size.height*0.50,
                child: Image.asset(
                  'assets/images/noNetwork.png',
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  'Check your network!',
                  style: TextStyle(fontSize: 25),
                ),
              )
            ],
          ),
          ),
        ),
      ),
    );
  }
}