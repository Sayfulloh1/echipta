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
            Container(
              width: width,
              height: height * .15,
              color: red,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          SizedBox(
                              width: height * .07,
                              height: height * .07,
                              child: Image.asset(
                                  'assets/images/teams/neftchi.png')),
                          Text(
                            'Neftchi',
                            style: TextStyle(
                              color: white,
                              fontSize: height * .02,
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
                              fontSize: height * .04,
                              color: white,
                            ),
                          ),
                          Text(
                            '30-mart',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: height * .02,
                              color: white,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                              width: height * .07,
                              height: height * .07,
                              child: Image.asset(
                                  'assets/images/teams/neftchi.png')),
                          Text(
                            'Neftchi',
                            style: TextStyle(
                              color: white,
                              fontSize: height * .02,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        CupertinoIcons.location_solid,
                        color: grey,
                      ),
                      Text(
                        'Bobur Arena',
                        style: TextStyle(
                          color: white,
                          fontSize: height * .02,
                        ),
                      ),
                    ],
                  ),
                ],
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
                      width: width * .08,
                      height: width * .08,
                      color: primary,
                    ),
                    SizedBox(
                      width: width * .02,
                    ),
                    Text(
                      "Bo'sh joylar",
                      style: TextStyle(fontSize: height * .02),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      width: width * .08,
                      height: width * .08,
                      color: red,
                    ),
                    SizedBox(
                      width: width * .02,
                    ),
                    Text(
                      "Band joylar",
                      style: TextStyle(fontSize: height * .02),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      width: width * .08,
                      height: width * .08,
                      color: Colors.greenAccent,
                    ),
                    SizedBox(
                      width: width * .02,
                    ),
                    Text(
                      "Tanlangan",
                      style: TextStyle(fontSize: height * .02),
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
                style: GoogleFonts.alexandria()
                    .copyWith(color: white, fontSize: height * .02),
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
