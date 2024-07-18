import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sushi_app/components/button.dart';
import 'package:sushi_app/pages/menu_page.dart';
import 'package:sushi_app/theme/colors.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(
              height: 30,
            ),
            // market ismi
            Text(
              "SusHii",
              style: GoogleFonts.dmSerifDisplay(
                  fontSize: 30, color: Color.fromARGB(255, 87, 7, 7)),
            ),
            const SizedBox(height: 100),
            // ikon
            Padding(
              padding: const EdgeInsets.all(100.0),
              child: Image.asset('lib/imagesfl/futomaki.png'),
            ),
            const SizedBox(height: 5),
            // başlık
            Text(
              "Güzel mi Güzel Japon Yemekleri😋",
              style: GoogleFonts.dmSerifDisplay(
                  fontSize: 44, color: Color.fromARGB(211, 105, 24, 24)),
            ),
            const SizedBox(height: 10),

            // açıklama
           const Text(
              "En güzel Japon yemekleri burada.Daha fazla bilgi için ziyaret ediniz!",
              style: TextStyle(
                color: Color.fromARGB(255, 41, 0, 0),
                height: 2,
              ),
            ),
            const SizedBox(height: 25),
            //giriş buton
         MyButton(text: "Giriş",
        onTap:() {
          Navigator.pushNamed(context, '/menupage');
        }, ),
         
          ],
        ),
      ),
    );
  }
}