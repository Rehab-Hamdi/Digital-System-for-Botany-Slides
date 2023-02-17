import 'package:flutter/material.dart';
import 'package:our_test_project/core/styles/colors.dart';
import 'package:our_test_project/presentation/auth/login/desktop_login_view.dart';
import 'package:our_test_project/presentation/auth/login/mobile_login_view.dart';

class CustomButton extends StatelessWidget {
  double width;
  double height;
  Color color;
  String title;
  CustomButton({super.key, required this.width, required this.height, required this.color, required this.title});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: width,
        height: height,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(25.0),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black38,
              offset: Offset(2.0, 5.0),
              blurRadius: 2.0,
              spreadRadius: 1.0,
            ),
          ],
        ),
        child: OutlinedButton(
            onPressed: () {
            },
            style: OutlinedButton.styleFrom(
              backgroundColor: color,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
            ),
            child: Text(
              title,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  color: Colors.white),
              textAlign: TextAlign.center,
            )),
      ),
    );
  }
}
