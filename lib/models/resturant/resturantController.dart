import 'dart:convert';

import 'package:fooddoor/models/resturant/resturantModel.dart';
import 'package:http/http.dart' as http;
import 'package:scoped_model/scoped_model.dart';

import '../meal/mealModel.dart';
import '../shared.dart';


mixin ResturantController on Model {
  List<ResturantModel> _allResturants = [];
  List<ResturantModel> get allResturants => _allResturants;
  List<ResturantModel> _allFavouriteResturant = [];
  List<ResturantModel> get allFavouriteResturant => _allFavouriteResturant;
  ResturantModel? selectedResturant;
  ////////////////////////////////////////////////////////////////////////////////
  Future<void> getResturants() async {
    List<ResturantModel> _getAllResturant = [];
    http.Response _response = await http.get(Uri.parse(
        'https://second-food-door-default-rtdb.firebaseio.com/resturants.json'));

    Map<String, dynamic> _data = json.decode(_response.body);

    _data.forEach((key, value) {
      ResturantModel _newResturant = ResturantModel(
          key,
          value['resturantName'],
          value['type'],
          value['resturantType'],
          value['distance'],
          value['img'],
          value['numberOfRates'],
          value['rate'],
          value['time'],
          value['logoImg'],
          value['favourite']);

      value['meals'].forEach((_value) {
        MealModel newMeal =
            MealModel(_value['name'], _value['img'], _value["price"]);
        _newResturant.meals.add(newMeal);
      });

      _getAllResturant.add(_newResturant);
    });
    _allResturants = _getAllResturant;
    // await getFavouriteResturants();

    notifyListeners();
  }

  ///////////////////////////////////////////////////////////////////////////////

  selectResturant(String resturantId) {
    for (ResturantModel resturant in _allResturants) {
      if (resturant.id == resturantId) {
        selectedResturant = resturant;
        break;
      }
    }
    notifyListeners();
  }

/////////////////////////////////////////////////////////////////////////////////
  addToFavourite(ResturantModel resturant) async {
    edtiFavorite(resturant);
    _allFavouriteResturant.add(resturant);
    notifyListeners();

    Map<String, dynamic> _resturantData = {
      'resturantName': resturant.name,
      'type': resturant.type,
      'resturantType': resturant.resturantType,
      'distance': resturant.distance,
      'img': resturant.img,
      'numberOfRates': resturant.numberOfRates,
      'rate': resturant.rate,
      "time": resturant.time,
      "logoImg": resturant.logoImg,
      "favourite": resturant.favourite
    };

    http.Response _response = await http.put(
        Uri.parse(
            '${Shared.sharedDomain}/favouriteResturant/${resturant.id}.json'),
        body: json.encode(_resturantData));
    Map<String, dynamic> _resData = json.decode(_response.body);

    notifyListeners();
  }

////////////////////////////////////////////////////////////////////////////////////////
  removeFromFavourite(ResturantModel resturantToDelete) async {
    edtiFavorite(resturantToDelete);
    _allFavouriteResturant.removeWhere((ResturantModel resturantModel) {
      return resturantToDelete.id == resturantModel.id;
    });
    notifyListeners();
    http.Response _response = await http.delete(Uri.parse(
        '${Shared.sharedDomain}/favouriteResturant/${resturantToDelete.id}.json'));

    notifyListeners();
  }

  ///////////////////////////////////////////////////////////////////////////////////////

  edtiFavorite(ResturantModel resturant) async {
    resturant.favourite = !resturant.favourite;

    http.Response _response = await http.patch(
        Uri.parse(
            'https://second-food-door-default-rtdb.firebaseio.com/resturants/${resturant.id}.json'),
        body: json.encode({'favourite': resturant.favourite}));
    notifyListeners();
  }

  //////////////////////////////////////////////////////////////////////////////////////

  Future<void> getFavouriteResturants() async {
    try {
      List<ResturantModel> _getAllResturant = [];
      http.Response _response = await http.get(Uri.parse(
          'https://second-food-door-default-rtdb.firebaseio.com/favouriteResturant.json'));

      Map<String, dynamic> _data = json.decode(_response.body);

      _data.forEach((key, value) {
        for (ResturantModel resturant in _allResturants) {
          if (resturant.id == key) {
            _getAllResturant.add(resturant);
          }
        }
      });
      _allFavouriteResturant = _getAllResturant;

      notifyListeners();
    } catch (e) {}
  }
}
