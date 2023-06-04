import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:Botany/core/custom_widgets/indicator.dart';
import 'package:Botany/core/styles/colors.dart';

class BorrowedSlidesAnalytic extends StatefulWidget {
  const BorrowedSlidesAnalytic({Key? key}) : super(key: key);

  @override
  State<BorrowedSlidesAnalytic> createState() => _BorrowedSlidesAnalyticState();
}

class _BorrowedSlidesAnalyticState extends State<BorrowedSlidesAnalytic> {
  int touchedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10, top: 10),
      height: MediaQuery.of(context).size.height / 2,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Borrowed Slides ",
            style: Theme.of(context).textTheme.headline4,
          ),
          const SizedBox(
            height: 30,
          ),
          Expanded(
            child: Stack(
              children: [
                Positioned(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Indicator(
                        color: MyColors.remainSlidesColor,
                        text: 'Remaining Slides',
                        isSquare: true,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Indicator(
                        color: MyColors.studentsColor,
                        text: 'Students',
                        isSquare: true,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Indicator(
                        color: MyColors.doctorsColor,
                        text: 'Doctors',
                        isSquare: true,
                      ),
                    ],
                  ),
                ),
                Positioned(
                  child: PieChart(
                    PieChartData(
                      pieTouchData: PieTouchData(
                        touchCallback: (FlTouchEvent event,
                            pieTouchResponse) {
                          setState(() {
                            if (!event
                                    .isInterestedForInteractions ||
                                pieTouchResponse == null ||
                                pieTouchResponse.touchedSection ==
                                    null) {
                              touchedIndex = -1;
                              return;
                            }
                            touchedIndex = pieTouchResponse
                                .touchedSection!
                                .touchedSectionIndex;
                          });
                        },
                      ),
                      borderData: FlBorderData(
                        show: false,
                      ),
                      sectionsSpace: 0,
                      centerSpaceRadius: 0,
                      sections: showingSections(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(3, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 20.0 : 16.0;
      final radius = isTouched ? 110.0 : 100.0;
      final widgetSize = isTouched ? 55.0 : 40.0;
      const shadows = [Shadow(color: Colors.black, blurRadius: 2)];

      switch (i) {
        case 0:
          //Students Section
          return PieChartSectionData(
            color: MyColors.studentsColor,
            value: 50,
            title: '50%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xffffffff),
              shadows: shadows,
            ),
            badgeWidget: Badge(
              image: 'assets/icons/student.png',
              size: widgetSize,
              borderColor: MyColors.studentsColor,
            ),
            badgePositionPercentageOffset: .98,
          );
        case 1:
          //Doctors Section
          return PieChartSectionData(
            color: MyColors.doctorsColor,
            value: 30,
            title: '30%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xffffffff),
              shadows: shadows,
            ),
            badgeWidget: Badge(
              image: 'assets/icons/doctor.png',
              size: widgetSize,
              borderColor: MyColors.doctorsColor,
            ),
            badgePositionPercentageOffset: .98,
          );
        case 2:
          //Remaining Slides Section
          return PieChartSectionData(
            color: MyColors.remainSlidesColor,
            value: 20,
            title: '20%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xffffffff),
              shadows: shadows,
            ),
            badgeWidget: Badge(
              image: 'assets/icons/slides_box.png',
              size: widgetSize,
              borderColor: MyColors.remainSlidesColor,
            ),
            badgePositionPercentageOffset: .98,
          );
        default:
          throw Exception('Oh no');
      }
    });
  }
}

// Icon For each section Class
class Badge extends StatelessWidget {
  const Badge({
    super.key,
    required this.image,
    required this.size,
    required this.borderColor,
  });

  final String image;
  final double size;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: PieChart.defaultDuration,
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        border: Border.all(
          color: borderColor,
          width: 2,
        ),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black.withOpacity(.5),
            offset: const Offset(3, 3),
            blurRadius: 3,
          ),
        ],
      ),
      padding: EdgeInsets.all(size * .15),
      child: Center(
        child: Image.asset(image),
      ),
    );
  }
}
