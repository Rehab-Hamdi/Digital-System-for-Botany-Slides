import 'package:flutter/material.dart';
import 'package:our_test_project/core/views/plants_card_item.dart';
import 'package:our_test_project/core/styles/colors.dart';
import 'package:our_test_project/models/plants_models.dart';
import 'package:our_test_project/presentation/user_application_screens/home/home_view.dart';
import 'package:sizer/sizer.dart';

class MobileHomeView extends StatefulWidget {
  static const String routeName = "MobileHomeView";

  MobileHomeView({super.key});

  @override
  State<MobileHomeView> createState() => _MobileHomeViewState();
}

class _MobileHomeViewState extends State<MobileHomeView> {
  final FocusNode _node = FocusNode();
  var _searchTextController = TextEditingController();
  List<String>? itemsListSearch;

  List<String> PlantsImage = [
    'assets/images/cat1.png',
    'assets/images/cat2.png',
    'assets/images/cat3.png',
    'assets/images/cat4.png',
    'assets/images/cat5.png',
    'assets/images/cat6.png',
    'assets/images/cat7.png',
    'assets/images/cat8.png',
    'assets/images/cat9.png',
    'assets/images/cat10.png',
    'assets/images/cat11.png',
    'assets/images/cat12.png',
    'assets/images/cat13.png',
    'assets/images/cat14.png',
    'assets/images/cat15.png',
    'assets/images/cat16.png',
    'assets/images/cat17.png',
    'assets/images/cat18.png',
    'assets/images/cat19.png',
  ];

  List<String> PlantsName = [
    'Batrachospermum',
    'Chaetophora',
    'Cladophora',
    'Diatoms',
    'Dictyota',
    'Enteromorpha',
    'Euglena',
    'Fucus',
    'Nitella',
    'Nostoc',
    'Oedogonium',
    'Pandorina',
    'Polysiphonia',
    'Stigeoclonium',
    'Olothrix',
    'Cyperus',
    'Volvox',
    'Zygnena',
  ];

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
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 15, left: 15, right: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(7.0),
                      child: const Text(
                        "Let's Find \nYour Slide",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                    ),

                    ///New Code for Search
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40.0),
                          border: Border.all(
                            color: MyColors.lightGreen,
                          )),
                      child: Padding(
                        padding: const EdgeInsets.only(right: 5, left: 5),
                        child: TextField(
                          onChanged: (value) {
                            setState(() {
                              itemsListSearch = PlantsName.where((element) =>
                                  element
                                      .toLowerCase()
                                      .contains(value.toLowerCase())).toList();
                              if (_searchTextController!.text.isNotEmpty &&
                                  itemsListSearch!.isEmpty) {
                                print(
                                    'itemsListSearch legnth${itemsListSearch!.length}');
                              }
                            });
                          },
                          controller: _searchTextController,
                          focusNode: _node,
                          decoration: InputDecoration(
                              hintText: 'Find_Your_Slide ',
                              hintStyle: Theme.of(context).textTheme.bodySmall,
                              border: InputBorder.none,
                              prefixIcon: const Icon(
                                Icons.search,
                                color: Colors.grey,
                              ),
                              suffixIcon: IconButton(
                                onPressed: _searchTextController!.text.isEmpty
                                    ? null
                                    : () {
                                        _searchTextController?.clear();
                                        _node.unfocus();
                                      },
                                icon: Icon(
                                  Icons.cancel,
                                  color: _searchTextController!.text.isNotEmpty
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
                            children: [
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.03,
                              ),
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.65,
                                decoration: const BoxDecoration(
                                    image: DecorationImage(
                                  image: AssetImage(
                                    'assets/images/noResult.jpg',
                                  ),
                                  fit: BoxFit.cover,
                                )),
                              )
                            ],
                          )
                        :

                        /// plants Show
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.77,
                            child: GridView.builder(
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 1,
                                  mainAxisSpacing: 15,
                                  childAspectRatio: 0.75.sp,
                                ),
                                itemCount: _searchTextController.text.isEmpty
                                    ? PlantsName.length
                                    : itemsListSearch!.length,
                                itemBuilder: (context, index) =>
                                    _searchTextController.text.isEmpty
                                        ? PlantsCardItem(
                                            plantsModel: PlantsModel(
                                                plant_image: PlantsImage[index],
                                                plant_name: PlantsName[index]),
                                          )
                                        : PlantsCardItem(
                                            plantsModel: PlantsModel(
                                                plant_image: PlantsImage[index],
                                                plant_name:
                                                    itemsListSearch![index]),
                                          )),
                          ),
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
