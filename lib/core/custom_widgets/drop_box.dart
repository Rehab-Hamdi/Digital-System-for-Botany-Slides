import 'package:flutter/material.dart';

class DropBox extends StatefulWidget {
  DropBox({Key? key}) : super(key: key);
  List<String> returnedList = ['not returned', 'returned'];

  static String? returnedState = 'not returned';
  @override
  State<DropBox> createState() => _DropBoxState();
}

class _DropBoxState extends State<DropBox> {


  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        'Returned State',
        style: TextStyle(fontSize: 15, color: Colors.black),
      ),
      trailing: DropdownButton(
        items: widget.returnedList
            .map((String value) => DropdownMenuItem(
          value: value,
          child: Text(value),
        ))
            .toList(),
        value: DropBox.returnedState,
        onChanged: (String? val) {
          setState(() {
            DropBox.returnedState = val!;
          });
        },
        style: const TextStyle(color: Colors.black, fontSize: 15),
      ),
    );
  }
}
