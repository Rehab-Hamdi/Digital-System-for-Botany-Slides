import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:our_test_project/core/views/categorg_card_item.dart';
import 'package:our_test_project/core/styles/colors.dart';
import 'package:our_test_project/models/categorg_model.dart';
import 'package:sizer/sizer.dart';

class CategoryView extends StatefulWidget {

  static const String routeName = "CategoryView";

  CategoryView({super.key});

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  List allCategories = [
    CategoryModel(
        color: MyColors.categoryBlue,
        categoryNumber: '1',
        categoryName: 'Phycology'),
    CategoryModel(
        color: MyColors.bink,
        categoryNumber: '2',
        categoryName: 'Archegoniate'),
    CategoryModel(
        color: MyColors.categoryRed,
        categoryNumber: '3',
        categoryName: 'Gymnosperm'),
    CategoryModel(
        color: MyColors.categoryYellow,
        categoryNumber: '4',
        categoryName: 'Monocotyledon'),
    CategoryModel(
        color: MyColors.categoryOrange,
        categoryNumber: '5',
        categoryName: 'Dicotyledon'),
    CategoryModel(
        color: MyColors.categoryGreen,
        categoryNumber: '6',
        categoryName: 'Fossil'),
    CategoryModel(
        color: Colors.black,
        categoryNumber: '7',
        categoryName: 'Special groups'),
  ];
  int touchedIndex=0;
  @override
  Widget build(BuildContext context)
  {

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Container(
                  padding: const EdgeInsets.all(7.0),
                  child:  Text( "All Categories",
                    style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),) ,
                ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.79,
              child: GridView.builder(
                  gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 1,
                      mainAxisSpacing: 2,
                      childAspectRatio: 0.7.sp
                  ),
                  itemCount: allCategories.length,
                  itemBuilder:(context, index)=> CategoryCardItem(categoryModel:allCategories[index])),
            )
          )

              ],
            ),
          ),
        ),
      ),
    );
  }
}