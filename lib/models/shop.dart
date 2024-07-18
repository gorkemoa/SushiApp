import 'package:flutter/foundation.dart';
import 'package:sushi_app/models/food.dart';

class Shop with ChangeNotifier {
  // yemek menüsü
  List<Food> _foodMenu = [
    Food(
        name: "Salmon Sushi",
        price: "21.00",
        imagePath: "lib/imagesfl/sushi (2).png",
        rating: "4.8"),
    Food(
        name: "Japan Sushi",
        price: "21.00",
        imagePath: "lib/imagesfl/sushi (1).png",
        rating: "4.8"),
    Food(
        name: "Japan Sushi",
        price: "21.00",
        imagePath: "lib/imagesfl/sushi.png",
        rating: "4.8"),
  ];

  // kart kostüm
  List<Food> _cart = [];

  // metod çağırma
  List<Food> get foodMenu => _foodMenu;
  List<Food> get cart => _cart;

  // kart ekle
  void addToCart(Food foodItem, int quantity) {
    for (int i = 0; i < quantity; i++) {
      _cart.add(foodItem);
    }
    notifyListeners(); // Değişiklikleri dinleyicilere bildir
  }

  // kart kaldırma
  void removeFromCart(Food food) {
    _cart.remove(food);
    notifyListeners(); // Değişiklikleri dinleyicilere bildir
  }
}
