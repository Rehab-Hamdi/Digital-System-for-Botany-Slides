import 'package:flutter/material.dart';
import 'package:Botany/core/styles/colors.dart';

class PageTitle extends StatelessWidget {
  const PageTitle({super.key, required this.title, required this.wdth});

  final String title;
  final double wdth;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(10.0),
      width: MediaQuery.of(context).size.width*wdth,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          border: Border.all(color: MyColors.active)),
      child: Text(
        title,
        style: const TextStyle(fontSize: 18, color: MyColors.active),
      ),
    );
  }
}
