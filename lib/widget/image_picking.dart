import 'dart:io';

import 'package:e_chipta/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../presentation/styles_manager.dart';
import 'package:http/http.dart' as http;
class ImagePickerContainer extends StatefulWidget {
  final Function(XFile) onImagePicked;

  const ImagePickerContainer({super.key, required this.onImagePicked});

  @override
  State<ImagePickerContainer> createState() => _ImagePickerContainerState();

  void onImageUploaded(String imageUrl) {}
}

class _ImagePickerContainerState extends State<ImagePickerContainer> {
  File? pickedImage;

  Future<void> _pickImage() async {
    final image =
    await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        pickedImage = File(image.path);
      });
      _uploadImage(pickedImage!); // Upload the picked image
    }
  }

  Future<void> _uploadImage(File imageFile) async {
    // Create a multipart request
    var request = http.MultipartRequest(
      'POST',
      Uri.parse('https://test-api.echipta.uz/api/clients/update-personal-data'), // Replace with your API endpoint
    );

    // Add the image file to the request
    request.files.add(
      await http.MultipartFile.fromPath('image', imageFile.path),
    );

    // Send the request
    var response = await request.send();

    // Handle the response
    if (response.statusCode == 200) {
      // Image uploaded successfully
      // Get the URL of the uploaded image from the response

      final imageUrl = await response.stream.bytesToString();
      widget.onImageUploaded(imageUrl);
      print('user data uploaded');// Pass the image URL to the callback function
    } else {
      // Image upload failed
      print('Image upload failed with status code ${response.statusCode}');
      // widget.onImageUploaded(); // Pass null to indicate failure
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
