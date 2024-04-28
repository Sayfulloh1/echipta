import 'package:e_chipta/controller/provider/match_provider.dart';
import 'package:e_chipta/model/games_response.dart';
import 'package:e_chipta/model/match_category.dart';
import 'package:e_chipta/pages/choose_sector_page.dart';
import 'package:e_chipta/pages/order_product.dart';
import 'package:e_chipta/pages/station_locatin.dart';
import 'package:e_chipta/utils/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../../injector_container.dart';
import '../../repository/auth_repo.dart';

class HomePage extends StatefulWidget {
  HomePage({this.teamId});

  final int? teamId;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var isLoading = false;

  void setLoading() {
    setState(() {
      isLoading = true;
    });
  }

  void dismissLoading() {
    setState(() {
      isLoading = false;
    });
  }

  List<MatchCategory> categories = [];
  GamesResponse? games;

  Future<void> _fetchCategories() async {
    setLoading();
    final result = await sl<ApiRepository>().getMatchCategories();
    setState(() {
      if (result.isRight) {
        categories = result.right;
      }
    });
  }

  Future<void> _fetchGames() async {
    setLoading();
    final result = await sl<ApiRepository>().getGames();
    setState(() {
      if (result.isRight) {
        games = result.right;
      }
    });
  }

  @override
  void initState() {
    _fetchCategories();
    _fetchGames();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Material(
      color: const Color(0xffF6F6F6),
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
                                          size: height * .03,
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
                                        child: Image.network(
                                          categories[0].image,
                                        ),
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
                                        height: height * .03,
                                        child: Image.network(
                                          categories[1].image,
                                        ),
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
                                    builder: (context) =>
                                        const ChooseSectorPage()));
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
                                            child: Image.network(
                                               games!.currentMatch!.mainTeam.image)),
                                        SizedBox(
                                          height: height * .009,
                                        ),
                                        Text(
                                          games!.currentMatch!.mainTeam.name,
                                          style: TextStyle(
                                            fontFamily: 'Poppins',
                                            color: primary,
                                            fontSize: height * .017,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          games!.currentMatch!.startDate.substring(11),
                                          style: TextStyle(
                                              color: primary,
                                              fontWeight: FontWeight.bold,
                                              fontSize: height * .024,
                                              fontFamily: 'Poppins'),
                                        ),
                                        Text(
                                          games!.currentMatch!.startDate.substring(0,10).replaceAll('-',' . '),
                                          style: TextStyle(
                                            color: primary,
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
                                            child: Image.network(
                                              games!.currentMatch!.secondTeam.image)),
                                        SizedBox(
                                          height: height * .009,
                                        ),
                                        Text(
                                          games!.currentMatch!.secondTeam.name,
                                          style: TextStyle(
                                            fontFamily: 'Poppins',
                                            color: primary,
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
                      itemCount: games!.categoryMatches![0].matches!.length,
                      physics: PageScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        final game = games!.categoryMatches![0].matches![index];
                        return InkWell(
                          onTap: () {
                            print('tapped');
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ChooseSectorPage()));
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
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      color: greyShade2,
                                      spreadRadius: 3,
                                      blurRadius: 2),
                                ],
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
                                            game.mainTeam.name,
                                            style: TextStyle(
                                              fontFamily: 'Poppins',
                                              color: primary,
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
                                              child: Image.network(
                                                   game.mainTeam.image)),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Text(
                                            game.startDate.substring(10),
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: height * .016,
                                              fontFamily: 'Poppins',
                                              color: primary,
                                            ),
                                          ),
                                          Container(
                                            width: width * .2,
                                            height: height * .02,
                                            decoration: BoxDecoration(
                                              color: Colors.green,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Center(
                                              child: Text(
                                                'Boshlandi',
                                                style: TextStyle(
                                                  fontFamily: 'Poppins',
                                                  color: white,
                                                  fontSize: height * .01,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          SizedBox(
                                              width: height * .04,
                                              height: height * .04,
                                              child: Image.network(
                                                  game.secondTeam.image)),
                                          SizedBox(
                                            height: width * .009,
                                          ),
                                          Text(
                                            game.secondTeam.name,
                                            style: TextStyle(
                                              fontFamily: 'Poppins',
                                              color: primary,
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
                      itemCount: games!.categoryMatches![1].matches!.length,
                      physics: PageScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                       final game =  games!.categoryMatches![1].matches![index];
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
                                        Row(
                                          children: [
                                            Text(
                                              game.mainTeam.name,
                                              style: TextStyle(
                                                fontFamily: 'Poppins',
                                                color: primary,
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
                                                child: Image.network(
                                                    game.mainTeam.image)),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Text(
                                              game.startDate.substring(10),
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: height * .016,
                                                fontFamily: 'Poppins',
                                                color: primary,
                                              ),
                                            ),
                                            Container(
                                              width: width * .2,
                                              height: height * .02,
                                              decoration: BoxDecoration(
                                                color: primary,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  '00-00-00-00',
                                                  style: TextStyle(
                                                    fontFamily: 'Poppins',
                                                    color: white,
                                                    fontSize: height * .01,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            SizedBox(
                                                width: height * .04,
                                                height: height * .04,
                                                child: Image.network(
                                                    game.secondTeam.image)),
                                            SizedBox(
                                              height: width * .009,
                                            ),
                                            Text(
                                              game.secondTeam.name,
                                              style: TextStyle(
                                                fontFamily: 'Poppins',
                                                color: primary,
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
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => OrderProductPage()));
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
