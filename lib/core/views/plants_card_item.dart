
import 'package:flutter/material.dart';
import 'package:our_test_project/core/styles/colors.dart';
import 'package:our_test_project/models/plants_models.dart';
import 'package:our_test_project/presentation/planet_info/planet_info_view.dart';

class PlantsCardItem extends StatelessWidget
{

  PlantsCardItem({super.key, required this.plantsModel});

  PlantsModel plantsModel;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushReplacementNamed(context, PlanetInfoView.routeName,
            arguments: plantsModel);
      },
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Container(
          decoration:  BoxDecoration(
            boxShadow: [
              BoxShadow(
                color:Colors.grey.withOpacity(0.4),
                blurRadius: 5.0, // soften the shadow
                offset: Offset(
                  1.0, // Move to right 10  horizontally
                  2.0, // Move to bottom 10 Vertically
                ),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Card(
                color: MyColors.plantBackground,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                child: Column(
                  //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      //padding: EdgeInsets.only(top: 8.0, bottom: 4.0),
                      padding: EdgeInsets.all(15.0),
                      width: 450,
                      height: 125,
                      child: Image.asset(plantsModel.plant_image),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 20.0, left: 5, right: 5),
                      //alignment: Alignment.centerLeft,
                        child: Text( plantsModel.plant_name, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}