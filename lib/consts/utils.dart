import 'package:food_delivery_app/consts/food_data.dart';

class Utils {
  static List<Food> getMockedFoods() {
    return foodList.where((food) => food.category == 'Foods').toList();
  }

  static List<Food> getMockedDrinks() {
    return foodList.where((food) => food.category == 'Drinks').toList();
  }

  static List<Food> getMockedSnacks() {
    return foodList.where((food) => food.category == 'Snacks').toList();
  }

  static List<Food> getMockedSauces() {
    return foodList.where((food) => food.category == 'Sauces').toList();
  }
}
