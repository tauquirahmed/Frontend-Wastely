import 'package:flutter/material.dart';
import 'package:wastely/palletes/pallets.dart';
import 'package:wastely/widgets/camera.dart';
import 'package:wastely/widgets/camera_card.dart';
import 'package:wastely/widgets/gradient_button.dart';
import 'package:wastely/widgets/text_field.dart';

class CameraScreen extends StatelessWidget {
  const CameraScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              RegisterTextField(hintText: "Location"),
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
              RegisterTextField(hintText: "Description"),
              const SizedBox(height: 20),
              GradientButton(name: "Save", onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
