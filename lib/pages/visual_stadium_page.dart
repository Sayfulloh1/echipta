import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:panorama/panorama.dart';

import '../utils/color.dart';

class VisualStadiumPage extends StatefulWidget {
  const VisualStadiumPage({super.key});

  @override
  State<VisualStadiumPage> createState() => _VisualStadiumPageState();
}

class _VisualStadiumPageState extends State<VisualStadiumPage> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primary,
        centerTitle: true,
        title: Text(
          'Vizual ko\'rinish',
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
      body: Stack(
        children: [
          Positioned(
            top: height * .1,
            left: width * .1,
            child: Image.asset('assets/images/panorama.png'),
          ),
          Center(
            child: Image.asset('assets/images/stadium.png'),
          ),
          Positioned(
            top: height * .02,
            left: width * .1,
            child: Image.asset('assets/images/panorama.png'),
          ),
          Positioned(
            bottom: height * .01,
            left: width * .1,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size(width * .8, height * .07),
                backgroundColor: primary,
              ),
              onPressed: () {
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) => VisualStadiumPage()));
              },
              child: Text(
                "Sotib olish",
                style: GoogleFonts.alexandria()
                    .copyWith(color: white, fontSize: height * .02),
              ),
            ),
          ),
          Positioned(
            bottom: height*.2,
            left: width*.1,
            child: Column(
              children: [
                Container(
                  width: width * .8,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(
                            'Sektor',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: height * .02,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '1A',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: height * .02,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            'Qator',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: height * .02,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '10',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: height * .02,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            'Joy',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: height * .02,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '9',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: height * .02,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  width: width * .8,
                  alignment: Alignment.center,
                  child: Text(
                    "Joyidan o'yin ko'rinishi",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: height * .03,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: height * .13,
            left: width * .15,
            child: Image.asset('assets/images/360.png'),
          ),
        ],
      ),
    );
  }
}
