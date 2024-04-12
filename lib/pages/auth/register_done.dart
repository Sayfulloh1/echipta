import 'package:e_chipta/pages/choose_club_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/color.dart';

class RegisterDonePage extends StatelessWidget {
  const RegisterDonePage({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Material(
      color: white,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: width * .3,
              height: width * .3,
              child: Image.asset(
                'assets/images/appiconprm.png',
              ),
            ),
            SizedBox(height: height * .02),
            Text(
              'Tabriklaymiz!',
              style: GoogleFonts.alatsi().copyWith(
                fontSize: height * .04,
                color: black,
                fontWeight: FontWeight.w400,
              ),
            ),
            Text(
              "Ro'yhatdan o'tish muvaffaqiyatli bo'ldi",
              style: GoogleFonts.alatsi().copyWith(
                fontSize: height * .02,
                color: grey,
                fontWeight: FontWeight.w300,
              ),
            ),
            SizedBox(height: height*.02,),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size(width*.5, height * .07),
                backgroundColor: primary,
              ),
              onPressed: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>ChooseClubTeam()));

              },
              child: Text(
                'Asosiy sahifa',
                style: GoogleFonts.alexandria()
                    .copyWith(color: white, fontSize: height * .02),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
