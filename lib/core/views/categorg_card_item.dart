import 'package:flutter/material.dart';
import 'package:Botany/models/categorg_model.dart';
import 'package:Botany/presentation/user_application_screens/home/mobile_home_view.dart';

class CategoryCardItem extends StatelessWidget
{
 const CategoryCardItem({super.key, required this.categoryModel});

  final CategoryModel categoryModel;

  @override
  Widget build(BuildContext context) {
    return  InkWell(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeView(category:categoryModel,)));
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child:Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18),
              ),
              elevation: 6,
              color: Colors.white,
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.50,
                //height: 80.sp,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [

                    CircleAvatar(
                      backgroundColor: categoryModel.color,
                      radius: 36,
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 34.0,
                        child: Text(categoryModel.categoryNumber, style: TextStyle(color: categoryModel.color, fontSize: 25),),
                      ),
                    ),
                    Text(categoryModel.categoryName, style: TextStyle(color: categoryModel.color, fontSize: 20)),
                  ],
                ),
              ),
            ),
          ),

    );
  }

}