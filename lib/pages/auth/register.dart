import 'package:e_chipta/pages/auth/get_otp.dart';
import 'package:e_chipta/presentation/styles_manager.dart';
import 'package:e_chipta/utils/color.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController phoneController = TextEditingController();
  var key = GlobalKey<FormState>();

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
            key: key,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: height * .3),
                Center(
                  child: Text(
                    'Tizimga kirish',
                    style: getRegularTextStyle(height * .03, color: primary),
                  ),
                ),
                SizedBox(height: height * .03),
                TextFormField(
                  controller: phoneController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (number) {
                    if (number!.isEmpty) {
                      return "Telefon raqamingizni to'gri kiriting";
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                    hintText: '+998 (_ _)_ _ _ _ _ _ _',
                    hintStyle: getRegularTextStyle(height * .018, color: grey),
                    fillColor: txtFieldBack,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(width * .04),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(width * .04),
                      borderSide: BorderSide(color: greyShade1),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(width * .04),
                      borderSide: BorderSide(
                        color: red,
                      ),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(width * .04),
                      // borderSide: BorderSide(
                      //   color: greyShade1,
                      // ),
                    ),
                  ),
                ),
                SizedBox(height: height * .03),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(width, height * .07),
                    backgroundColor: primary,
                  ),
                  onPressed: () {
                    key.currentState!.validate();
                    print(key.currentState);
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const GetOtp()));
                  },
                  child: Text('Kodni yuborish',
                      style: getRegularTextStyle(height * .02, color: white)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
