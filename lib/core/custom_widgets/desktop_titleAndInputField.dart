import 'package:flutter/material.dart';
import 'package:Botany/core/styles/colors.dart';

class DesktopTitleAndInputField extends StatelessWidget {
  DesktopTitleAndInputField({
    super.key,
    required this.txt,
    this.left_margin,
    required this.focusNode,
    required this.controller,
    String? Function(String?)? validatorFunction,
    required this.containerPadding
  });
  final String txt;
  final double? left_margin;
  FocusNode focusNode;
  var controller;
  final double containerPadding ;
  String Function(String?)? validatorFunction;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.only(left: containerPadding),
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
            //height: MediaQuery.of(context).size.height*0.05,
            child: TextFormField(
              controller: controller,
              focusNode: focusNode,
              validator: validatorFunction,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(35.0),
                    borderSide: const BorderSide(
                      color: MyColors.active,
                    )),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(35.0),
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
