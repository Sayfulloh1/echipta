import 'package:e_chipta/pages/nav_bar/help_page.dart';
import 'package:e_chipta/pages/nav_bar/profile_page.dart';
import 'package:e_chipta/pages/nav_bar/rating_page.dart';
import 'package:e_chipta/pages/nav_bar/ticket_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/color.dart';
import 'nav_bar/home_page.dart';

class MyPages extends StatefulWidget {
  final int? teamId; // Allow teamId to be null

  const MyPages({this.teamId});


  @override
  State<MyPages> createState() => _MyPagesState();
}

class _MyPagesState extends State<MyPages> {
  late PageController controller;
  var selected = 0;




  @override
  void initState() {
    super.initState();
    controller = PageController();
    controller.addListener(() {
      setState(() {
        selected = controller.page!.round();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final teamId = widget.teamId;
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    print('teamid: $teamId');
    return Scaffold(
      backgroundColor: Color(0xffF6F6F6),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Transform.scale(
        scale: 1.5,
        child: FloatingActionButton(
          shape: const CircleBorder(),
          backgroundColor: primary,
          onPressed: () {
            print('tapped');
          },
          child: SizedBox(
            width: screenWidth * .05,
            child: Image.asset('assets/images/dockedimage.png'),
          ),
        ),
      ),
      body: PageView(
        controller: controller,
        children:  [
          HomePage(teamId: widget.teamId,),
          RatingPage(),
          // TicketPage(),
          HelpPage(),
          ProfilePage(),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        padding: EdgeInsets.zero,
        height: screenHeight * .1,
        shape: const CircularNotchedRectangle(),
        clipBehavior: Clip.antiAlias,
        notchMargin: screenWidth * .07,
        child: Material(
          elevation: 0,
          child: Container(
            height: screenHeight * .1,
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: screenWidth * .4,
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * .03),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(width: 5,),
                      Column(
                        children: [
                          IconButton(
                            onPressed: () {
                              controller.animateToPage(0,
                                  duration: Duration(milliseconds: 300),
                                  curve: Curves.bounceOut);
                            },
                            icon: Icon(
                              Icons.home_filled,
                              size: screenHeight * .03,
                              color: selected == 0 ? primary : grey,
                            ),
                          ),
                          Text(
                            'Asosiy',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w800,
                              fontSize: screenHeight * .011,
                              color: selected == 0 ? primary : grey,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          IconButton(
                            onPressed: () {
                              controller.animateToPage(1,
                                  duration: Duration(milliseconds: 300),
                                  curve: Curves.bounceOut);
                            },
                            icon: Icon(
                              Icons.bar_chart,
                              color: selected == 1 ? primary : grey,
                              size: screenHeight * .03,
                            ),
                          ),
                          Text(
                            'Reyting',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w800,
                              fontSize: screenHeight * .011,
                              color: selected == 1 ? primary : grey,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 10,),
                    ],
                  ),
                ),
                Container(
                  width: screenWidth * .4,
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * .03),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(width: 10,),
                      Column(
                        children: [
                          IconButton(
                            onPressed: () {
                              controller.animateToPage(2,
                                  duration: Duration(milliseconds: 300),
                                  curve: Curves.bounceOut);
                            },
                            icon: Icon(
                              color: selected == 2 ? primary : grey,
                              CupertinoIcons.chat_bubble_text_fill,
                              size: screenHeight * .03,
                            ),
                          ),
                          Text(
                            'Yordam',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w800,
                              fontSize: screenHeight * .011,
                              color: selected == 2 ? primary : grey,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          IconButton(
                            onPressed: () {
                              controller.animateToPage(3,
                                  duration: Duration(milliseconds: 300),
                                  curve: Curves.bounceOut);
                            },
                            icon: Icon(
                              color: selected == 3 ? primary : grey,
                              Icons.person,
                              size: screenHeight * .03,
                            ),
                          ),
                          Text(
                            'Profil',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w800,
                              fontSize: screenHeight * .011,
                              color: selected == 3 ? primary : grey,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 5,),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
