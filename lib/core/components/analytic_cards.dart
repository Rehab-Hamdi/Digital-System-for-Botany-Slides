import 'package:flutter/material.dart';
import 'package:our_test_project/core/custom_widgets/analytic_card.dart';
import 'package:our_test_project/presentation/dashboard_application_screens/dashboard_main_screen/dashboard_data/data.dart';
import 'package:our_test_project/utils/responsiveLayout.dart';


class AnalyticCards extends StatelessWidget {
  const AnalyticCards({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Container(
        child: ResponsiveLayout(
          desktopWidget: AnalyticInfoCardGridView(
            childAspectRatio: size.width < 638 ? 2 :
                             (size.width < 800 ? 2.7 :
                             (size.width >= 800 && size.width <= 911 ? 2 :
                             (size.width > 911 && size.width <= 982 ? 2.8 :
                             (size.width > 982 && size.width <= 985 ? 2.4 :
                             ((size.width > 985 && size.width < 1171 ? 1.4 : 1.8)
                             ))))),
            textSize: size.width < 1035 ? 1 : 0,
            iconSize: (size.width < 1035 && size.width >= 985) ? 5 : 0,
            size: size.width,
            crossAxisCount: size.width <= 985 ? 2 : 4,
          ),
          mobileWidget: AnalyticInfoCardGridView(
            crossAxisCount: size.width <= 860 ? 2 : 4,
            childAspectRatio: 2.8,
            size: size.width,
            //childAspectRatio: ,
          ),
        ),
      ),
    );
  }
}


class AnalyticInfoCardGridView extends StatelessWidget {
  const AnalyticInfoCardGridView({
  Key? key,
  this.crossAxisCount = 4,
  this.childAspectRatio = 1.8,
    this.textSize =0,
    this.iconSize = 0,
    this.size = 0,
  }) : super(key: key);

  final int crossAxisCount;
  final double childAspectRatio;
  final double textSize;
  final double iconSize;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: analyticData.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            childAspectRatio: childAspectRatio,
          ),
          itemBuilder: (context, index) => AnalyticCard(
            info: analyticData[index],
            textSize: textSize,
            iconSize: iconSize,
          ),
        ),
        Center(child: Text("${size}"),)
      ],
    );
  }
}
