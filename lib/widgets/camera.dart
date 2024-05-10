import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CameraApp extends StatelessWidget {
  CameraApp({super.key});

  File? _selectedImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Camera App'),
      ),
      body: Column(
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () {
                // Open Camera
                _pickImageFromCamera();
              },
              child: Text('Open Camera'),
            ),
          ),
          if (_selectedImage != null)
            Image.file(
              File(_selectedImage!.path),
              width: 200,
              height: 200,
            )
          else
            Text('No image selected'),
        ],
      ),
    );
  }

  Future _pickImageFromCamera() async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image == null) {
      return;
    }
    // Do something with the image
    _selectedImage = File(image.path);
  }
}
