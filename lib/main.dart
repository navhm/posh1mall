import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'webpages/home_page.dart';

void main() {
  runApp(const PoshWanMall());
}


class PoshWanMall extends StatelessWidget {
  const PoshWanMall({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(

        textTheme: GoogleFonts.poppinsTextTheme(
            Theme.of(context).textTheme),
      ),

      debugShowCheckedModeBanner: false,
      title: 'Posh Wan Mall',
      home: const HomePage(),
    );
  }
}