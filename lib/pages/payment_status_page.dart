import 'package:e_chipta/pages/choose_club_page.dart';
import 'package:e_chipta/pages/page_navigation.dart';
import 'package:e_chipta/pages/payment_screen.dart';
import 'package:e_chipta/presentation/styles_manager.dart';
import 'package:flutter/material.dart';

import '../utils/color.dart';

class PaymentStatusPage extends StatefulWidget {
  const PaymentStatusPage({super.key});

  @override
  State<PaymentStatusPage> createState() => _PaymentStatusPageState();
}

class _PaymentStatusPageState extends State<PaymentStatusPage> {
  bool hasPaymentDone = false;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Material(
      color: white,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * .05),
          child: Form(
            // key: key,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: height * .1),
                CircleAvatar(
                  radius: height * .1,
                  backgroundColor: hasPaymentDone
                      ? const Color(0xff06BC49).withOpacity(.2)
                      : const Color(0xffBC0606).withOpacity(.6),
                  child: CircleAvatar(
                    radius: height * .08,
                    backgroundColor: hasPaymentDone
                        ? const Color(0xff06BC49).withOpacity(.6)
                        : const Color(0xffBC0606).withOpacity(.6),
                    child: Icon(
                      Icons.done,
                      size: height * .1,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  height: height * .01,
                ),
                Container(
                  alignment: Alignment.center,
                  height: height * .05,
                  width: width * .3,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(height * .1),
                    color: hasPaymentDone
                        ? const Color(0xff06BC49).withOpacity(.2)
                        : const Color(0xffBC0606).withOpacity(.3),
                  ),
                  child: Text(
                    hasPaymentDone ? "To'lov o'tdi" : "To'lov o'tmadi",
                    style: getMainTextStyle(
                      height * .018,
                      color: hasPaymentDone
                          ? const Color(0xff06D752)
                          : const Color(0xffBC0606),
                    ),
                  ),
                ),
                SizedBox(
                  height: height * .04,
                ),
                Text(
                  textAlign: TextAlign.center,
                  hasPaymentDone
                      ? "To'lov qabul qilindi"
                      : "To'lov qilishda xatolik yuz berdi :(",
                  style: getRegularTextStyle(
                    height * .03,
                  ),
                ),
                SizedBox(
                  height: height * .02,
                ),
                SizedBox(
                  width: width * .8,
                  child: Text(
                      textAlign: TextAlign.center,
                      maxLines: 3,
                      hasPaymentDone
                          ? "Chiptangiz ID kartangizga biriktirildi. Uchrashuv kuni ID kartangiz orqali kirishingiz mumkin"
                          : "Iltimos hisobingizni tekshiring yoki qaytadan harakat qilib ko`ring",
                      style: getRegularTextStyle(
                        color: grey,
                        height * .02,
                      )),
                ),
                SizedBox(
                  height: height * .02,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(width * .5, height * .07),
                    backgroundColor: primary,
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => hasPaymentDone
                                ? const MyPages()
                                : const PaymentScreen()));
                  },
                  child: Text(
                      hasPaymentDone ? "Chiptani ko'rish" : "Qayta urinish",
                      style: getRegularTextStyle(
                        height * .02,
                        color: white,
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
