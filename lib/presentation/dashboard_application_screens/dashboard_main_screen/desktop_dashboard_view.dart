import 'package:flutter/material.dart';
import 'package:Botany/presentation/dashboard_application_screens/dashboard_main_screen/modules/analytic_cards.dart';
import 'package:Botany/presentation/dashboard_application_screens/dashboard_main_screen/modules/view_curve.dart';
import 'package:Botany/utils/responsive.dart';

import 'modules/borrowed_slides_analytic.dart';
import 'modules/slides_request.dart';


class DesktopDashboardView extends StatelessWidget
{
  static const String routeName = 'DashboardContentScreen';

  const DesktopDashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children:  [
              const AnalyticCards(),
              const SizedBox(height: 20,),
              SlidesRequest(),
              const SizedBox(height: 25,),
              if(!ResponsiveWidget.isMobile(context) && size.width > 985)
              Row(
                children: [
                  Expanded(flex: size.width <= 1275 ? 1 : 2,child: const ViewCurve()),
                 const Expanded(flex: 1,child: BorrowedSlidesAnalytic()),
               ],
              ),
              if(ResponsiveWidget.isMobile(context) || size.width <= 985)
               const ViewCurve(),
              if(ResponsiveWidget.isMobile(context) || size.width <= 985)
               const SizedBox(height: 25,),
              if(ResponsiveWidget.isMobile(context) || size.width <= 985)
               const BorrowedSlidesAnalytic(),
            ],
          ),
        ),
      ),
    );
  }

}