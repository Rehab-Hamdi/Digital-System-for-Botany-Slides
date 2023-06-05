import 'package:flutter/material.dart';
import 'package:Botany/core/custom_widgets/button.dart';
import 'package:Botany/core/styles/colors.dart';
import 'package:Botany/presentation/start/desktop_start_navigator.dart';

class DesktopStartView extends StatelessWidget {
  const DesktopStartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          Container(
              width: double.infinity,
              height: double.infinity,
              decoration: const BoxDecoration(
              ),
              child: Image.asset(
                "assets/images/wall.jpg",
                fit: BoxFit.fill,
                color: Colors.grey.withOpacity(0.7),
                colorBlendMode: BlendMode.modulate,
              ),
          ),
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width/3,
              height: MediaQuery.of(context).size.height/1.2,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text("Welcome to", style: Theme.of(context).textTheme.headline1,),
                    Text("Botany.", style: Theme.of(context).textTheme.headline1?.copyWith(fontWeight: FontWeight.bold),),
                    Center(child: Image.asset("assets/images/planet_icon_origin.png", height: 250,)),
                    Center(
                      child: Text("start discovering botany department",
                        style: Theme.of(context).textTheme.headline1?.copyWith(fontSize: 17),
                      ),
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
                      height: MediaQuery.of(context).size.height / 15,
                    ),

                    ///Get Started Button
                    CustomButton(
                        width: 250,
                        height: 50,
                        color: MyColors.green,
                        title: 'Get Started',
                        radius: 25.0,
                        function: () => DesktopStartNavigator.goToLogin(context)),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
