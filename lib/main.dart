import 'package:e_chipta/pages/auth/create_account.dart';
import 'package:e_chipta/pages/choose_club_page.dart';
import 'package:e_chipta/pages/choose_seat_page.dart';
import 'package:e_chipta/pages/order_product.dart';
import 'package:e_chipta/pages/page_navigation.dart';
import 'package:e_chipta/pages/splash_page.dart';
import 'package:e_chipta/pages/station_locatin.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashPage(),
    );
  }
}
