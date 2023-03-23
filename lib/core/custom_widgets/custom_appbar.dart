import 'package:flutter/material.dart';
import 'package:our_test_project/utils/responsive.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return !ResponsiveWidget.isDestop(context)
        ? AppBar(
            leading: IconButton(
              icon: const Icon(
                Icons.menu,
                color: Colors.black,
              ),
              onPressed: (){},
            ),
            elevation: 0,
            backgroundColor: Colors.white,
            title: const Text(
              'Botany',
              style: TextStyle(color: Colors.black, fontSize: 22),
            ),
          )
        : AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            title: const Text(
              'Botany',
              style: TextStyle(color: Colors.black, fontSize: 22),
            ),
          );
  }
}
