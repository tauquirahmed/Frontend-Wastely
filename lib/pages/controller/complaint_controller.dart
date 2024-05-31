import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart' as GetAlias;
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:wastely/pages/controller/dashboard_controller.dart';
import 'package:wastely/storage/box.dart';
import 'package:wastely/urls/urls.dart';
import 'package:wastely/constants/constants.dart';

class ComplaintController extends GetAlias.GetxController {
  final TextEditingController locationController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  GetAlias.RxBool isLoading = false.obs;
  GetAlias.RxBool isGettingLocation = false.obs;
  File? selectedImage;

  Future<Position> getGeoLocationPosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  Future<void> GetAddressFromLatLong(Position position) async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    print(placemarks);
    Placemark place = placemarks[0];
    String Address = '${place.street}, ${place.locality}';
    locationController.text = Address;
  }

  void setImage(File image) {
    selectedImage = image;
    update();
  }

  void setLoading(bool loading) {
    isLoading.value = loading;
  }

  void setGettingLocation(bool loading) {
    isGettingLocation.value = loading;
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

      Response response =
          await dio.post(apiUrl, data: formData, queryParameters: {
        'uid': box.read('uid'),
      });

      if (response.statusCode == 200) {
        GetAlias.Get.find<DashboardController>().getProfile();
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

    @override
    void onInit() async {
      super.onInit();
    }
  }
}
