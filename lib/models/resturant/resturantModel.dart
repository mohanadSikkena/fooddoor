
import '../meal/mealModel.dart';

class ResturantModel {
  String id;
  String name;
  String type;
  String resturantType;
  String distance;
  String img;
  int numberOfRates;
  String rate;
  String time;
  String logoImg;
  List<MealModel> meals = [];
  bool favourite;

  ResturantModel(
      this.id,
      this.name,
      this.type,
      this.resturantType,
      this.distance,
      this.img,
      this.numberOfRates,
      this.rate,
      this.time,
      this.logoImg,
      this.favourite);
}
