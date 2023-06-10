import 'package:Botany/core/api_manager.dart';
import 'package:Botany/core/custom_widgets/analytic_card.dart';
import 'package:Botany/presentation/dashboard_application_screens/dashboard_main_screen/dashboard_data/data.dart';
import 'package:Botany/utils/responsiveLayout.dart';
import 'package:flutter/material.dart';

class AnalyticCards extends StatelessWidget {
  const AnalyticCards({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: ResponsiveLayout(
        desktopWidget: AnalyticInfoCardGridView(
          crossAxisCount: size.width <= 985 ? 2 : 4,
          childAspectRatio: (size.width < 665 && size.width >= 550)
              ? 2.2
              : ((size.width < 800 && size.width >= 665)
                  ? 2.7
                  : (size.width >= 800 && size.width <= 911
                      ? 2
                      : (size.width > 911 && size.width <= 982
                          ? 2.8
                          : (size.width > 982 && size.width <= 985
                              ? 2.4
                              : ((size.width > 985 && size.width < 1171
                                  ? 1.4
                                  : 1.8)))))),
          textSize: size.width < 1035 ? 1 : 0,
          iconSize: (size.width < 1035 && size.width >= 985) ? 5 : 0,
          size: size.width,
        ),
        mobileWidget: AnalyticInfoCardGridView(
          // size = 511
          crossAxisCount: 2,
          childAspectRatio: size.width <= 395
              ? 1.3
              : (size.width <= 511 && size.width > 395 ? 1.3 : 2),
          textSize: size.width <= 395
              ? 3
              : (size.width <= 511 && size.width > 395 ? 1 : 0),
          iconSize: size.width < 395 ? 2 : 0,
          size: size.width,
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
    this.textSize = 0,
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
    return FutureBuilder<List<dynamic>>(
      future: APIManager.getTotalUsersNum(),
      builder: (context, snapshot) {
        if(snapshot.hasError){
          return Center(
            child: Text(snapshot.error.toString(), style: const TextStyle(color: Colors.red),),
          );
        }
        if(snapshot.hasData) {
          AnalyticInformation.usersCount = snapshot.data![0];
          AnalyticInformation.requestsNum = snapshot.data![1];
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: AnalyticInformation.analyticData.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  childAspectRatio: childAspectRatio,
                ),
                itemBuilder: (context, index) =>
                    AnalyticCard(
                      info: AnalyticInformation.analyticData[index],
                      textSize: textSize,
                      iconSize: iconSize,
                    ),
              ),
              //Center(child: Text("$size")),
            ],
          );
        }
        return const Center(
            child: Center(
              child: CircularProgressIndicator(
                color: Color(0xff39A552),
              ),
            ));
      },
    );
  }
}
