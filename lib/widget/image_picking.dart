import 'dart:io';

import 'package:e_chipta/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../presentation/styles_manager.dart';

class ImagePickerContainer extends StatefulWidget {
  final Function(XFile) onImagePicked;

  const ImagePickerContainer({super.key, required this.onImagePicked});

  @override
  State<ImagePickerContainer> createState() => _ImagePickerContainerState();
}

class _ImagePickerContainerState extends State<ImagePickerContainer> {
  XFile? pickedImage;

  Future<void> _pickImage() async {
    final XFile? image =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        pickedImage = image;
      });
      widget.onImagePicked(image); // Call the callback function with the image
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Container(
      height: height * .06,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(width * .04),
        color: txtFieldBack,
      ),
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal:width*.033),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            pickedImage == null
                ?  Center(
                    child: Text(
                      'Suratingiz',
                        style: getRegularTextStyle(height*.02,color: grey),
                    ),
                  ): Text('Surat tanlandi', style: getRegularTextStyle(height*.02,color: grey),),
                // : Image.file(
                //     File(pickedImage!.path),
                //     fit: BoxFit.cover,
                //     width: double.infinity,
                //     height: double.infinity,
                //   ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: primary),
              onPressed: _pickImage,
              child:  Text('Tanlash',style: getMainTextStyle(height*.02,color: white),),
            ),
          ],
        ),
      ),
    );
  }
}
