import 'package:flutter/material.dart';
import 'package:our_test_project/core/styles/colors.dart';
import 'package:our_test_project/models/categorg_model.dart';
import 'package:our_test_project/models/plants_models.dart';
import 'package:our_test_project/presentation/user_application_screens/planet_info/planet_info_view.dart';
import 'package:sizer/sizer.dart';

class PlantsCardItem extends StatelessWidget {
   PlantsCardItem({Key? key, required this.plantsModel, this.category}) : super(key: key);

  final PlantsModel plantsModel;
  CategoryModel? category;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, PlanetInfoView.routeName,
            arguments: plantsModel);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22.5),
          boxShadow: [
            BoxShadow(
              color:MyColors.lightGrey.withOpacity(0.45),
              blurRadius: 3.5, // soften the shadow
              offset: const Offset(
                1.0, // Move to right 10  horizontally
                2.0, // Move to bottom 10 Vertically
              ),
            ),
          ],
        ),
        child:Card(
          color: Colors.white,
          shape:RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(23.0),
          ) ,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: Image.asset(
                  plantsModel.plant_image,
                  fit: BoxFit.cover,
                ),
              ),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    plantsModel.groupName=='Special groups '? plantsModel.speciman!:plantsModel.latine_name!,
                    style:  TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
