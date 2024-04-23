
import 'package:e_chipta/pages/auth/get_otp.dart';
import 'package:e_chipta/presentation/styles_manager.dart';
import 'package:e_chipta/repository/auth_repo.dart';
import 'package:e_chipta/utils/color.dart';
import 'package:flutter/material.dart';

import '../../injector_container.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController phoneController = TextEditingController();
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

  var key = GlobalKey<FormState>();

  // Future<void> _sendOTP() async {
  //   const String apiUrl = 'https://test-api.echipta.uz/api/clients/get-otp';
  //
  //   final response = await http.post(
  //     Uri.parse(apiUrl),
  //     headers: <String, String>{
  //       'Content-Type': 'application/json',
  //     },
  //     body: jsonEncode(<String, String>{
  //       'phone': '998${phoneController.text}', // Prepend country code
  //     }),
  //   );
  //
  //   if (response.statusCode == 200) {
  //     // If the OTP is successfully sent, navigate to the OTP screen
  //     print('status code in registration is 200');
  //     print(response.body);
  //     goOTP();
  //
  //     final SharedPreferences prefs = await SharedPreferences.getInstance();
  //     await prefs.setString('phoneNumber', phoneController.text);
  //   } else {
  //     // Handle error here (e.g., show an error message)
  //     print('Failed to send OTP');
  //   }
  // }

  Future<void> sendOtpEvent(String phoneNumber) async {
    setLoading();
    final fullNumber = '998$phoneNumber';
    final result = await sl<AuthRepository>().sendOtp(phoneNumber: fullNumber);
    result.fold(
      (left) {

        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Error: ${left.message}')));
      },
      (right) {
        dismissLoading();
        print('successs');
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => GetOtp(
              phoneNumber: fullNumber,
            ),
          ),
        );
      },
    );
  }

  // void goOTP() {
  //   Navigator.pushReplacement(
  //     context,
  //     MaterialPageRoute(builder: (context) => const GetOtp()),
  //   );
  // }

  @override
  void dispose() {
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Material(
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
                  Container(
                    height: height * .08,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      color: txtFieldBack,
                      borderRadius: BorderRadius.circular(width * .04),
                    ),
                    child: Row(
                      children: [
                        Text('   +998'),
                        Expanded(
                          child: TextFormField(
                            controller: phoneController,
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            validator: (number) {
                              if (number!.isEmpty) {
                                return null;
                              } else {
                                return null;
                              }
                            },
                            decoration: InputDecoration(
                              hintText: '(_ _)_ _ _ _ _ _ _',
                              hintStyle:
                                  getRegularTextStyle(height * .018, color: grey),
                              fillColor: txtFieldBack,
                              filled: true,
                              border: InputBorder.none,
                              /*border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.transparent),
      
                                borderRadius: BorderRadius.circular(width * .04),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(width * .04),
                                borderSide: BorderSide(color: Colors.transparent),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(width * .04),
                                borderSide: BorderSide(color: Colors.transparent),
      
                              ),
                              disabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(width * .04),
                                borderSide: BorderSide(color: Colors.transparent),
      
                              ),*/
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: height * .03),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(width, height * .07),
                      backgroundColor: primary,
                    ),
                    onPressed: () async {
                      if (phoneController.text.length == 9) {
                        await sendOtpEvent(phoneController.text);
                      } else {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) => Container(
                            color: primary,
                            height: height * .2,
                            width: width,
                            child: Center(
                              child: Text(
                                "To'gri raqam kiriting",
                                style: getRegularTextStyle(height * .02,
                                    color: white),
                              ),
                            ),
                          ),
                        );
                        phoneController.clear();
                      }
                    },
                    child: isLoading
                        ? const CircularProgressIndicator()
                        : Text(
                            'Kodni yuborish',
                            style:
                                getRegularTextStyle(height * .02, color: white),
                          ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
