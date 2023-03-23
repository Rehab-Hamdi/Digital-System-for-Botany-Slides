import 'package:flutter/material.dart';

class ResponsiveWidget extends StatelessWidget {
  final Widget desktop;
  final Widget? tablet;
  final Widget mobile;

  const ResponsiveWidget({
    super.key,
    required this.desktop,
    this.tablet,
    required this.mobile,
  });

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 850;
  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width < 1100 &&
      MediaQuery.of(context).size.width >= 850;
  static bool isDestop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 800;

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    if (_size.width >= 1100) {
      return desktop;
    } else if (_size.width >= 850 && tablet != null) {
      return tablet!;
    } else {
      return mobile;
    }
  }
}
