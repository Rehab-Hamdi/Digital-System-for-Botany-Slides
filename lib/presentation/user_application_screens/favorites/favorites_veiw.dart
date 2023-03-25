import 'package:flutter/material.dart';
import 'package:our_test_project/core/views/plants_card_item.dart';
import 'package:our_test_project/presentation/planet_info/provider/favorite_provider.dart';
import 'package:provider/provider.dart';

class FavoriteView extends StatelessWidget {
  static const String routeName = 'favoritesView';

  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FavoriteProvider>(context);
    final planets = provider.planets;
    return Scaffold(
      body: SafeArea(
        child: planets.isEmpty
            ? Center(
                child: Text("No Favorites yet..!",
                    style: Theme.of(context).textTheme.headline1))
            : GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 1,
                  mainAxisSpacing: 5,
                  childAspectRatio: 1,
                ),
                itemCount: planets.length,
                itemBuilder: (context, index) =>
                    PlantsCardItem(plantsModel: planets[index]),
              ),
      ),
    );
  }
}
