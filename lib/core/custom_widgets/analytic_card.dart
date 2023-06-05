import 'package:flutter/material.dart';
import 'package:Botany/models/analytic_info.dart';

class AnalyticCard extends StatelessWidget {
  const AnalyticCard({Key? key, required this.info, this.textSize=0, this.iconSize=0}) : super(key: key);

  final AnalyticInfo info;
  final double textSize;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:  const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "${info.title}",
                style: Theme.of(context).textTheme.headline3!.copyWith(fontSize: 13-textSize),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Container(
                padding: const EdgeInsets.all(8.0),
                width: 40-iconSize,
                height: 40-iconSize,
                decoration: BoxDecoration(
                  color: info.color!.withOpacity(0.25),
                  shape: BoxShape.circle
                ),
                child: Center(child:info.icon),
              ),
            ],
          ),
          Text(
            "${info.count}",
            style: Theme.of(context).textTheme.headline4!.copyWith(fontSize: 18-textSize),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Text("${info.subTitle}", style: Theme.of(context).textTheme.headline5!.copyWith(fontSize: 12-textSize),),
        ],
      ),
    );
  }
}
