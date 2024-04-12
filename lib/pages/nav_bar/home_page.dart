

import 'package:e_chipta/controller/provider/match_provider.dart';
import 'package:e_chipta/pages/choose_sector_page.dart';
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
                            height: height * .05,
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
                                      Icons.notifications_outlined,
                                      color: white,
                                      size: height * .05,
                                    ),
                                  ),
                                  Positioned(
                                    top: width*.02,
                                    right: width*.02,
                                    child: CircleAvatar(
                                      radius: height * .014,
                                      backgroundColor: red,
                                      child: Text(
                                        '3',
                                        style: TextStyle(color: white,fontSize: height*.015),
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
                          Row(
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
                                      ),
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
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: width * .8,
                        height: height * .15,
                        child: InkWell(
                          onTap: (){
                            print('tapped');
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => const StationLocation(latitude: 23, longitude: 123,)));
                          },
                          child: Card(
                            elevation: 9,
                            color: white,
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Column(
                                      children: [
                                        SizedBox(
                                            width: height * .07,
                                            height: height * .07,
                                            child: Image.asset(
                                                'assets/images/teams/neftchi.png')),
                                        const Text('Neftchi'),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          '17:00',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: height * .04,
                                          ),
                                        ),
                                        Text(
                                          '30-mart',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: height * .02,
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
                                        Text('Neftchi2'),
                                      ],
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    InkWell(
                                      onTap: (){
                                        print('tapped');
                                        Navigator.push(context,
                                            MaterialPageRoute(builder: (context) => const StationLocation(latitude: 23, longitude: 123,)));
                                      },
                                      child: Icon(
                                        CupertinoIcons.location_solid,
                                        color: grey,
                                      ),
                                    ),
                                    Text('Bobur Arena'),
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
                          width: height * .07,
                          height: height * .07,
                          child:
                              Image.asset('assets/images/teams/superliga.png')),
                      Text(
                        'Superliga',
                        style: TextStyle(
                          fontSize: height * .03,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: width,
                    height: height * .5,
                    child: ListView.builder(
                      itemCount: 5,
                      physics: PageScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>ChooseSectorPage()));
                          },
                          child: SizedBox(
                            width: width * .8,
                            height: height * .15,
                            child: Card(
                              elevation: 9,
                              color: primary,
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
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
                      Text(
                        "O'zbekiston kubogi",
                        style: TextStyle(
                          fontSize: height * .03,
                          fontWeight: FontWeight.bold,
                        ),
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
                        return SizedBox(
                          width: width * .8,
                          height: height * .15,
                          child: Card(
                            elevation: 9,
                            color: primary,
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
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
                        );
                      },
                    ),
                  ),
                  SizedBox(height: height*.02,),
                  Row(
                    children: [
                      Text(
                        "Mahsulotlar",
                        style: TextStyle(
                          fontSize: height * .03,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: width,
                    height: height * .5,
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,

                      ),
                      itemCount:4,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            SizedBox(
                              width: width * .8,
                              height: height * .15,
                              child: Card(
                                elevation: 0.4,
                                borderOnForeground: true,
                                color:white,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Image.asset('assets/images/teams/hotdog.png'),
                                    Text('Hotdog',style: TextStyle(fontSize: height*.03),)
                                  ],
                                ),
                              ),
                            ),
                            Text('10 000 UZS',style: TextStyle(fontSize: height*.02,color: red),)
                          ],
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
