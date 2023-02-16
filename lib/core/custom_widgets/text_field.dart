import 'package:flutter/material.dart';
import 'package:our_test_project/core/styles/colors.dart';

class CustomTextField extends StatelessWidget {
  FocusNode focusNode;
  String? Function(String?)? validatorFunction;
  var controller;
  Icon preIcon;

  CustomTextField({super.key,
    required this.focusNode,
    required this.controller,
    required this.validatorFunction,
    required this.preIcon,
  }
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:  const EdgeInsets.fromLTRB(20.0,0, 60.0, 0),
      height: MediaQuery.of(context).size.height*0.06,
      child: TextFormField(
        focusNode: focusNode,
        controller: controller,
        validator: validatorFunction,
        decoration: InputDecoration(
            prefixIcon: Icon(preIcon.icon, color: Colors.green ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(40.0),
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(40.0),
                borderSide:const  BorderSide(
                    color:MyColors.lightBlack,))),
      ),
    );
  }
}
