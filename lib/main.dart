import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:posh_1_mall/provider/app_state.dart';
import 'webpages/home_page.dart';
import 'package:provider/provider.dart';
import 'dart:core';

Future main() async {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ApplicationState(),
      builder: (context, _) => const PoshWanMall(),
    ),
  );
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