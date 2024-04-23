
import 'package:e_chipta/pages/auth/create_account.dart';
import 'package:e_chipta/repository/auth_repo.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

import '../../injector_container.dart';
import '../../presentation/styles_manager.dart';
import '../../utils/color.dart';

import '../choose_club_page.dart';
import '../page_navigation.dart';

class GetOtp extends StatefulWidget {
  const GetOtp({super.key, required this.phoneNumber});

  final String phoneNumber;

  @override
  State<GetOtp> createState() => _GetOtpState();
}

class _GetOtpState extends State<GetOtp> {
  @override
  void dispose() {
    pinController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  final key = GlobalKey<FormState>();
  final focusNode = FocusNode();
  final intRegex = RegExp(r'\d+', multiLine: true);
  TextEditingController pinController = TextEditingController();

  // void onCheckOtp() async{
  //   // Retrieve phone number from shared preferences
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   String? phoneNumber = prefs.getString('phoneNumber');
  //
  //   // Get OTP entered by the user
  //   String otp = pinController.text;
  //
  //   // Validate OTP and phone number
  //   if (key.currentState!.validate() && phoneNumber != null) {
  //     // Send verification request to the API
  //     const String apiUrl =
  //         'https://test-api.echipta.uz/api/clients/verify-otp';
  //     final response = await http.post(
  //       Uri.parse(apiUrl),
  //       headers: <String, String>{
  //         'Content-Type': 'application/json',
  //       },
  //       body: jsonEncode(<String, String>{
  //         'phone': '998$phoneNumber',
  //         'code': otp,
  //       }),
  //     );
  //
  //     if (response.statusCode == 200) {
  //       // OTP verification successful, navigate to CreateAccount page
  //       print('status code in otp screen is 200');
  //       print(response.body);
  //
  //       Map<String, dynamic> responseData = json.decode(response.body);
  //
  //       // Extract access token from the response data
  //       String accessToken = responseData['data']['access_token'];
  //
  //       // Save the access token to shared preferences
  //       SharedPreferences prefs = await SharedPreferences.getInstance();
  //       await prefs.setString('accessToken', accessToken);
  //       print('token is saved : ${responseData['data']['access_token']}');
  //
  //       // Send a GET request to fetch user data using the access token
  //       const String apiUrl = 'https://test-api.echipta.uz/api/clients/me';
  //       final getUserResponse = await http.get(
  //         Uri.parse(apiUrl),
  //         headers: <String, String>{
  //           'Authorization': 'Bearer $accessToken',
  //           // Include the access token in the Authorization header
  //         },
  //       );
  //
  //       if (getUserResponse.statusCode == 200) {
  //         // Parse the response JSON of the user data
  //         Map<String, dynamic> userData = json.decode(getUserResponse.body);
  //
  //         // Extract is_filed and team from the response
  //         bool isFiled = userData['data']['is_filed'];
  //         Map<String, dynamic>? team = userData['data']['team'];
  //
  //         if (!isFiled) {
  //           goCreateAccount();
  //         } else {
  //           // If is_filed is true, check if team is not null
  //           if (team != null) {
  //             // If team is not null, navigate to MyPages page
  //             goMyPages();
  //           } else {
  //             // If team is null, navigate to ChooseClubTeam page
  //             goChooseClub();
  //           }
  //         }
  //
  //         // Here, you can handle the user data as per your requirement
  //
  //         // For example, if you want to print the user's full name
  //         print('User Full Name: ${userData['data']['full_name']}');
  //       } else {
  //         // Handle error (e.g., show error message)
  //         print('Failed to fetch user data');
  //       }
  //     } else {
  //       // Handle error (e.g., show error message)
  //       print(response.body);
  //       print('Failed to verify OTP');
  //     }
  //   }
  // }

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

  void onCheckOtp() async {
    setLoading();
    final data = await sl<AuthRepository>()
        .verifyOtp(phoneNumber: widget.phoneNumber, code: pinController.text);

    data.fold((left) {
      print('error left: ${left.message}');
      dismissLoading();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('error: ${left.message}')));
    }, (right) {
      dismissLoading();
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => CreateAccount(),
        ),
        (_) => false,
      );
    });
  }

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

    return Scaffold(
      body: SingleChildScrollView(
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
                  controller: pinController,
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
                  onPressed: onCheckOtp,
                  child: isLoading
                      ? const CircularProgressIndicator()
                      : Text('Tasdiqlash',
                          style:
                              getRegularTextStyle(height * .02, color: white)),
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

  void goMyPages() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const MyPages()),
    );
  }

  void goChooseClub() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const ChooseClubTeam()),
    );
  }
}
