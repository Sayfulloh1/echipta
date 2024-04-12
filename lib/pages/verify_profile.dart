import 'package:e_chipta/pages/choose_club_page.dart';
import 'package:e_chipta/presentation/styles_manager.dart';
import 'package:flutter/material.dart';

import '../utils/color.dart';

class VerifyProfilePage extends StatefulWidget {
  const VerifyProfilePage({super.key});

  @override
  State<VerifyProfilePage> createState() => _VerifyProfilePageState();
}

class _VerifyProfilePageState extends State<VerifyProfilePage> {
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
                  backgroundColor: const Color(0xff06BC49).withOpacity(.2),
                  child: CircleAvatar(
                    radius: height * .08,
                    backgroundColor: const Color(0xff06BC49).withOpacity(.6),
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
                    color: const Color(0xff06BC49).withOpacity(.2),
                  ),
                  child: Text(
                    "Tasdiqlandi",
                    style: getMainTextStyle(height * .018,
                        color: const Color(0xff06D752)),
                  ),
                ),
                SizedBox(
                  height: height * .04,
                ),
                SizedBox(
                  width: width * .8,
                  child: Text(
                      textAlign: TextAlign.center,
                      maxLines: 3,
                      "Assalomu alaykum \nechipta platformasiga xush kelibsiz!",
                      style: getRegularTextStyle(
                        color: grey,
                        height * .02,
                      )),
                ),
                SizedBox(
                  height: height * .02,
                ),
                Text("Profilingiz tasdiqlandi",
                    style: getRegularTextStyle(
                      height * .03,
                    )),
                SizedBox(
                  height: height * .04,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(width * .5, height * .07),
                    backgroundColor: primary,
                  ),
                  onPressed: () {
                    // key.currentState!.validate();
                    // print(key.currentState);
                    // Navigator.pushReplacement(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => const GetOtp()));
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ChooseClubTeam()));
                  },
                  child: Text(
                    "Kirish",
                     style: getRegularTextStyle(
                    height * .02,color: white,
                  )
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
