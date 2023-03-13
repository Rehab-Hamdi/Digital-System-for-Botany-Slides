import 'package:flutter/material.dart';

class AddUserView extends StatelessWidget
{
  static const String routeName = 'Adduser';

  const AddUserView({super.key});

  @override
  Widget build(BuildContext context) {
   return const Center(
     child: Text('Add User Screen', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
   );
  }

}