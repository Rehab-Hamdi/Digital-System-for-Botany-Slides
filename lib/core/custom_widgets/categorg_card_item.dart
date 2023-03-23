import 'package:flutter/material.dart';
import 'package:our_test_project/core/styles/colors.dart';
import 'package:our_test_project/models/categorg_model.dart';
import 'package:our_test_project/presentation/user_application_screens/home/mobile_home_view.dart';

class CategoryCardItem extends StatelessWidget
{
 const CategoryCardItem({super.key, required this.categoryModel});

  final CategoryModel categoryModel;

  @override
  Widget build(BuildContext context) {
    return  InkWell(
          onTap: (){
            Navigator.pushReplacementNamed(context, MobileHomeView.routeName);
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child:Container(
              decoration:  BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color:Colors.grey.withOpacity(0.4),
                    blurRadius: 7.0, // soften the shadow
                    offset: Offset(
                      1.0, // Move to right 10  horizontally
                      2.0, // Move to bottom 10 Vertically
                    ),
                  ),
                ],
              ),
              child: Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15),
                ),
                color: Colors.white,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.50,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [

                      CircleAvatar(
                        backgroundColor: categoryModel.color,
                        radius: 36,
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 35.0,
                          child: Text(categoryModel.categoryNumber, style: TextStyle(color: categoryModel.color, fontSize: 20),),
                        ),
                      ),
                      Text(categoryModel.categoryName, style: TextStyle(color: categoryModel.color, fontSize: 18)),
                    ],
                  ),
                ),
              ),
            ),
          ),

    );
  }

}