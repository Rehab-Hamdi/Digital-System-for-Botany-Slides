import 'package:flutter/material.dart';
import 'package:our_test_project/core/views/plants_card_item.dart';
import 'package:our_test_project/presentation/user_application_screens/planet_info/provider/favorite_provider.dart';
import 'package:provider/provider.dart';

class FavoriteView extends StatelessWidget {
  static const String routeName = 'favoritesView';

  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FavoriteProvider>(context);
    final planets = provider.planets;
    return SafeArea(
      child: Scaffold(
        body: planets.isEmpty
            ? Center(
                child: Text("No Favorites yet..!",
                    style: Theme.of(context).textTheme.headline1))
            : Padding(
              padding: const EdgeInsets.all(10.0),
              child: GridView.builder(
                  gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 13,
                    mainAxisSpacing: 17,
                    childAspectRatio: 0.85,
                  ),
                  itemCount: planets.length,
                  itemBuilder: (context, index) {
                      return PlantsCardItem(plantsModel: planets[index]);}
                ),
            ),
      ),
    );
  }
}
