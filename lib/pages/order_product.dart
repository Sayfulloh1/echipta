import 'package:e_chipta/utils/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OrderProductPage extends StatefulWidget {
  const OrderProductPage({super.key});

  @override
  State<OrderProductPage> createState() => _OrderProductPageState();
}

class _OrderProductPageState extends State<OrderProductPage> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Material(
      child: Center(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: width*.07),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.center,
                child: Image.asset('assets/images/teams/hotdog.png'),
              ),
              Row(

                children: [
                  Text(
                    'Panama',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w900,
                      fontFamily: 'Poppins',
                      fontSize: height * .03,
                    ),
                  ),
                  SizedBox(width: width*.05),
                  Text(
                    '60 000 uzs',
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.w900,
                      fontFamily: 'Poppins',
                      fontSize: height * .02,
                    ),
                  ),
                ],
              ),
              Text(
                'Yetkazib berish narxi: 30 000 uzs',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w900,
                  fontFamily: 'Poppins',
                  fontSize: height * .016,
                ),
              ),
              SizedBox(height: height * .03),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: width * .3,
                    height: height * .06,
                    decoration: BoxDecoration(
                      color: greyShade3,
                      borderRadius: BorderRadius.circular(width * .1),
                    ),
                    child: Text(
                      'Olib ketish',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w900,
                        fontFamily: 'Poppins',
                        fontSize: height * .015,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: width * .5,
                    height: height * .06,
                    decoration: BoxDecoration(
                      color: Colors.greenAccent,
                      borderRadius: BorderRadius.circular(width * .1),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.delivery_dining_rounded,
                          size: height * .03,
                        ),
                        Text(
                          'Yetkazib berish',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w900,
                            fontFamily: 'Poppins',
                            fontSize: height * .015,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: height * .03),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: width * .13,
                    height: height * .08,
                    decoration: BoxDecoration(
                      color: greyShade3,
                      borderRadius: BorderRadius.circular(width * .1),
                    ),
                    child: Text(
                      'S',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w900,
                        fontFamily: 'Poppins',
                        fontSize: height * .02,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: width * .13,
                    height: height * .08,
                    decoration: BoxDecoration(
                      color: greyShade3,
                      borderRadius: BorderRadius.circular(width * .1),
                    ),
                    child: Text(
                      'M',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w900,
                        fontFamily: 'Poppins',
                        fontSize: height * .02,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: width * .13,
                    height: height * .08,
                    decoration: BoxDecoration(
                      color: greyShade3,
                      borderRadius: BorderRadius.circular(width * .1),
                    ),
                    child: Text(
                      'L',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w900,
                        fontFamily: 'Poppins',
                        fontSize: height * .02,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: width * .13,
                    height: height * .08,
                    decoration: BoxDecoration(
                      color: greyShade3,
                      borderRadius: BorderRadius.circular(width * .1),
                    ),
                    child: Text(
                      'XL',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w900,
                        fontFamily: 'Poppins',
                        fontSize: height * .02,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: width * .13,
                    height: height * .08,
                    decoration: BoxDecoration(
                      color: greyShade3,
                      borderRadius: BorderRadius.circular(width * .1),
                    ),
                    child: Text(
                      'XXL',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w900,
                        fontFamily: 'Poppins',
                        fontSize: height * .02,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: height * .03),
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(

                    borderRadius: BorderRadius.circular(width * .1),
                    borderSide: BorderSide(
                      color:  white,
                    ),

                  ),
                  enabledBorder: OutlineInputBorder(

                    borderRadius: BorderRadius.circular(width * .1),
                    borderSide: BorderSide(
                      color:  greyShade3,
                    ),

                  ),
                  fillColor: greyShade3,
                  enabled: true,
                  filled: true,
                  hintText: "   To'liq manzilingizni kiriting",
                  hintStyle: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: height * .017,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: height * .03),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Jami narx",
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w900,
                          fontFamily: 'Poppins',
                          fontSize: height * .02,
                        ),
                      ),
                      Text(
                        "90 000uzs",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w900,
                          fontFamily: 'Poppins',
                          fontSize: height * .03,
                        ),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primary,
                      minimumSize: Size(
                        width * .3,
                        height * .06,
                      ),
                    ),
                    child: Text(
                      "To'lov qilish",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                        fontFamily: 'Poppins',
                        fontSize: height * .02,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
