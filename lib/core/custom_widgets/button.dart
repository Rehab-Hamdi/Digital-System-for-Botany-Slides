import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  double width;
  double height;
  Color color;
  String title;
  double radius;
  VoidCallback function;

  CustomButton(
      {super.key,
      required this.width,
      required this.height,
      required this.color,
      required this.title,
      required this.radius,
      required this.function});

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
            onPressed: function,
            style: OutlinedButton.styleFrom(
              backgroundColor: color,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(radius),
              ),
            ),
            child: Text(
              title,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  color: Colors.white),
              textAlign: TextAlign.center,
            )),
      ),
    );
  }
}
