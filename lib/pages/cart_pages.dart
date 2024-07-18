import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sushi_app/models/food.dart';
import 'package:sushi_app/models/shop.dart';
import 'package:sushi_app/theme/colors.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key});

  void removeFromCart(BuildContext context, Food food) {
    final shop = Provider.of<Shop>(context, listen: false);
    shop.removeFromCart(food);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Shop>(
      builder: (context, value, child) => Scaffold(
        backgroundColor: Color.fromARGB(255, 161, 156, 156),
        appBar: AppBar(
          title: const Text("Sepetim"),
          elevation: 0,
          backgroundColor: primaryColor,
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: value.cart.length,
                itemBuilder: (context, index) {
                  final Food food = value.cart[index];
                  final String foodName = food.name;
                  final String foodPrice = food.price;

                  return Container(
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 201, 172, 172),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
                    child: ListTile(
                      title: Text(
                        foodName,
                        style: const TextStyle(
                          color: Color.fromARGB(255, 23, 10, 10),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(foodPrice),
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () => removeFromCart(context, food),
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(65),
              child: ElevatedButton(
                onPressed: () {
                  // Ödeme işlemleri için gerekli yönlendirme veya işlemler eklenebilir
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  minimumSize: Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(
                  "Ödeme Yap",
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
