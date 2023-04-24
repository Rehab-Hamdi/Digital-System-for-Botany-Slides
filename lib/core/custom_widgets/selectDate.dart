import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SelectDate extends StatefulWidget {

  FocusNode focusNode;
  String? Function(String?)? validatorFunction;
  var controller;
  String label;
  SelectDate({
    super.key,
    required this.label,
    required this.focusNode,
    required this.controller,
    required this.validatorFunction
  });

  @override
  _SelectDateState createState() => _SelectDateState();
}

class _SelectDateState extends State<SelectDate> {
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(3000),
    );

    if (selectedDate != null) {
      setState(() {
        widget.controller.text = DateFormat('yyyy-MM-dd').format(selectedDate);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      onTap: () => _selectDate(context),
      validator: widget.validatorFunction,
      decoration: InputDecoration(
        labelText: widget.label,
        // border: OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(25.0),
        // ),
      ),
    );
  }
}
