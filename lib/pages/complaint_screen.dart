import 'package:flutter/material.dart';
import 'package:get/get.dart' as GetAlias;
import 'package:dio/dio.dart';
import 'package:wastely/constants/constants.dart';
import 'package:wastely/pages/controller/complaint_controller.dart';
import 'package:wastely/palletes/pallets.dart';
import 'package:wastely/urls/urls.dart';
import 'package:wastely/widgets/camera_card.dart';
import 'package:wastely/widgets/gradient_button.dart';
import 'package:wastely/widgets/text_field.dart';

import '../storage/box.dart';

class CameraScreen extends StatelessWidget {
  const CameraScreen({super.key});

  Future<void> _submitComplaint(
      BuildContext context, ComplaintController controller) async {
    if (controller.selectedImage == null ||
        controller.locationController.text.isEmpty ||
        controller.descriptionController.text.isEmpty) {
      _showDialog(
          context, 'Error', 'Please fill in all fields and capture an image.');
      return;
    }

    try {
      String apiUrl = registerComplaintUrl;
      FormData formData = FormData.fromMap({
        'image': await MultipartFile.fromFile(controller.selectedImage!.path,
            filename: 'upload.jpg'),
        'location': controller.locationController.text,
        'description': controller.descriptionController.text,
      });

      Response response =
          await dio.post(apiUrl, data: formData, queryParameters: {
        'uid': box.read('uid'),
      });

      if (response.statusCode == 200) {
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
    return GetAlias.GetBuilder<ComplaintController>(
      init: ComplaintController(),
      builder: (controller) => Scaffold(
        appBar: AppBar(
          title: const Text('Register Complaint'),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CameraCard(),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 20, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Location",
                        style: TextStyle(
                            color: Pallete.whiteColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                RegisterTextField(
                  hintText: "Location",
                  controller: controller.locationController,
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 20, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Description",
                        style: TextStyle(
                            color: Pallete.whiteColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                RegisterTextField(
                  hintText: "Description",
                  controller: controller.descriptionController,
                ),
                const SizedBox(height: 20),
                GradientButton(
                  name: "Save",
                  onPressed: () {
                    _submitComplaint(context, controller);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
