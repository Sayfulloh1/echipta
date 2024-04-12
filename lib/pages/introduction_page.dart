import 'package:e_chipta/pages/auth/register.dart';
import 'package:e_chipta/presentation/styles_manager.dart';
import 'package:e_chipta/utils/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class IntroductionPage extends StatefulWidget {
  const IntroductionPage({super.key});

  @override
  State<IntroductionPage> createState() => _IntroductionPageState();
}

class _IntroductionPageState extends State<IntroductionPage> {
  late PageController controller;
  int currentPageIndex = 0;

  @override
  void initState() {
    controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: PageView(
        controller: controller,
        physics: ClampingScrollPhysics(),
        onPageChanged: (index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        children: [
          Stack(
            children: [
              Container(
                width: width,
                height: height * .7,
                child: Image.asset(
                  'assets/images/splash1.png',
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: width * .1,
                    vertical: height * .05,
                  ),
                  width: width,
                  height: height * .4,
                  decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.circular(width * .2),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Qulaylashtirilgan elektron chipta tizimi',
                        style: getRegularTextStyle(height * .03),
                      ),
                      Text(
                        'Muxlislarga mos va qulay holatda',
                        style: getRegularTextStyle(height * .02, color: grey),
                      ),
                      Row(
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size(width * .5, height * .05),
                              backgroundColor: primary,
                            ),
                            onPressed: () {
                              controller.animateToPage(1,
                                  duration: Duration(milliseconds: 300),
                                  curve: Curves.bounceOut);
                            },
                            child: Text(
                              'Keyingisi',
                              style: getRegularTextStyle(height * .02,
                                  color: Colors.white),
                            ),
                          ),
                          SizedBox(width: width * .1),
                          Container(
                            width: width * .15,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: currentPageIndex == 0
                                      ? width * .06
                                      : width * .03,
                                  height: width * .03,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.circular(width * .02),
                                    color: primary,
                                  ),
                                ),
                                Container(
                                  width: width * .03,
                                  height: width * .03,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: primary,
                                  ),
                                ),
                                Container(
                                  width: width * .03,
                                  height: width * .03,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: primary,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Stack(
            children: [
              Container(
                width: width,
                height: height * .7,
                child: Image.asset(
                  'assets/images/splash2.png',
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: width * .1,
                    vertical: height * .05,
                  ),
                  width: width,
                  height: height * .4,
                  decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.circular(width * .2),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'O`zbek futbolida chipta savdosini yangi bosqichi',
                        style: getRegularTextStyle(height * .03),
                      ),
                      Text(
                        'Zamonaviy va innovatsion chipta tizimi',
                        style: getRegularTextStyle(height * .02, color: grey),
                      ),
                      Row(
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size(width * .5, height * .05),
                              backgroundColor: primary,
                            ),
                            onPressed: () {
                              controller.animateToPage(2,
                                  duration: Duration(milliseconds: 300),
                                  curve: Curves.bounceOut);
                            },
                            child: Text(
                              'Keyingisi',
                              style: getRegularTextStyle(height * .02,
                                  color: white),
                            ),
                          ),
                          SizedBox(width: width * .1),
                          Container(
                            width: width * .15,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: width * .03,
                                  height: width * .03,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.circular(width * .02),
                                    color: primary,
                                  ),
                                ),
                                Container(
                                  width: currentPageIndex == 1
                                      ? width * .06
                                      : width * .03,
                                  height: width * .03,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.circular(width * .02),
                                    color: primary,
                                  ),
                                ),
                                Container(
                                  width: width * .03,
                                  height: width * .03,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: primary,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Stack(
            children: [
              Container(
                width: width,
                height: height * .7,
                child: Image.asset(
                  'assets/images/splash3.png',
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: width * .1,
                    vertical: height * .05,
                  ),
                  width: width,
                  height: height * .4,
                  decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.circular(width * .2),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Endi hammasi siz uchun ham jamoa uchun ham shaffof",
                        style: getRegularTextStyle(height * .03),
                      ),
                      Text(
                        'Chiptalar o`z narxida va o`z o`rnida savdoda',
                        style: getRegularTextStyle(height * .02, color: grey),
                      ),
                      Row(
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size(width * .5, height * .05),
                              backgroundColor: primary,
                            ),
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => RegisterPage()));
                            },
                            child: Text(
                              'Boshlash',
                              style: getRegularTextStyle(height * .02,
                                  color: white),
                            ),
                          ),
                          SizedBox(width: width * .1),
                          Container(
                            width: width * .15,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: width * .03,
                                  height: width * .03,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.circular(width * .02),
                                    color: primary,
                                  ),
                                ),
                                Container(
                                  width: width * .03,
                                  height: width * .03,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: primary,
                                  ),
                                ),
                                Container(
                                  width: currentPageIndex == 2
                                      ? width * .06
                                      : width * .03,
                                  height: width * .03,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.circular(width * .02),
                                    color: primary,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
