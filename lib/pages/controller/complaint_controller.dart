import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io';

class ComplaintController extends GetxController {
  final TextEditingController locationController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  File? selectedImage;

  @override
  void onInit() {
    super.onInit();
  }

  void setImage(File image) {
    selectedImage = image;
    update();
  }

  void saveComplaint() {
    if (locationController.text.isEmpty ||
        descriptionController.text.isEmpty ||
        selectedImage == null) {
      Get.snackbar('Error', 'Please fill all fields and capture an image');
    } else {
      // Save complaint logic or API call
      Get.snackbar('Success', 'Complaint saved successfully');
    }
  }
}
