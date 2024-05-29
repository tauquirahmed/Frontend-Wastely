import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wastely/pages/controller/complaint_controller.dart';

class CameraCard extends StatefulWidget {
  CameraCard({Key? key}) : super(key: key);

  @override
  State<CameraCard> createState() => _CameraCardState();
}

class _CameraCardState extends State<CameraCard> {
  Future<void> _pickImageFromCamera(BuildContext context) async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image == null) {
      return;
    }

    File imageFile = File(image.path);
    Get.find<ComplaintController>().setImage(imageFile);

    if (imageFile != null) {
      String message = 'Image uploaded successfully';
      // Optionally show a dialog or message
      // _showDialog(context, 'API Response', message);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ComplaintController>(
      builder: (controller) {
        return controller.selectedImage != null
            ? Image.file(
                controller.selectedImage!,
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
                ),
              );
      },
    );
  }
}
