import 'package:flutter/material.dart';
import 'package:our_test_project/core/styles/colors.dart';

class TitleAndInputField extends StatelessWidget {
  TitleAndInputField({
    super.key,
    required this.txt,
    this.left_margin,
    required this.focusNode,
    required this.controller,
    this.validatorFunction
  });
  final String txt;
  final double? left_margin;
  FocusNode focusNode;
  var controller;
  String Function(String?)? validatorFunction;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 60),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(right:left_margin!),
            child: Text(
              txt,
              style: TextStyle(fontSize: 18),
            ),
          ),
          SizedBox(
            width: 350,
            height: 40,
            child: TextFormField(
              controller: controller,
              focusNode: focusNode,
              validator: validatorFunction,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: const BorderSide(
                      color: MyColors.active,
                    )),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: const BorderSide(
                      color: MyColors.active,
                    )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
