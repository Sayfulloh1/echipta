import 'package:e_chipta/utils/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(width, height * .1),
          child: Container(
            height: height * .1,
            color: primary,
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: width * .08,
                ),
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.chevron_left_rounded,
                    size: height * .05,
                    color: white,
                  ),
                ),
                SizedBox(
                  width: width * .09,
                ),
                Text(
                  "Hisobim",
                  style: TextStyle(
                      fontSize: height * .022,
                      color: white,
                      fontWeight: FontWeight.w800,
                      fontFamily: "Poppins"),
                ),
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: PageScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: width * .04),
            child: Column(
              children: [
                SizedBox(
                  height: height * .05,
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: width * .07, vertical: width * .02),
                  width: width * .8,
                  height: height * .1,
                  decoration: BoxDecoration(
                    color: primary,
                    borderRadius: BorderRadius.circular(height * .04),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(
                        backgroundImage:
                            AssetImage('assets/images/teams/neftchi.png'),
                        radius: height * .035,
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: height * .011,
                          ),
                          Text(
                            "Komilov Sardorbek",
                            style: TextStyle(
                              fontSize: height * .02,
                              color: white,
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            "+998902344332",
                            style: TextStyle(
                              fontSize: height * .02,
                              color: white,
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Balans:",
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: height * .02,
                        color: primary,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    Text(
                      " 500 000 UZS",
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: height * .03,
                        fontWeight: FontWeight.bold,
                        color: primary,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: height*.03,),

                ListView(

                  padding: EdgeInsets.symmetric(horizontal: width * .04),
                  shrinkWrap: true,
                  children: [
                    ListTile(
                      enabled: true,
                      title: Text("To'lovlarim"),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(height*.03),
                        side: BorderSide(color: greyShade3),
                      ),
                      leading: CircleAvatar(
                        radius: height*.022,
                        backgroundColor: primary,
                        child: Icon(
                          CupertinoIcons.tickets,
                          color: white,
                          size: height * .02,
                        ),
                      ),
                      trailing: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.chevron_right,
                          size: height * .04,
                        ),
                      ),
                    ),
                    SizedBox(height: height*.02,),
                    ListTile(
                      enabled: true,
                      title: Text("Id kartam"),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(height*.03),
                        side: BorderSide(color: greyShade3),
                      ),
                      leading: CircleAvatar(
                        radius: height*.022,
                        backgroundColor: primary,
                        child: Icon(
                          CupertinoIcons.tickets,
                          color: white,
                          size: height * .02,
                        ),
                      ),
                      trailing: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.chevron_right,
                          size: height * .04,
                        ),
                      ),
                    ),
                    SizedBox(height: height*.02,),
                    ListTile(
                      enabled: true,
                      title: Text("Chiptalarim"),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(height*.03),
                        side: BorderSide(color: greyShade3),
                      ),
                      leading: CircleAvatar(
                        radius: height*.022,
                        backgroundColor: primary,
                        child: Icon(
                          CupertinoIcons.tickets,
                          color: white,
                          size: height * .02,
                        ),
                      ),
                      trailing: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.chevron_right,
                          size: height * .04,
                        ),
                      ),
                    ),
                    SizedBox(height: height*.02,),
                    ListTile(
                      enabled: true,
                      title: Text("Buyurtmalar tarixi"),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(height*.03),
                        side: BorderSide(color: greyShade3),
                      ),
                      leading: CircleAvatar(
                        radius: height*.022,
                        backgroundColor: primary,
                        child: Icon(
                          CupertinoIcons.tickets,
                          color: white,
                          size: height * .02,
                        ),
                      ),
                      trailing: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.chevron_right,
                          size: height * .04,
                        ),
                      ),
                    ),
                    SizedBox(height: height*.02,),
                    ListTile(
                      enabled: true,
                      title: Text("Sozlamalar"),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(height*.03),
                        side: BorderSide(color: greyShade3),
                      ),
                      leading: CircleAvatar(
                        radius: height*.022,
                        backgroundColor: primary,
                        child: Icon(
                          CupertinoIcons.tickets,
                          color: white,
                          size: height * .02,
                        ),
                      ),
                      trailing: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.chevron_right,
                          size: height * .04,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
