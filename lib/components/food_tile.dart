import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/food.dart';

class FoodTile extends StatelessWidget {
  final Food food;
  final void Function()? onTap;

  const FoodTile({super.key, required this.food,
  required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 197, 199, 182), // Arka plan rengi ve köşe yuvarlaklığı
          borderRadius: BorderRadius.circular(20),
        ),
        margin: const EdgeInsets.only(left: 25.0), // Sol tarafta boşluk
        padding: const EdgeInsets.all(25), // İçerik için boşluk
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center, 
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,// Başlangıç hizalaması
          children: [
            // Resim
           
            Image.asset(
              food.imagePath,
              height: 140, // Resim yüksekliği
            ),
            // Yazı
            Text(
             
              food.name,
              style: GoogleFonts.dmSerifDisplay(
              fontSize: 20, // Yazı tipi boyutu
           
              ),
            ),
            // Ücret + rating
            SizedBox(
              width: 160, // Sabit genişlik
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center, // Ortada hizalama
                children: [
                  // Ücret
                  Text(
                    '\$' + food.price, 
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 44, 43, 43),
                    ),// Ücret bilgisi
                  ),
                  SizedBox(width: 5), // Ücret ve rating arasına boşluk ekleyin
                  Row(
                    children: [
                      // Rating
                      Icon(
                        Icons.star,
                        color: Color.fromARGB(255, 255, 230, 0), // Yıldız rengi
                      ),
                      Text(
                        food.rating,
                        style: TextStyle(
                          color: Color.fromARGB(255, 66, 63, 63), // Yazı rengi
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
