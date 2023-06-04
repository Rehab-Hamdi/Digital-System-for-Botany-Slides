import 'package:flutter/cupertino.dart';
import 'package:Botany/models/plants_models.dart';

class FavoriteProvider extends ChangeNotifier {
  List<PlantsModel> planets = [];

  void toggleFavorite(PlantsModel plantsModel) {
    final isExist = planets.contains(plantsModel);
    if (isExist) {
      planets.remove(plantsModel);
    } else {
      planets.add(plantsModel);
    }
    notifyListeners();
  }

  bool existInFavorite(PlantsModel plantsModel) {
    final isExist = planets.contains(plantsModel);
    return isExist;
  }

  void clearFavorite() {
    planets = [];
    notifyListeners();
  }
}