import 'package:e_chipta/pages/payment_status_page.dart';
import 'package:flutter/material.dart';

import '../utils/color.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primary,
        centerTitle: true,
        title: Text(
          "To'lov qilish",
          style: TextStyle(
              fontSize: height * .022,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontFamily: 'Poppins'),
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
      body: Scaffold(
        backgroundColor: greyShade1,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * .09,vertical: height*.05),
          child: Column(
            children: [
              Text(
                "To'lov usulini tanlang",
                style: TextStyle(
                    fontSize: height * .022,
                    fontWeight: FontWeight.bold,
                    color: grey,
                    fontFamily: 'Poppins'),
              ),
              SizedBox(height: height*.02),
              Container(
                height: height*.15,
                width: width,
               decoration: BoxDecoration(
                 color: Colors.white,
                 borderRadius: BorderRadius.circular(30),
               ),
              ),
              SizedBox(height: height*.02),
              Container(
                height: height*.15,
                width: width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              SizedBox(height: height*.02),
              Container(
                height: height*.15,
                width: width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              SizedBox(height: height*.1),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>PaymentStatusPage()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: primary,
                  minimumSize: Size(
                    width,
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
        ),
      ),
    );
  }
}
