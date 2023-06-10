import 'package:Botany/core/base.dart';
import 'package:Botany/core/custom_widgets/button.dart';
import 'package:Botany/core/styles/colors.dart';
import 'package:Botany/models/plants_models.dart';
import 'package:Botany/presentation/user_application_screens/home/home_view.dart';
import 'package:Botany/presentation/user_application_screens/planet_info/planet_info_navigator.dart';
import 'package:Botany/presentation/user_application_screens/planet_info/planet_info_view_model.dart';
import 'package:Botany/presentation/user_application_screens/planet_info/provider/favorite_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PlanetInfoView extends StatefulWidget {
  static const String routeName = 'planetInfo';

  @override
  State<PlanetInfoView> createState() => _PlanetInfoViewState();
}

class _PlanetInfoViewState extends BaseState<PlanetInfoView, PlanetInfoViewModel> implements PlanetInfoNavigator {
  PlantsModel? plantsModel;
  String? slidId;
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FavoriteProvider>(context);
    plantsModel = ModalRoute.of(context)?.settings.arguments as PlantsModel;
    slidId = "${plantsModel!.boxNumber}.${plantsModel!.slideNumber}";
    print("${plantsModel!.groupName}e");
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: SafeArea(
        child: Scaffold(
          extendBodyBehindAppBar: true,
          backgroundColor: Colors.white,
          appBar: AppBar(
            iconTheme: const IconThemeData(
              color: Colors.black, // change the color here
            ),
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
                       plantsModel?.plant_image,
                      width: MediaQuery.of(context).size.width * 0.66,
                      height: MediaQuery.of(context).size.height * 0.66,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0, left: 20.0),
                  child: Text(
                    plantsModel?.groupName == 'Special groups '
                        ? plantsModel?.speciman ?? ''
                        : plantsModel?.latine_name ?? '',
                    style: Theme.of(context).textTheme.headline2!.copyWith(fontSize: 24, color: MyColors.green,),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height/40),
                ListTile(
                  title: const Text("Slid Id", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                  leading: const Icon(Icons.border_color_outlined),
                  subtitle: Text(slidId ?? "", style: TextStyle(fontSize: 20),),
                ),
                ListTile(
                  title: plantsModel!.groupName == 'Special groups ' ?
                  const Text("Speciman Name", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)
                      :
                  const Text("Latin Name", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                  leading: const Icon(Icons.type_specimen),
                  subtitle: plantsModel!.groupName == 'Special groups ' ?
                  Text(plantsModel!.speciman ?? "", style: TextStyle(fontSize: 20),)
                      :
                  Text(plantsModel!.latine_name ?? "", style: TextStyle(fontSize: 20),),
                ),
                ListTile(
                  title: const Text("Arabic Name", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                  leading: const Icon(Icons.type_specimen),
                  subtitle: Text(plantsModel!.arabicName ?? "", style: TextStyle(fontSize: 20),),
                ),
                ListTile(
                  title: const Text("Group", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                  leading: const Icon(Icons.groups),
                  subtitle: Text(plantsModel!.groupName ?? "", style: TextStyle(fontSize: 20),),
                ),
                if(plantsModel!.groupName != 'Special groups ')
                ListTile(
                  title: const Text("Family", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                  leading: const Icon(Icons.family_restroom),
                  subtitle: Text(plantsModel!.family ?? "", style: TextStyle(fontSize: 20),),
                ),
                if(plantsModel!.groupName != 'Special groups ')
                ListTile(
                  title: const Text("Section Type", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                  leading: const Icon(Icons.border_color_outlined),
                  subtitle: Text(plantsModel!.sectionType ?? "", style: TextStyle(fontSize: 20),),
                ),
                ListTile(
                  title: const Text("Cell Example", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                  leading: const Icon(Icons.border_color_outlined),
                  subtitle: Text(plantsModel!.ceilName ?? "", style: TextStyle(fontSize: 20),),
                ),
                ListTile(
                  title: const Text("Cupboard", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                  leading: const Icon(Icons.border_color_outlined),
                  subtitle: Text("${plantsModel!.cupboard}", style: TextStyle(fontSize: 20),),
                ),
                ListTile(
                  title: const Text("Box Number", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                  leading: const Icon(Icons.add_box),
                  subtitle: Text("${plantsModel!.boxNumber}", style: TextStyle(fontSize: 20),),
                ),
                const SizedBox(height: 15,),
                const Divider(
                  thickness: 3.0,
                  indent: 20.0,
                  endIndent: 20.0,
                  height: 1,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0, left: 20.0),
                  child: Text("About",
                    style: Theme.of(context).textTheme.headline2,
                  ),
                ),
                ListView.builder(
                  itemCount: 1,
                  padding: const EdgeInsets.only(top: 10, left: 20),
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return Text(
                      "some information about this planet",
                      style: Theme.of(context)
                          .textTheme
                          .headline1!
                          .copyWith(fontSize: 19),
                    );
                  },
                ),
                SizedBox(height: MediaQuery.of(context).size.height/10),
                CustomButton(
                  width: 295,
                  height: 56,
                  color: MyColors.green,
                  title: 'Request',
                  radius: 10.0,
                  function: () async {
                    viewModel.makeRequest(plantsModel!.slide_id);
                  }
                ),
                SizedBox(height: MediaQuery.of(context).size.height/20),
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
