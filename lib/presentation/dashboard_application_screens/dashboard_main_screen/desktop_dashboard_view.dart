import 'package:flutter/material.dart';
import 'package:our_test_project/presentation/dashboard_application_screens/dashboard_main_screen/modules/analytic_cards.dart';

import 'modules/borrowed_slides_analytic.dart';
import 'modules/slides_request.dart';


class DesktopDashboardView extends StatelessWidget
{
  static const String routeName = 'DashboardContentScreen';

  const DesktopDashboardView({super.key});

  @override
  Widget build(BuildContext context) {
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
              const BorrowedSlidesAnalytic(),
            ],
          ),
        ),
      ),
    );
  }

}