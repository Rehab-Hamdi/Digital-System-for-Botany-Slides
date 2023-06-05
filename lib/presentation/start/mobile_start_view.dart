import 'package:flutter/material.dart';
import 'package:Botany/core/custom_widgets/button.dart';
import 'package:Botany/core/styles/colors.dart';
import 'package:Botany/presentation/auth/login/login_view.dart';
import 'package:Botany/presentation/start/mobile_start_navigator.dart';

class MobileStartView extends StatelessWidget {
  const MobileStartView({Key? key}) : super(key: key);

  static const String routeName = "mobileStart";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 25.0, right: 25.0, bottom: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text("Welcome to", style: Theme.of(context).textTheme.headline1,),
              const SizedBox(height: 10,),
              Text("Botany.", style: Theme.of(context).textTheme.headline1?.copyWith(fontWeight: FontWeight.bold),),
              const SizedBox(height: 20,),
              Image.asset("assets/images/planet_icon.png"),
              Center(
                child: Text(
                  "start discovering botany department",
                  style: Theme.of(context)
                      .textTheme
                      .headline1
                      ?.copyWith(fontSize: 17),
                ),
              ),
              const SizedBox(
                height: 6,
              ),
              Center(
                child: Text(
                  "with our step-by-step guides and ",
                  style: Theme.of(context)
                      .textTheme
                      .headline1
                      ?.copyWith(fontSize: 17),
                ),
              ),
              const SizedBox(
                height: 6,
              ),
              Center(
                child: Text(
                  "helpful tips.",
                  style: Theme.of(context)
                      .textTheme
                      .headline1
                      ?.copyWith(fontSize: 17),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 8,
              ),

              ///Get Started Button
              CustomButton(
                width: 295,
                height: 56,
                color: MyColors.green,
                title: 'Get Started',
                radius: 25.0,
                function: () => MobileStartNavigator.goToLogin(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
