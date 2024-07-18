import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sushi_app/components/button.dart';
import 'package:sushi_app/models/shop.dart';
import 'package:sushi_app/theme/colors.dart';
import 'package:sushi_app/models/food.dart';

class FoodDetails extends StatefulWidget {
  final Food food;
  const FoodDetails({
    super.key,
    required this.food,
  });

  @override
  State<FoodDetails> createState() => _FoodDetailsState();
}

class _FoodDetailsState extends State<FoodDetails> {
  // miktar
  int quantityCount = 1;
  bool showDiscountMessage = false;

  // miktar azaltma
  void decrementQuantity() {
    setState(() {
      if (quantityCount > 1) {
        quantityCount--;
        showDiscountMessage = quantityCount > 3;
      }
    });
  }

  // miktar artırma
  void incrementQuantity() {
    setState(() {
      quantityCount++;
      showDiscountMessage = quantityCount > 3;
    });
  }

//sepete git
  void addToCart() {
    if (quantityCount > 0) {
      final shop = context.read<Shop>();

      shop.addToCart(widget.food, quantityCount);

      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => AlertDialog(
                backgroundColor: primaryColor,
                content: const Text(
                  "Başarıyla Eklendi✅",
                  textAlign: TextAlign.center,
                ),
                actions: [
                  //onay
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);

                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.done),
                  )
                ],
              ));
    }
  }

  @override
  Widget build(BuildContext context) {
    double price = double.tryParse(widget.food.price) ?? 0.0;
    double totalPrice = price * quantityCount;
    if (quantityCount > 3) {
      totalPrice *= 0.68; // %32 indirim
    }

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 117, 115, 115),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.grey[800],
      ),
      body: Column(
        children: [
          // liste şeklinde yemek detayı
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: ListView(
                children: [
                  // resim
                  Image.asset(
                    widget.food.imagePath,
                    height: 200,
                  ),
                  const SizedBox(height: 25),
                  Row(
                    children: [
                      // yıldız ikon
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        widget.food.rating,
                        style: TextStyle(
                          color: const Color.fromARGB(255, 0, 0, 0),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  // yemek ismi
                  Text(
                    widget.food.name,
                    style: GoogleFonts.dmSerifDisplay(fontSize: 28),
                  ),
                  const SizedBox(height: 25),
                  // yemek açıklama başlığı
                  Text(
                    "Açıklama",
                    style: TextStyle(
                      color: Color.fromARGB(255, 69, 10, 10),
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 10),
                  // yemek açıklaması
                  Text(
                    "Sushi, Japon mutfağının popüler bir yemeğidir ve iki ana şekilde sunulur: nigiri ve maki. Nigiri sushi, elma sirkesiyle tatlandırılmış pirinç üzerine ince bir dilim çiğ somon yerleştirilmesiyle yapılır. Maki sushi ise somon ve diğer malzemelerin deniz yosunu yaprağına sarılıp dilimlenmesiyle oluşur. Wasabi, soya sosu ve turşu zencefil ile servis edilir.",
                    style: TextStyle(
                      color: const Color.fromARGB(255, 0, 0, 0),
                      fontSize: 14,
                      height: 2,
                    ),
                  ),
                ],
              ),
            ),
          ),
          // ücret + sepete ekle + miktar
          Container(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 118, 113, 113),
            ),
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                if (showDiscountMessage)
                  Text(
                    "İndirim uygulandı!",
                    style: TextStyle(
                      color: Colors.greenAccent,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // toplam ücret
                    Text(
                      "\$${totalPrice.toStringAsFixed(2)}",
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    // miktar
                    Row(
                      children: [
                        // azaltma butonu
                        IconButton(
                          icon: const Icon(Icons.remove, color: Colors.white),
                          onPressed: decrementQuantity,
                        ),
                        // miktar göstergesi
                        Text(
                          '$quantityCount',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                        // artırma butonu
                        IconButton(
                          icon: Icon(Icons.add, color: Colors.white),
                          onPressed: incrementQuantity,
                        ),
                      ],
                    ),
                  ],
                ),
                
                MyButton(text: "Sepete Git", onTap: addToCart,),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
