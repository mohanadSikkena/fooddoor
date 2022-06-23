import 'package:scoped_model/scoped_model.dart';

import 'mealModel.dart';

mixin MealController on Model {
  List<MealModel> _allMeals = [];

  List<MealModel> get allMeals => _allMeals;

  void getMeals(List<Map<String, dynamic>> meals) {
    List<MealModel> _listOfMeals = [];
    meals.forEach((element) {
      MealModel newMeal =
          MealModel(element['name'], element['img'], element['price']);
      _listOfMeals.add(newMeal);
    });
    _allMeals = _listOfMeals;
    notifyListeners();
  }
}
