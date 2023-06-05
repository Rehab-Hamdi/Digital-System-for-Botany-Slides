import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:Botany/core/styles/colors.dart';

class BarChartSlidesRequest extends StatelessWidget {
  const BarChartSlidesRequest({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    const style = TextStyle(
      color: MyColors.myGray,
      fontSize: 13,
      fontWeight: FontWeight.bold,
    );
    double barWidth = MediaQuery.of(context).size.width/30;
    double barsSpace = 20;
    return BarChart(
      BarChartData(
        maxY: 80,
        alignment: BarChartAlignment.spaceAround,
        barTouchData: BarTouchData(
          touchTooltipData: BarTouchTooltipData(
            tooltipBgColor: MyColors.myDarkBlue,
            getTooltipItem: (BarChartGroupData group, int groupIndex, BarChartRodData rod, int rodIndex){
              return BarTooltipItem(
                "${rod.toY.round()}\nRequests",
                const TextStyle(color: MyColors.myGray, fontWeight: FontWeight.bold),
              );
            }
          ),
        ),
        gridData: FlGridData(
          show: true,
          drawVerticalLine: false,
        ),
        borderData: FlBorderData(
          border: Border.all(width: 0),
        ),
        titlesData: FlTitlesData(
          show: true,
          topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (double x, TitleMeta meta){
                final titles = ["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"];
                return Text(titles[x.toInt()-1], style: style,);
              },
            ),
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (double y, TitleMeta meta){
                return Text(y.toInt().toString(), style: style,);
              },
            ),
          ),
          rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        ),
        barGroups: [
          BarChartGroupData(x: 1,barsSpace: barsSpace ,barRods: [
            BarChartRodData(
              toY: 45,
              width: barWidth,
              color: MyColors.myBlue,
              borderRadius: BorderRadius.circular(5),
              backDrawRodData: BackgroundBarChartRodData(
                show: true,
                toY: 55,
                color: MyColors.myBlue.withOpacity(0.1),
              ),
            ),
          ]),
          BarChartGroupData(x: 2,barsSpace: 20 ,barRods: [
            BarChartRodData(
              toY: 60,
              width: barWidth,
              color: MyColors.myBlue,
              borderRadius: BorderRadius.circular(5),
              backDrawRodData: BackgroundBarChartRodData(
                show: true,
                toY: 70,
                color: MyColors.myBlue.withOpacity(0.1),
              ),
            ),
          ]),
          BarChartGroupData(x: 3,barsSpace: barsSpace ,barRods: [
            BarChartRodData(
              toY: 65,
              width: barWidth,
              color: MyColors.myBlue,
              borderRadius: BorderRadius.circular(5),
              backDrawRodData: BackgroundBarChartRodData(
                show: true,
                toY: 75,
                color: MyColors.myBlue.withOpacity(0.1),
              ),
            ),
          ]),
          BarChartGroupData(x: 4,barsSpace: barsSpace ,barRods: [
            BarChartRodData(
              toY: 58,
              width: barWidth,
              color: MyColors.myBlue,
              borderRadius: BorderRadius.circular(5),
              backDrawRodData: BackgroundBarChartRodData(
                show: true,
                toY: 65,
                color: MyColors.myBlue.withOpacity(0.1),
              ),
            ),
          ]),
          BarChartGroupData(x: 5,barsSpace: barsSpace ,barRods: [
            BarChartRodData(
              toY: 42,
              width: barWidth,
              color: MyColors.myBlue,
              borderRadius: BorderRadius.circular(5),
              backDrawRodData: BackgroundBarChartRodData(
                show: true,
                toY: 52,
                color: MyColors.myBlue.withOpacity(0.1),
              ),
            ),
          ]),
          BarChartGroupData(x: 6,barsSpace: barsSpace ,barRods: [
            BarChartRodData(
              toY: 56,
              width: barWidth,
              color: MyColors.myBlue,
              borderRadius: BorderRadius.circular(5),
              backDrawRodData: BackgroundBarChartRodData(
                show: true,
                toY: 66,
                color: MyColors.myBlue.withOpacity(0.1),
              ),
            ),
          ]),
          BarChartGroupData(x: 7,barsSpace: barsSpace ,barRods: [
            BarChartRodData(
              toY: 62,
              width: barWidth,
              color: MyColors.myBlue,
              borderRadius: BorderRadius.circular(5),
              backDrawRodData: BackgroundBarChartRodData(
                show: true,
                toY: 72,
                color: MyColors.myBlue.withOpacity(0.1),
              ),
            ),
          ]),
          BarChartGroupData(x: 8,barsSpace: barsSpace ,barRods: [
            BarChartRodData(
              toY: 77,
              width: barWidth,
              color: MyColors.myBlue,
              borderRadius: BorderRadius.circular(5),
              backDrawRodData: BackgroundBarChartRodData(
                show: true,
                toY: 87,
                color: MyColors.myBlue.withOpacity(0.1),
              ),
            ),
          ]),
          BarChartGroupData(x: 9,barsSpace: barsSpace ,barRods: [
            BarChartRodData(
              toY: 39,
              width: barWidth,
              color: MyColors.myBlue,
              borderRadius: BorderRadius.circular(5),
              backDrawRodData: BackgroundBarChartRodData(
                show: true,
                toY: 49,
                color: MyColors.myBlue.withOpacity(0.1),
              ),
            ),
          ]),
          BarChartGroupData(x: 10,barsSpace: barsSpace ,barRods: [
            BarChartRodData(
              toY: 55,
              width: barWidth,
              color: MyColors.myBlue,
              borderRadius: BorderRadius.circular(5),
              backDrawRodData: BackgroundBarChartRodData(
                show: true,
                toY: 65,
                color: MyColors.myBlue.withOpacity(0.1),
              ),
            ),
          ]),
          BarChartGroupData(x: 11,barsSpace: barsSpace ,barRods: [
            BarChartRodData(
              toY: 44,
              width: barWidth,
              color: MyColors.myBlue,
              borderRadius: BorderRadius.circular(5),
              backDrawRodData: BackgroundBarChartRodData(
                show: true,
                toY: 54,
                color: MyColors.myBlue.withOpacity(0.1),
              ),
            ),
          ]),
          BarChartGroupData(x: 12,barsSpace: barsSpace ,barRods: [
            BarChartRodData(
              toY: 20,
              width: barWidth,
              color: MyColors.myBlue,
              borderRadius: BorderRadius.circular(5),
              backDrawRodData: BackgroundBarChartRodData(
                show: true,
                toY: 30,
                color: MyColors.myBlue.withOpacity(0.1),
              ),
            ),
          ]),
        ],
      ),
    );
  }
}
