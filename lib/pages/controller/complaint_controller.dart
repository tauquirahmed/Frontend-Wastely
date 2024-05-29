import 'package:flutter/material.dart';
import 'package:get/get.dart' as GetAlias;
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:wastely/pages/controller/dashboard_controller.dart';
import 'package:wastely/urls/urls.dart';
import 'package:wastely/constants/constants.dart';

class ComplaintController extends GetAlias.GetxController {
  final TextEditingController locationController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  GetAlias.RxBool isLoading = false.obs;
  File? selectedImage;

  @override
  void onInit() {
    super.onInit();
  }

  void setImage(File image) {
    selectedImage = image;
    update();
  }

  void setLoading(bool loading) {
    isLoading.value = loading;
  }

  Future<void> saveComplaint(BuildContext context) async {
    if (selectedImage == null ||
        locationController.text.isEmpty ||
        descriptionController.text.isEmpty) {
      _showDialog(
          context, 'Error', 'Please fill in all fields and capture an image.');
      return;
    }

    setLoading(true);

    try {
      String apiUrl = registerComplaintUrl;
      FormData formData = FormData.fromMap({
        'image': await MultipartFile.fromFile(selectedImage!.path,
            filename: 'upload.jpg'),
        'location': locationController.text,
        'description': descriptionController.text,
      });

      Response response = await dio.post(apiUrl, data: formData);

      if (response.statusCode == 200) {
        DashboardController().getProfile();
        _showDialog(
            context,
            'Success',
            response.data[
                'message']); // Adjust based on your API response structure
      } else {
        _showDialog(context, 'Error',
            'Failed to submit complaint: ${response.statusCode}');
      }
    } catch (e) {
      _showDialog(context, 'Error', 'Failed to submit complaint: $e');
    } finally {
      setLoading(false);
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
}
