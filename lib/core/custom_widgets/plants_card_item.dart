
import 'package:flutter/material.dart';
import 'package:our_test_project/core/styles/colors.dart';
import 'package:our_test_project/models/plants_models.dart';

class PlantsCardItem extends StatelessWidget
{

  PlantsCardItem({super.key, required this.plantsModel});

  PlantsModel plantsModel;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(
                color:MyColors.lightGray,
                blurRadius: 7.0, // soften the shadow
                offset: Offset(
                  1.0, // Move to right 10  horizontally
                  2.0, // Move to bottom 10 Vertically
                ),
              ),
            ],
          ),
          child: Card(
            color: MyColors.plantBackground,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  padding: EdgeInsets.only(top: 3.0),
                  width:  MediaQuery.of(context).size.width*0.60,
                  height: MediaQuery.of(context).size.height*0.14,
                  child: Image.asset('assets/images/myPlant.png',
                  ),
                ),
                Container(
                    padding: EdgeInsets.only(left: 15.0, bottom: 10.0),
                  alignment: Alignment.centerLeft,
                    child: Text( plantsModel.plant_name, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)),
              ],
            ),
          ),
        ),
      ),
    );
  }

}