import 'package:e_chipta/controller/provider/match_provider.dart';
import 'package:e_chipta/pages/choose_sector_page.dart';
import 'package:e_chipta/pages/order_product.dart';
import 'package:e_chipta/pages/station_locatin.dart';
import 'package:e_chipta/utils/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Material(
      color: txtFieldBack,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: width * .1),
                      width: width,
                      height: height * .3,
                      decoration: BoxDecoration(
                        color: primary,
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            height: height * .06,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: height * .05,
                                height: height * .05,
                                child: Image.asset(
                                    'assets/images/teams/neftchi.png'),
                              ),
                              Stack(
                                children: [
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.notifications_none_sharp,
                                      color: white,
                                      size: height * .05,
                                    ),
                                  ),
                                  Positioned(
                                    top: width * .02,
                                    right: width * .02,
                                    child: CircleAvatar(
                                      radius: height * .014,
                                      backgroundColor: red,
                                      child: Text(
                                        '3',
                                        style: TextStyle(
                                            color: white,
                                            fontSize: height * .015),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: height * .01,
                          ),
                          SizedBox(
                            height: height * .05,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: width * .01),
                                  width: width * .17,
                                  height: height * .1,
                                  child: TextField(
                                    onChanged: (value) {},
                                    style: TextStyle(fontSize: height / 40),
                                    decoration: InputDecoration(
                                        prefixIcon: Icon(
                                          Icons.search,
                                          color: black,
                                          size: height * .05,
                                        ),
                                        contentPadding: EdgeInsets.all(
                                            MediaQuery.of(context).size.height /
                                                60),
                                        filled: true,
                                        fillColor: white,
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                            borderRadius: BorderRadius.circular(
                                                height * .03))),
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: white,
                                    borderRadius:
                                        BorderRadius.circular(height * .2),
                                  ),
                                  width: width * .33,
                                  height: height * .07,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      SizedBox(
                                        width: height * .03,
                                        height: height * .03,
                                        child: Image.asset(
                                            'assets/images/teams/superliga.png'),
                                      ),
                                      Text(
                                        'Superliga',
                                        style: TextStyle(
                                            fontSize: height * .02,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Poppins'),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: white,
                                    borderRadius:
                                        BorderRadius.circular(height * .2),
                                  ),
                                  width: width * .28,
                                  height: height * .07,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: height * .06,
                                        height: height * .06,
                                        child: Image.asset(
                                            'assets/images/teams/cubok.png'),
                                      ),
                                      Text(
                                        'Kubok',
                                        style: TextStyle(
                                            fontSize: height * .02,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Poppins'),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Positioned(
                  bottom: -height * .12,
                  left: width * .1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Joriy o'yin",
                        style: TextStyle(
                            color: white,
                            fontSize: height * .02,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Poppins'),
                      ),
                      SizedBox(height: height * .01),
                      SizedBox(
                        width: width * .8,
                        height: height * .15,
                        child: InkWell(
                          onTap: () {
                            print('tapped');
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const ChooseSectorPage()));
                          },
                          child: Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.only(top: height * .03),
                            decoration: BoxDecoration(
                              color: white,
                              borderRadius:
                                  BorderRadius.circular(height * .033),
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
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        print('tapped');
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const StationLocation(
                                                      latitude: 23,
                                                      longitude: 123,
                                                    )));
                                      },
                                      child: Icon(
                                        Icons.location_on_outlined,
                                        color: grey,
                                        size: height * .02,
                                      ),
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
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: height * .14,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * .1),
              child: Column(
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: height * .03,
                        height: height * .03,
                        child: Image.asset('assets/images/teams/superliga.png'),
                      ),
                      SizedBox(width: width * .02),
                      Text(
                        'Superliga',
                        style: TextStyle(
                            fontSize: height * .02,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Poppins'),
                      ),
                    ],
                  ),
                  Container(
                    width: width,
                    // height: height * .5,
                    child: ListView.builder(
                      itemCount: 3,
                      physics: PageScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            print('tapped');
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const ChooseSectorPage()));
                          },
                          child: Center(
                            child: Container(
                              margin: EdgeInsets.only(bottom: height * .01),
                              width: width * .8,
                              height: height * .09,
                              alignment: Alignment.center,
                              padding: EdgeInsets.only(
                                  top: height * .03,
                                  left: width * .04,
                                  right: width * .04),
                              decoration: BoxDecoration(
                                color: primary,
                                borderRadius:
                                    BorderRadius.circular(height * .033),
                              ),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            'Andijon',
                                            style: TextStyle(
                                              fontFamily: 'Poppins',
                                              color: Colors.white,
                                              fontSize: height * .014,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(
                                            height: width * .009,
                                          ),
                                          SizedBox(
                                              width: height * .04,
                                              height: height * .04,
                                              child: Image.asset(
                                                  'assets/images/teams/neftchi.png')),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Text(
                                            '30-mart',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: height * .016,
                                              fontFamily: 'Poppins',
                                              color: white,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          SizedBox(
                                              width: height * .04,
                                              height: height * .04,
                                              child: Image.asset(
                                                  'assets/images/teams/neftchi.png')),
                                          SizedBox(
                                            height: width * .009,
                                          ),
                                          Text(
                                            'Neftchi',
                                            style: TextStyle(
                                              fontFamily: 'Poppins',
                                              color: Colors.white,
                                              fontSize: height * .014,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Row(
                    children: [
                      SizedBox(
                          width: height * .07,
                          height: height * .07,
                          child: Image.asset('assets/images/teams/cubok.png')),
                      SizedBox(width: width * .02),
                      Text(
                        "O'zbekiston Kubogi",
                        style: TextStyle(
                            fontSize: height * .02,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Poppins'),
                      ),
                    ],
                  ),
                  Container(
                    width: width,
                    // height: height * .5,
                    child: ListView.builder(
                      itemCount: 1,
                      physics: PageScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ChooseSectorPage()));
                          },
                          child: InkWell(
                            onTap: () {
                              print('tapped');
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const StationLocation(
                                            latitude: 23,
                                            longitude: 123,
                                          )));
                            },
                            child: Center(
                              child: Container(
                                margin: EdgeInsets.only(bottom: height * .01),
                                width: width * .8,
                                height: height * .09,
                                alignment: Alignment.center,
                                padding: EdgeInsets.only(
                                    top: height * .03,
                                    left: width * .04,
                                    right: width * .04),
                                decoration: BoxDecoration(
                                  color: primary,
                                  borderRadius:
                                      BorderRadius.circular(height * .033),
                                ),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              'Andijon',
                                              style: TextStyle(
                                                fontFamily: 'Poppins',
                                                color: Colors.white,
                                                fontSize: height * .014,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            SizedBox(
                                              height: width * .009,
                                            ),
                                            SizedBox(
                                                width: height * .04,
                                                height: height * .04,
                                                child: Image.asset(
                                                    'assets/images/teams/neftchi.png')),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Text(
                                              '30-mart',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: height * .016,
                                                fontFamily: 'Poppins',
                                                color: white,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            SizedBox(
                                                width: height * .04,
                                                height: height * .04,
                                                child: Image.asset(
                                                    'assets/images/teams/neftchi.png')),
                                            SizedBox(
                                              height: width * .009,
                                            ),
                                            Text(
                                              'Neftchi',
                                              style: TextStyle(
                                                fontFamily: 'Poppins',
                                                color: Colors.white,
                                                fontSize: height * .014,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: height * .02,
                  ),
                  Row(
                    children: [
                      Text(
                        "Mahsulotlar",
                        style: TextStyle(
                            fontSize: height * .02,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Poppins'),
                      ),
                    ],
                  ),
                  Container(
                    width: width,
                    height: height * .55,
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 2.5 / 3,
                        crossAxisSpacing: width * .01,
                        mainAxisSpacing: width * .01,
                      ),
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>OrderProductPage()));
                          },
                          child: Container(
                              color: Colors.transparent,
                              child: Column(
                                children: [
                                  Container(
                                    width: width * .33,
                                    height: width * .4,
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: greyShade3,
                                          spreadRadius: 1,
                                        ),
                                      ],
                                      borderRadius:
                                          BorderRadius.circular(width * .05),
                                      color: white,
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Image.asset(
                                          'assets/images/teams/hotdog.png',
                                          width: width * .33,
                                          height: width * .3,
                                        ),
                                        Text(
                                          'Hotdog',
                                          style: TextStyle(
                                            fontSize: height * .02,
                                            fontFamily: "Poppins",
                                            fontWeight: FontWeight.bold,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Text(
                                    '10 000 UZS',
                                    style: TextStyle(
                                        fontSize: height * .02, color: red),
                                  )
                                ],
                              )),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
