import 'package:flutter/material.dart';
import 'package:our_test_project/core/styles/colors.dart';
import 'package:our_test_project/models/plants_models.dart';
import 'package:our_test_project/presentation/planet_info/planet_info_view.dart';

class PlantsCardItem extends StatelessWidget {
  PlantsCardItem({super.key, required this.plantsModel});

  PlantsModel plantsModel;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, PlanetInfoView.routeName,
            arguments: plantsModel);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: MyColors.lightGrey.withOpacity(0.3),
              blurRadius: 1, // soften the shadow
              offset: const Offset(
                1.0, // Move to right 10  horizontally
                1.0, // Move to bottom 10 Vertically
              ),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Card(
              color: MyColors.plantBackground,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    //padding: EdgeInsets.only(top: 8.0, bottom: 4.0),
                    padding: EdgeInsets.only(
                        right: 15, left: 15,top: 2, bottom: 8),
                    height: MediaQuery.of(context).size.height * 0.185,
                    decoration: BoxDecoration(),
                    child: Image.asset(
                      plantsModel.plant_image,
                      width: MediaQuery.of(context).size.width*0.338,
                      height: double.infinity,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.only(top: 4.0, bottom: 12),
                      //alignment: Alignment.centerLeft,
                      child: Text(
                        plantsModel.plant_name,
                        style: const TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold),
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
