import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:wastely/pages/controller/complaint_controller.dart';

class RegisterComplaintCard extends StatefulWidget {
  const RegisterComplaintCard({super.key});

  @override
  State<RegisterComplaintCard> createState() => _RegisterComplaintCardState();
}

class _RegisterComplaintCardState extends State<RegisterComplaintCard> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // _pickImageFromCamera(context);
        Get.toNamed('/complaint_screen');
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
                  'Register Complaint',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 8),
                Icon(
                  Icons.add_alert_rounded,
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
