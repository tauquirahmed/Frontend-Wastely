import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wastely/pages/controller/complaint_controller.dart';

class CameraCard extends StatefulWidget {
  CameraCard({
    Key? key,
  }) : super(key: key);

  @override
  State<CameraCard> createState() => _CameraCardState();
}

class _CameraCardState extends State<CameraCard> {
  XFile? _selectedImage;

  Future<void> _pickImageFromCamera(BuildContext context) async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image == null) {
      return;
    }

    setState(() {
      _selectedImage = XFile(image.path);
    });

    if (_selectedImage != null) {
      File imageFile = File(_selectedImage!.path);
      Get.find<ComplaintController>().setImage(imageFile);
      String message = 'Image uploaded successfully';
      // _showDialog(context, 'API Response', message);
    }
  }

  void _showDialog(BuildContext context, String title, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return (_selectedImage != null)
        ? Image.file(
            File(_selectedImage!.path),
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.height * 0.4,
          )
        : ElevatedButton(
            onPressed: () {
              _pickImageFromCamera(context);
            },
            style: ElevatedButton.styleFrom(
              elevation: 15,
              backgroundColor: Colors.blueGrey,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
            ),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.5,
              width: MediaQuery.of(context).size.width * 0.8,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Column(
                        children: [
                          Text(
                            'Open Camera',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 8),
                          Icon(
                            Icons.camera_alt,
                            size: 120,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
  }
}
