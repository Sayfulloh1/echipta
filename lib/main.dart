import 'package:e_chipta/injector_container.dart';
import 'package:e_chipta/pages/choose_club_page.dart';
import 'package:e_chipta/pages/splash_page.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  await init();
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
      home: const ChooseClubTeam(),
    );
  }
}
