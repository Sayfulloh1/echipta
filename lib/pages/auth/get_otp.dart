import 'dart:convert';

import 'package:e_chipta/pages/auth/create_account.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../presentation/styles_manager.dart';
import '../../utils/color.dart';
import 'package:http/http.dart' as http;

class GetOtp extends StatefulWidget {
  const GetOtp({super.key});

  @override
  State<GetOtp> createState() => _GetOtpState();
}

class _GetOtpState extends State<GetOtp> {
  @override
  void dispose() {
    pincontroller.dispose();
    focusNode.dispose();
    super.dispose();
  }

  final key = GlobalKey<FormState>();
  final focusNode = FocusNode();
  final intRegex = RegExp(r'\d+', multiLine: true);
  TextEditingController pincontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    const focusedBorderColor = Color.fromRGBO(23, 171, 144, 1);
    const fillColor = Color.fromRGBO(243, 246, 249, 0);

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    final defaultPinTheme = PinTheme(
      width: width * .15,
      height: width * .2,
      textStyle: const TextStyle(
        fontSize: 22,
        color: Color.fromRGBO(30, 60, 87, 1),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(width * .06),
        border: Border.all(color: greyShade3),
        color: greyShade3,
      ),
    );

    return Material(
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
                  child: Text('Kodni kiriting',
                      style: getRegularTextStyle(height * .03, color: primary)),
                ),
                SizedBox(height: height * .03),
                Pinput(
                  length: 5,
                  controller: pincontroller,
                  focusNode: focusNode,
                  androidSmsAutofillMethod:
                      AndroidSmsAutofillMethod.smsUserConsentApi,
                  listenForMultipleSmsOnAndroid: true,
                  defaultPinTheme: defaultPinTheme,
                  validator: numberValidator,
                  focusedPinTheme: defaultPinTheme.copyWith(
                    decoration: defaultPinTheme.decoration!.copyWith(
                      border: Border.all(color: focusedBorderColor),
                    ),
                  ),
                  submittedPinTheme: defaultPinTheme.copyWith(
                    decoration: defaultPinTheme.decoration!.copyWith(
                      color: fillColor,
                      border: Border.all(color: focusedBorderColor),
                    ),
                  ),
                  errorPinTheme: defaultPinTheme.copyBorderWith(
                    border: Border.all(color: Colors.redAccent),
                  ),
                ),
                /*  TextFieldPin(
                    textController: pincontroller,
                    autoFocus: true,
                    codeLength: 5,
                    alignment: MainAxisAlignment.center,
                    defaultBoxSize: height*.06,
                    margin: 10,
                    selectedBoxSize: height*.06,
                    textStyle: TextStyle(fontSize: height*.03),
                    defaultDecoration: _pinPutDecoration.copyWith(
                        border: Border.all(
                            color: Theme.of(context)
                                .primaryColor
                                .withOpacity(0.6))),
                    selectedDecoration: _pinPutDecoration,
                    onChange: (code) {

                    }),*/
                SizedBox(height: height * .03),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(width, height * .07),
                    backgroundColor: primary,
                  ),
                  onPressed: () async {
                    // Retrieve phone number from shared preferences
                    SharedPreferences prefs = await SharedPreferences.getInstance();
                    String? phoneNumber = prefs.getString('phoneNumber');

                    // Get OTP entered by the user
                    String otp = pincontroller.text;

                    // Validate OTP and phone number
                    if (key.currentState!.validate() && phoneNumber != null) {
                      // Send verification request to the API
                      const String apiUrl = 'https://test-api.echipta.uz/api/clients/verify-otp';
                      final response = await http.post(
                        Uri.parse(apiUrl),
                        headers: <String, String>{
                          'Content-Type': 'application/json',
                        },
                        body: jsonEncode(<String, String>{
                          'phone': phoneNumber,
                          'code': otp,
                        }),
                      );

                      if (response.statusCode == 200) {
                        // OTP verification successful, navigate to CreateAccount page
                        print('status code in otp screen is 200');
                        print(response.body);

                        goCreateAccount();
                      } else {
                        // Handle error (e.g., show error message)
                        print('Failed to verify OTP');
                      }
                    }
                  },

                  child: Text('Tasdiqlash',
                      style: getRegularTextStyle(height * .02, color: white)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String? numberValidator(String? value) {
    if (value == null || value.isEmpty) {
      // Input is empty, consider this as invalid
      return 'Iltimos, kodni kiriting';
    }

    // Check if the input is a valid number
    double? number = double.tryParse(value);
    if (number == null) {
      // Input is not a valid number
      return 'Faqat sonlarni kiriting';
    }

    // Check if the number is less than 5
    if (value.length < 5) {
      return '5 xonali kod kiriting';
    }

    // Input is valid
    return null;
  }

  void goCreateAccount() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const CreateAccount()),
    );
  }
}
