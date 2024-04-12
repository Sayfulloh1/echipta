import 'package:e_chipta/utils/color.dart';
import 'package:flutter/material.dart';

class RatingPage extends StatefulWidget {
  const RatingPage({super.key});

  @override
  State<RatingPage> createState() => _RatingPageState();
}

class _RatingPageState extends State<RatingPage> {
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
                SizedBox(width: width*.08,),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.chevron_left_rounded,
                    size: height * .05,
                    color: white,
                  ),
                ),
                SizedBox(width: width*.04,),
                Text(
                  "Muxlislar reytingi",
                  style: TextStyle(
                      fontSize: height * .025,
                      color: white,
                      fontWeight: FontWeight.w500,
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
                      horizontal: width * .07, vertical: width * .03),
                  width: width*.8,
                  height: height * .2,
                  decoration: BoxDecoration(
                    color: primary,
                    borderRadius: BorderRadius.circular(height * .08),
                  ),
                  child: Center(
                    child: Text(
                      textAlign: TextAlign.left,
                      maxLines: 5,
                      style: TextStyle(
                          fontSize: height * .018,
                          fontFamily: "Poppins",
                          color: white),
                      "Jamoamizning har bir uchrashuviga tashrif buyuring va Falonchi tur firmasigan chet elga 2 kishilik yo‘llanma yutib oling",
                    ),
                  ),
                ),
                SizedBox(
                  height: height * .05,
                ),
                Table(
                  border: TableBorder.all(
                    color: greyShade3,
                  ),
                  defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                  // Add borders to cells
                  children: [
                    TableRow(
                      decoration: BoxDecoration(
                        color: primary,
                        borderRadius: BorderRadius.circular(height*.007),
                      ),
                      children: [
                        TableCell(
                          child: Center(
                            child: Text(
                              '#',
                              style: TextStyle(fontFamily: "Poppins",fontSize: height*.02,color: white),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ),
                        TableCell(child: Center(child: Text('Muxlislar',style:  TextStyle(fontFamily: "Poppins",fontSize: height*.02,color: white),))),
                        TableCell(child: Center(child: Text('Uchrashuv',style: TextStyle(fontFamily: "Poppins",fontSize: height*.02,color: white)))),
                        TableCell(child: Center(child: Text('Ball',style:  TextStyle(fontFamily: "Poppins",fontSize: height*.02,color: white),))),
                      ],
                    ),
                    TableRow(
                      decoration: BoxDecoration(
                        color: greyShade3,
                        borderRadius: BorderRadius.circular(height*.007),
                      ),
                      children: [
                        TableCell(child: Center(child: Text('1',style:  TextStyle(fontFamily: "Poppins",fontSize: height*.02,color: primary)))),
                        TableCell(child: Center(child: Text('Sardorbek Kamilov',style:  TextStyle(fontFamily: "Poppins",fontSize: height*.02,color: primary)))),
                        TableCell(child: Center(child: Text('1',style:  TextStyle(fontFamily: "Poppins",fontSize: height*.02,color: primary)))),
                        TableCell(child: Center(child: Text('10',style:  TextStyle(fontFamily: "Poppins",fontSize: height*.02,color: primary)))),
                      ],
                    ),
                    TableRow(
                      decoration: BoxDecoration(
                        color: greyShade3,
                        borderRadius: BorderRadius.circular(height*.007),
                      ),
                      children: [
                        TableCell(child: Center(child: Text('1',style:  TextStyle(fontFamily: "Poppins",fontSize: height*.02,color: primary)))),
                        TableCell(child: Center(child: Text('Sardorbek Kamilov',style:  TextStyle(fontFamily: "Poppins",fontSize: height*.02,color: primary)))),
                        TableCell(child: Center(child: Text('1',style:  TextStyle(fontFamily: "Poppins",fontSize: height*.02,color: primary)))),
                        TableCell(child: Center(child: Text('10',style:  TextStyle(fontFamily: "Poppins",fontSize: height*.02,color: primary)))),
                      ],
                    ),
                    TableRow(
                      decoration: BoxDecoration(
                        color: greyShade3,
                        borderRadius: BorderRadius.circular(height*.007),
                      ),
                      children: [
                        TableCell(child: Center(child: Text('1',style:  TextStyle(fontFamily: "Poppins",fontSize: height*.02,color: primary)))),
                        TableCell(child: Center(child: Text('Sardorbek Kamilov',style:  TextStyle(fontFamily: "Poppins",fontSize: height*.02,color: primary)))),
                        TableCell(child: Center(child: Text('1',style:  TextStyle(fontFamily: "Poppins",fontSize: height*.02,color: primary)))),
                        TableCell(child: Center(child: Text('10',style:  TextStyle(fontFamily: "Poppins",fontSize: height*.02,color: primary)))),
                      ],
                    ),
                    TableRow(
                      decoration: BoxDecoration(
                        color: greyShade3,
                        borderRadius: BorderRadius.circular(height*.007),
                      ),
                      children: [
                        TableCell(child: Center(child: Text('1',style:  TextStyle(fontFamily: "Poppins",fontSize: height*.02,color: primary)))),
                        TableCell(child: Center(child: Text('Sardorbek Kamilov',style:  TextStyle(fontFamily: "Poppins",fontSize: height*.02,color: primary)))),
                        TableCell(child: Center(child: Text('1',style:  TextStyle(fontFamily: "Poppins",fontSize: height*.02,color: primary)))),
                        TableCell(child: Center(child: Text('10',style:  TextStyle(fontFamily: "Poppins",fontSize: height*.02,color: primary)))),
                      ],
                    ),
                    TableRow(
                      decoration: BoxDecoration(
                        color: greyShade3,
                        borderRadius: BorderRadius.circular(height*.007),
                      ),
                      children: [
                        TableCell(child: Center(child: Text('1',style:  TextStyle(fontFamily: "Poppins",fontSize: height*.02,color: primary)))),
                        TableCell(child: Center(child: Text('Sardorbek Kamilov',style:  TextStyle(fontFamily: "Poppins",fontSize: height*.02,color: primary)))),
                        TableCell(child: Center(child: Text('1',style:  TextStyle(fontFamily: "Poppins",fontSize: height*.02,color: primary)))),
                        TableCell(child: Center(child: Text('10',style:  TextStyle(fontFamily: "Poppins",fontSize: height*.02,color: primary)))),
                      ],
                    ),
                    TableRow(
                      decoration: BoxDecoration(
                        color: greyShade3,
                        borderRadius: BorderRadius.circular(height*.007),
                      ),
                      children: [
                        TableCell(child: Center(child: Text('1',style:  TextStyle(fontFamily: "Poppins",fontSize: height*.02,color: primary)))),
                        TableCell(child: Center(child: Text('Sardorbek Kamilov',style:  TextStyle(fontFamily: "Poppins",fontSize: height*.02,color: primary)))),
                        TableCell(child: Center(child: Text('1',style:  TextStyle(fontFamily: "Poppins",fontSize: height*.02,color: primary)))),
                        TableCell(child: Center(child: Text('10',style:  TextStyle(fontFamily: "Poppins",fontSize: height*.02,color: primary)))),
                      ],
                    ),
                    TableRow(
                      decoration: BoxDecoration(
                        color: greyShade3,
                        borderRadius: BorderRadius.circular(height*.007),
                      ),
                      children: [
                        TableCell(child: Center(child: Text('1',style:  TextStyle(fontFamily: "Poppins",fontSize: height*.02,color: primary)))),
                        TableCell(child: Center(child: Text('Sardorbek Kamilov',style:  TextStyle(fontFamily: "Poppins",fontSize: height*.02,color: primary)))),
                        TableCell(child: Center(child: Text('1',style:  TextStyle(fontFamily: "Poppins",fontSize: height*.02,color: primary)))),
                        TableCell(child: Center(child: Text('10',style:  TextStyle(fontFamily: "Poppins",fontSize: height*.02,color: primary)))),
                      ],
                    ),
                    TableRow(
                      decoration: BoxDecoration(
                        color: greyShade3,
                        borderRadius: BorderRadius.circular(height*.007),
                      ),
                      children: [
                        TableCell(child: Center(child: Text('1',style:  TextStyle(fontFamily: "Poppins",fontSize: height*.02,color: primary)))),
                        TableCell(child: Center(child: Text('Sardorbek Kamilov',style:  TextStyle(fontFamily: "Poppins",fontSize: height*.02,color: primary)))),
                        TableCell(child: Center(child: Text('1',style:  TextStyle(fontFamily: "Poppins",fontSize: height*.02,color: primary)))),
                        TableCell(child: Center(child: Text('10',style:  TextStyle(fontFamily: "Poppins",fontSize: height*.02,color: primary)))),
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
  }
}
