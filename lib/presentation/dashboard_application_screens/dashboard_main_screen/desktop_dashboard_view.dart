import 'package:flutter/material.dart';
import 'package:our_test_project/core/components/analytic_cards.dart';


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
            children: const [
              AnalyticCards(),
            ],
          ),
        ),
      ),
    );
  }

}