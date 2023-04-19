import 'package:flutter/material.dart';
import 'package:our_test_project/core/views/plants_card_item.dart';
import 'package:our_test_project/core/styles/colors.dart';
import 'package:our_test_project/models/plants_models.dart';
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
  List<PlantsModel>? itemsListSearch;

  List allPlants = [
    PlantsModel(
        plant_image: 'assets/images/cat1.png', plant_name: 'Batrachospermum'),
    PlantsModel(
        plant_image: 'assets/images/cat2.png', plant_name: 'Chaetophora'),
    PlantsModel(
        plant_image: 'assets/images/cat3.png', plant_name: 'Cladophora'),
    PlantsModel(plant_image: 'assets/images/cat4.png', plant_name: 'Diatoms'),
    PlantsModel(plant_image: 'assets/images/cat6.png', plant_name: 'Dictyota'),
    PlantsModel(
        plant_image: 'assets/images/cat7.png', plant_name: 'Enteromorpha'),
    PlantsModel(plant_image: 'assets/images/cat8.png', plant_name: 'Euglena'),
    PlantsModel(plant_image: 'assets/images/cat9.png', plant_name: 'Fucus'),
    PlantsModel(plant_image: 'assets/images/cat10.png', plant_name: 'Nitella'),
    PlantsModel(plant_image: 'assets/images/cat11.png', plant_name: 'Nostoc'),
    PlantsModel(
        plant_image: 'assets/images/cat12.png', plant_name: 'Oedogonium'),
    PlantsModel(
        plant_image: 'assets/images/cat13.png', plant_name: 'Pandorina'),
    PlantsModel(
        plant_image: 'assets/images/cat14.png', plant_name: 'Polysiphonia'),
    PlantsModel(
        plant_image: 'assets/images/cat15.png', plant_name: 'Stigeoclonium'),
    PlantsModel(plant_image: 'assets/images/cat16.png', plant_name: 'Olothrix'),
    PlantsModel(plant_image: 'assets/images/cat17.png', plant_name: 'Cyperus'),
    PlantsModel(plant_image: 'assets/images/cat18.png', plant_name: 'Volvox'),
    PlantsModel(plant_image: 'assets/images/cat19.png', plant_name: 'Zygnena'),
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
    return SafeArea(
      child: Scaffold(
        body: ListView(
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
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
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
                            itemsListSearch = allPlants
                                .where((element) => element.plant_name
                                    .toLowerCase()
                                    .contains(value.toLowerCase()))
                                .cast<PlantsModel>()
                                .toList();
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
                              height: MediaQuery.of(context).size.height * 0.03,
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height * 0.65,
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
                      Column(
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.01,
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.75,
                              child: GridView.builder(
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 15,
                                  mainAxisSpacing: 17,
                                  childAspectRatio: 0.65.sp,
                                ),
                                itemCount: _searchTextController.text.isEmpty
                                    ? allPlants.length
                                    : itemsListSearch!.length,
                                itemBuilder: (context, index) =>
                                    _searchTextController.text.isEmpty
                                        ? PlantsCardItem(
                                            plantsModel: allPlants[index],
                                          )
                                        : PlantsCardItem(
                                            plantsModel:
                                                itemsListSearch![index]),
                              ),
                            )
                          ],
                        ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
