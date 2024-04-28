import 'dart:io';
import 'package:e_chipta/pages/verify_profile.dart';
import 'package:e_chipta/widget/birthday_picker.dart';
import 'package:e_chipta/widget/image_picking.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../presentation/styles_manager.dart';
import '../../utils/color.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  TextEditingController nameController = TextEditingController();
  TextEditingController birthdayController = TextEditingController();
  TextEditingController imageController = TextEditingController();

  bool isChecked = false;
  String? uploadedImageUrl;

  XFile? _image;

  Future<void> _getImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        _image = pickedImage;
      });
    }
  }

  void handleImageUploaded(String? imageUrl) {
    setState(() {
      uploadedImageUrl = imageUrl; // Update the state with the uploaded image URL
    });
  }


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
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: height * .1),
                Text(
                  'Hisob ochish',
                  style: getRegularTextStyle(height * .03, color: primary),
                ),
                SizedBox(height: height * .03),
                TextFormField(
                  controller: nameController,
                  style: getRegularTextStyle(height * .02, color: grey),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (name) {},
                  decoration: InputDecoration(
                    hintText: 'Ism va familiya',
                    hintStyle: getRegularTextStyle(height * .02, color: grey),
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
                BirthdateFormField(
                    hintText: "Tug'ilgan sana", controller: birthdayController),
                SizedBox(height: height * .03),
                _image == null
                    ? ImagePickerContainer(
                        onImagePicked: (image) {
                          _getImage();
                        },
                      )
                    : Image.file(
                        File(_image!.path),
                        height: 100,
                        width: 100,
                      ),
                SizedBox(height: height * .03),
                Row(
                  children: [
                    Transform.scale(
                      scale: 1.9,
                      child: Checkbox(
                        checkColor: Colors.green,
                        activeColor: greyShade3,
                        fillColor: MaterialStateProperty.resolveWith(
                            (states) => greyShade3),
                        value: isChecked,
                        side: BorderSide(width: width * .1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(width * .01),
                        ),
                        onChanged: (value) {
                          setState(() {
                            isChecked = value!;
                          });
                        },
                      ),
                    ),
                    Text(
                      "Barchasi to'gri",
                      style: getRegularTextStyle(height * .02, color: primary),
                    )
                  ],
                ),
                SizedBox(height: height * .03),
                Text(
                  maxLines: 3,
                  "Diqqat ushbu ma`lumotlaringiz to`griligiga ishonch hosil qiling. Ma`lumotlar ID kartangizga bog`lanadi",
                  style: getMainTextStyle(height * .02, color: grey),
                ),
                SizedBox(
                  height: height * .2,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(width, height * .07),
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
                            builder: (context) => const VerifyProfilePage()));
                  },
                  child: Text(
                    "Ro'yhatdan o'tish",
                    style: getRegularTextStyle(height * .02, color: white),
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
