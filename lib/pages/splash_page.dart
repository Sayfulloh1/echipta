import 'dart:async';

import 'package:e_chipta/pages/introduction_page.dart';
import 'package:e_chipta/presentation/styles_manager.dart';
import 'package:e_chipta/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Timer(
      Duration(seconds: 2),
      () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => IntroductionPage(),
          ),
        );
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Material(
      color: primary,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: width * .3,
                // height: width * .3,
                child: Image.asset(
                  'assets/images/appicon.png',
                ),
              ),
              SizedBox(height: height * 0.1),
              Text(
                'e-chipta',
                style: getMainTextStyle(height*.04,color: white),
              ),
            ],
          ),
        ),
    );
  }
}
