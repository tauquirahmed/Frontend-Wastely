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

  @override
  Widget build(BuildContext context) {
    return GetAlias.GetBuilder<ComplaintController>(
      init: ComplaintController(),
      builder: (controller) => Scaffold(
        appBar: AppBar(
          title: const Text('Register Complaint'),
        ),
        body: Stack(
          children: [
            Center(
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
                        controller.saveComplaint(context);
                      },
                    ),
                  ],
                ),
              ),
            ),
            GetAlias.Obx(() {
              if (controller.isLoading.value) {
                return Container(
                  color: Colors.black54,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              } else {
                return SizedBox.shrink();
              }
            }),
          ],
        ),
      ),
    );
  }
}
