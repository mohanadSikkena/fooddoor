import 'package:fooddoor/models/resturant/resturantController.dart';
import 'package:scoped_model/scoped_model.dart';

import 'auth/auth.dart';
import 'meal/mealController.dart';

class MainModel extends Model with ResturantController, MealController, Auth {}
