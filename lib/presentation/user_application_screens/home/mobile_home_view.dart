import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:our_test_project/core/base.dart';
import 'package:our_test_project/core/styles/colors.dart';
import 'package:our_test_project/core/views/plants_card_item.dart';
import 'package:our_test_project/database_models/Get_by_group.dart';
import 'package:our_test_project/models/categorg_model.dart';
import 'package:our_test_project/models/plants_models.dart';
import 'package:our_test_project/presentation/user_application_screens/home/home_navigator.dart';
import 'package:our_test_project/presentation/user_application_screens/home/home_view_model.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class HomeView extends StatefulWidget {
  static const String routeName = "MobileHomeView";

  CategoryModel? category;

  HomeView({super.key, this.category});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends BaseState<HomeView, HomeViewModel>
    implements HomeNavigator {
  final FocusNode _node = FocusNode();
  var _searchTextController = TextEditingController();
  List<PlantsModel>? itemsListSearch;
  String? value;
  bool isCeilSearch = false;
  void dispose() {
    super.dispose();
    _node.dispose();
    _searchTextController?.dispose();
  }

  void initState() {
    super.initState();
    _searchTextController = TextEditingController();
    _searchTextController?.addListener(() {
      setState(() {});
    });
  }

  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white,
            body: FutureBuilder<GetByGroup>(
                future: viewModel
                    .getSlidesByGroupName(widget.category!.categoryName),
                builder: (buildContext, snapshot) {
                  if (snapshot.hasError) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          //zheight: MediaQuery.of(context).size.height*0.50,
                          child: Image.asset(
                            'assets/images/noNetwork.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            'Check your network!',
                            style: TextStyle(fontSize: 15.sp),
                          ),
                        )
                      ],
                    );
                  }
                  var data = snapshot.data;
                  var slides_list = data?.payload;
                  List<PlantsModel> allSlides = slides_list?.map((slide) {
                        return PlantsModel(
                          plant_image: slide.image,
                          latine_name: slide.latineName ?? '',
                          ceilName: slide.ceilName ?? '',
                          speciman: slide.specimen ?? '',
                        );
                      }).toList() ??
                      [];

                  return allSlides.length != 0
                      ? SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 12, left: 12, right: 12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(7.0),
                                child: Column(
                                  children: [
                                    Text('Let\'s make search', style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Row(
                                          children: [
                                            Radio<bool>(
                                              value: false,
                                              groupValue: isCeilSearch,
                                              onChanged: (value) {
                                                setState(() {
                                                  isCeilSearch = value!;
                                                });
                                              },
                                            ),
                                            Text(
                                                "By Plant name",
                                                style: TextStyle(
                                                  fontSize: 13.sp,
                                                  fontWeight: FontWeight.bold,
                                                  color: MyColors.green,
                                                ),
                                              ),

                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Radio<bool>(
                                              value: true,
                                              groupValue: isCeilSearch,
                                              onChanged: (value) {
                                                setState(() {
                                                  isCeilSearch = value!;
                                                });
                                              },
                                            ),
                                              Text(
                                                "By Ceil name",
                                                style: TextStyle(
                                                  fontSize: 13.sp,
                                                  fontWeight: FontWeight.bold,
                                                  color: MyColors.green,
                                                ),
                                              ),


                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),

                              ///New Code for Search
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.circular(40.0),
                                    border: Border.all(
                                      color: MyColors.lightGreen,
                                    )),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      right: 5, left: 5),
                                  child: TextField(
                                    onChanged: (val) {
                                      setState(() {
                                        value = val;
                                        if (isCeilSearch == false) {
                                          if (widget.category ==
                                              "Special groups") {
                                            itemsListSearch = allSlides
                                                .where((element) =>
                                                    element.speciman !=
                                                        null &&
                                                    element.speciman!
                                                        .toLowerCase()
                                                        .contains(val
                                                            .toLowerCase()))
                                                .toList();
                                          } else {
                                            itemsListSearch = allSlides
                                                .where((element) =>
                                                    element.latine_name !=
                                                        null &&
                                                    element.latine_name!
                                                        .toLowerCase()
                                                        .contains(val
                                                            .toLowerCase()))
                                                .toList();
                                          }
                                        } else {
                                          itemsListSearch = allSlides
                                              .where((element) =>
                                                  element.ceilName !=
                                                      null &&
                                                  element.ceilName!
                                                      .toLowerCase()
                                                      .contains(value!
                                                          .toLowerCase()))
                                              .toList();
                                        }

                                        if (_searchTextController!
                                                .text.isNotEmpty &&
                                            itemsListSearch!.isEmpty) {
                                          print(
                                              'itemsListSearch length ${itemsListSearch!.length}');
                                        }
                                        // If the user has previously searched by ceilName and the search query is not empty,
                                        // update the search results to show items matching the ceilName again.
                                      });
                                    },
                                    controller: _searchTextController,
                                    focusNode: _node,
                                    decoration: InputDecoration(
                                        hintText: 'Find_Your_Plant/Ceil  ',
                                        hintStyle: Theme.of(context)
                                            .textTheme
                                            .bodySmall,
                                        border: InputBorder.none,
                                        prefixIcon: const Icon(
                                          Icons.search,
                                          color: Colors.grey,
                                        ),
                                        suffixIcon: IconButton(
                                          onPressed:
                                              _searchTextController!
                                                      .text.isEmpty
                                                  ? null
                                                  : () {
                                                      _searchTextController
                                                          ?.clear();
                                                      _node.unfocus();
                                                    },
                                          icon: Icon(
                                            Icons.cancel,
                                            color: _searchTextController!
                                                    .text.isNotEmpty
                                                ? Colors.red
                                                : Colors.grey,
                                          ),
                                        )),
                                  ),
                                ),
                              ),
                              _searchTextController!.text.isNotEmpty &&
                                      itemsListSearch!.isEmpty
                                  ? Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Image(
                                          image: AssetImage(
                                            'assets/images/noResult.png',
                                          ),
                                          fit: BoxFit.cover,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 8.0),
                                          child: Text(
                                            'Ooops , No results found!',
                                            style: TextStyle(
                                                fontSize: 15.sp),
                                          ),
                                        )
                                      ],
                                    )
                                  :

                                  /// plants Show
                                  Column(
                                      children: [
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.01,
                                        ),
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.75,
                                          child: GridView.builder(
                                            gridDelegate:
                                                SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 2,
                                              crossAxisSpacing: 15,
                                              mainAxisSpacing: 17,
                                              childAspectRatio: 0.65.sp,
                                            ),
                                            itemCount:
                                                _searchTextController
                                                        .text.isEmpty
                                                    ? allSlides.length
                                                    : itemsListSearch!
                                                        .length,
                                            itemBuilder:
                                                (context, index) =>
                                                    _searchTextController
                                                            .text.isEmpty
                                                        ? PlantsCardItem(
                                                            plantsModel:
                                                                allSlides[
                                                                    index],
                                                            category: widget
                                                                .category,
                                                          )
                                                        : PlantsCardItem(
                                                            plantsModel:
                                                                itemsListSearch![
                                                                    index],
                                                            category: widget
                                                                .category,
                                                          ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                              .size
                                              .height *
                                              0.0,
                                        ),
                                      ],
                                    ),
                            ],
                          ),
                        ),
                      )
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              //zheight: MediaQuery.of(context).size.height*0.50,
                              child: Image.asset(
                                'assets/images/noData.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Text(
                                'Ooops , No Data found!',
                                style: TextStyle(fontSize: 15.sp),
                              ),
                            )
                          ],
                        );
                })),
      ),
    );
  }

  @override
  HomeViewModel initViewModel() {
    return HomeViewModel();
  }
}
