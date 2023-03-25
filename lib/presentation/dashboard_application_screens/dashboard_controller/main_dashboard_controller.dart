
import 'package:flutter/material.dart';
import 'package:our_test_project/core/components/desktop_drawer_menu.dart';
import 'package:our_test_project/core/components/drawer_menu_mobile.dart';
import 'package:our_test_project/utils/responsive.dart';


class DashBoardScreenController extends StatelessWidget {
  static const String routeName = 'DashBoardScreen';

  const DashBoardScreenController({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      /*drawer: MobileDrawerMenu(name: 'Dr Alsafa'),
      appBar: !ResponsiveWidget.isDestop(context)
          ? AppBar(
              leading: IconButton(
                icon: const Icon(
                  Icons.menu,
                  color: Colors.black,
                ),
                onPressed: context.read<Controller>().controlMenu,
              ),
              elevation: 0,
              backgroundColor: Colors.white,
              title: const Text(
                'Botany',
                style: TextStyle(color: Colors.black, fontSize: 22),
              ),
            )
          : AppBar(
              leading: Image.asset('assets/images/welcome.jpg'),
              elevation: 0,
              backgroundColor: Colors.white,
              title: const Text(
                'Botany',
                style: TextStyle(color: Colors.black, fontSize: 22),
              ),
            ),
      key: context.read<Controller>().scaffoldKey,*/
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ResponsiveWidget.isDestop(context)?
            const Expanded( child: DesktopDrawerMenu()):  Expanded(child: MobileDrawerMenu()),
          ],
        ),
      ),
    );
  }
}
