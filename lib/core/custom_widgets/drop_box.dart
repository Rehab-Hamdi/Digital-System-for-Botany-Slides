import 'package:flutter/material.dart';

class DropBox extends StatefulWidget {
  DropBox({Key? key}) : super(key: key);

  @override
  State<DropBox> createState() => _DropBoxState();
}

class _DropBoxState extends State<DropBox> {
  List<String> returnedList = ['not returned', 'returned'];

  String? returnedState = 'not returned';

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        'Returned State',
        style: TextStyle(fontSize: 15, color: Colors.black),
      ),
      trailing: DropdownButton(
        items: returnedList
            .map((String value) => DropdownMenuItem(
          value: value,
          child: Text(value),
        ))
            .toList(),
        value: returnedState,
        onChanged: (String? val) {
          setState(() {
            returnedState = val!;
          });
        },
        style: const TextStyle(color: Colors.black, fontSize: 12),
      ),
    );
  }
}
