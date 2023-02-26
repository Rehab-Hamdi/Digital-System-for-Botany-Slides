import 'package:flutter/material.dart';

class FavoriteView extends StatelessWidget {

  static const String routeName = 'favoritesView';

  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
      child: Center(
        child: Text('Favorite Screen', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),),
      ),
      ),
    );
  }
}
