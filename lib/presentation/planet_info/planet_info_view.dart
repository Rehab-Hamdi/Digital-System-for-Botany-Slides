import 'package:flutter/material.dart';
import 'package:our_test_project/core/base.dart';
import 'package:our_test_project/core/custom_widgets/button.dart';
import 'package:our_test_project/core/styles/colors.dart';
import 'package:our_test_project/models/plants_models.dart';
import 'package:our_test_project/presentation/planet_info/planet_info_navigator.dart';
import 'package:our_test_project/presentation/planet_info/planet_info_view_model.dart';
import 'package:our_test_project/presentation/planet_info/provider/favorite_provider.dart';
import 'package:our_test_project/presentation/user_application_screens/home/home_view.dart';
import 'package:provider/provider.dart';

class PlanetInfoView extends StatefulWidget {
  static const String routeName = 'planetInfo';

  @override
  State<PlanetInfoView> createState() => _PlanetInfoViewState();
}

class _PlanetInfoViewState
    extends BaseState<PlanetInfoView, PlanetInfoViewModel>
    implements PlanetInfoNavigator {
  PlantsModel? plantsModel;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FavoriteProvider>(context);
    plantsModel = ModalRoute.of(context)?.settings.arguments as PlantsModel;
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: SafeArea(
        child: Scaffold(
          extendBodyBehindAppBar: true,
          backgroundColor: Colors.white,
          appBar: AppBar(
            // leading: IconButton(
            //   color: Colors.black,
            //   icon: const Icon(Icons.arrow_back),
            //   iconSize: 30.0,
            //   onPressed: () {
            //     goToHome();
            //   },
            // ),
            backgroundColor: Colors.transparent,
            elevation: 0,
            actions: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: IconButton(
                  icon: provider.existInFavorite(plantsModel!)
                      ? const Icon(
                          Icons.favorite,
                          color: Colors.red,
                          size: 35.0,
                        )
                      : const Icon(
                          Icons.favorite_outline,
                          color: MyColors.green,
                          size: 35.0,
                        ),
                  onPressed: () {
                    provider.toggleFavorite(plantsModel!);
                    //Navigator.pushReplacementNamed(context, FavoriteView.routeName);
                  },
                ),
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * .45,
                  decoration: const BoxDecoration(
                      color: MyColors.lightGray,
                      borderRadius:
                          BorderRadius.only(bottomRight: Radius.circular(40))),
                  child: Center(
                    child: Image.asset(
                      plantsModel!.plant_image,
                      width: MediaQuery.of(context).size.width * 0.66,
                      height: MediaQuery.of(context).size.height * 0.66,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0, left: 20.0),
                  child: Text(
                    plantsModel!.plant_name,
                    style: Theme.of(context).textTheme.headline2,
                  ),
                ),
                ListView.builder(
                  itemCount: 3,
                  padding: const EdgeInsets.all(20.0),
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return Text(
                      "  ",
                      style: Theme.of(context)
                          .textTheme
                          .headline1!
                          .copyWith(fontSize: 16),
                    );
                  },
                ),
                const Divider(
                  thickness: 3.0,
                  indent: 20.0,
                  endIndent: 20.0,
                  height: 1,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0, left: 20.0),
                  child: Text(
                    "About",
                    style: Theme.of(context).textTheme.headline2,
                  ),
                ),
                const SizedBox(
                  height: 110.0,
                ),
                CustomButton(
                  width: 295,
                  height: 56,
                  color: MyColors.green,
                  title: 'Request',
                  radius: 10.0,
                  function: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  PlanetInfoViewModel initViewModel() {
    return PlanetInfoViewModel();
  }

  @override
  void goToHome() {
    Navigator.pushReplacementNamed(context, HomeScreen.routeName);
  }
}
