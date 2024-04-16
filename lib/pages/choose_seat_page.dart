import 'package:e_chipta/pages/visual_stadium_page.dart';
import 'package:e_chipta/utils/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class ChooseSeatPage extends StatefulWidget {
  const ChooseSeatPage({super.key, required sectorId});

  @override
  State<ChooseSeatPage> createState() => _ChooseSeatPageState();
}

class _ChooseSeatPageState extends State<ChooseSeatPage> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xFFFFFFF7),
      appBar: AppBar(
        backgroundColor: primary,
        centerTitle: true,
        title: Text(
          'Joy tanlash',
          style: TextStyle(color: white),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.chevron_left_rounded,
            size: height * .04,
            color: white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: width,
              height: height * .15,
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.only(top: height * .03),
                decoration: BoxDecoration(
                  color: white,

                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment:
                      MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            SizedBox(
                                width: height * .05,
                                height: height * .05,
                                child: Image.asset(
                                    'assets/images/teams/neftchi.png')),
                            SizedBox(
                              height: height * .009,
                            ),
                            Text(
                              'Neftchi',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                color: Colors.grey,
                                fontSize: height * .017,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              '17:00',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: height * .024,
                                  fontFamily: 'Poppins'),
                            ),
                            Text(
                              '30-mart',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: height * .013,
                                fontFamily: 'Poppins',
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            SizedBox(
                                width: height * .05,
                                height: height * .05,
                                child: Image.asset(
                                    'assets/images/teams/neftchi.png')),
                            SizedBox(
                              height: height * .009,
                            ),
                            Text(
                              'Neftchi',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                color: Colors.grey,
                                fontSize: height * .017,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Text(
                      'Bobur arena',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        color: Colors.grey,
                        fontSize: height * .017,
                        // fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: width,
              height: height * .3,
              margin: EdgeInsets.symmetric(
                  horizontal: width * .01, vertical: width * .01),
              color: grey,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    Container(
                      width: width * .04,
                      height: width * .04,
                      color: primary,
                    ),
                    SizedBox(
                      width: width * .02,
                    ),
                    Text(
                      "Bo'sh joylar",
                      style: TextStyle(fontSize: height * .02,fontWeight: FontWeight.bold,fontFamily: 'Poppins'),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      width: width * .04,
                      height: width * .04,
                      color: red,
                    ),
                    SizedBox(
                      width: width * .02,
                    ),
                    Text(
                      "Band joylar",
                      style: TextStyle(fontSize: height * .02,fontWeight: FontWeight.bold,fontFamily: 'Poppins'),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      width: width * .04,
                      height: width * .04,
                      color: Colors.greenAccent,
                    ),
                    SizedBox(
                      width: width * .02,
                    ),
                    Text(
                      "Tanlangan",
                      style: TextStyle(fontSize: height * .02,fontWeight: FontWeight.bold,fontFamily: 'Poppins'),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: height * .02,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * .02),
              child: Container(
                width: width,
                height: height * .3,
                child: Image.asset(
                  'assets/images/ticket.png',
                  fit: BoxFit.contain,
                ),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size(width*.8, height * .07),
                backgroundColor: primary,
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => VisualStadiumPage()));
              },
              child: Text(
                "Joyni ko'rish",
                style: TextStyle(fontSize: height * .02,fontWeight: FontWeight.bold,fontFamily: 'Poppins',color: Colors.white),
              ),
            ),
            SizedBox(
              height: height * .02,
            ),
          ],
        ),
      ),
    );
  }
}
