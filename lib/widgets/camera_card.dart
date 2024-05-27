import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:dio/dio.dart';
import 'package:wastely/constants/constants.dart';
import 'package:wastely/storage/box.dart';
import 'package:wastely/urls/urls.dart';

class CameraCard extends StatelessWidget {
  CameraCard({
    Key? key,
  }) : super(key: key);

  File? _selectedImage;

  Future<void> _pickImageFromCamera(BuildContext context) async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image == null) {
      return;
    }

    _selectedImage = File(image.path);

    if (_selectedImage != null) {
      String message = await _sendImageToApi(_selectedImage!);
      _showDialog(context, 'API Response', message);
    }
  }

  Future<String> _sendImageToApi(File imageFile) async {
    try {
      String apiUrl = registerComplaintUrl; // Replace with your API endpoint
      FormData formData = FormData.fromMap({
        'image': await MultipartFile.fromFile(imageFile.path,
            filename: 'upload.jpg'),
      });

      Response response =
          await dio.post(apiUrl, data: formData, queryParameters: {
        'uid': box.read('uid'),
      });

      if (response.statusCode == 200) {
        return response
            .data['message']; // Adjust based on your API response structure
      } else {
        return 'Error: ${response.statusCode}';
      }
    } catch (e) {
      return 'Error: $e';
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
    return ElevatedButton(
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
  }
}
