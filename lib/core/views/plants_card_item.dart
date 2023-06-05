import 'package:flutter/material.dart';
import 'package:Botany/core/styles/colors.dart';
import 'package:Botany/models/categorg_model.dart';
import 'package:Botany/models/plants_models.dart';
import 'package:Botany/presentation/user_application_screens/planet_info/planet_info_view.dart';

class PlantsCardItem extends StatelessWidget {
   PlantsCardItem({Key? key, required this.plantsModel, this.category}) : super(key: key);

  final PlantsModel plantsModel;
  CategoryModel? category;

  @override
  Widget build(BuildContext context) {
    String section= plantsModel.sectionType=='null' ? " ":  ' "${plantsModel.sectionType!}"';
    if(section.length>8)
      {
        section='${section.substring(0,4)}...';
      }
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
              blurRadius: 4, // soften the shadow
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
                    plantsModel.groupName=='Special groups '? plantsModel.speciman!:plantsModel.latine_name! +section,
                    style:  TextStyle(
                      fontSize: 17,
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
