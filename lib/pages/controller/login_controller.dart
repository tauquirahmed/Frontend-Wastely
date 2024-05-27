import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wastely/constants/constants.dart';
import 'package:wastely/models/user.dart';
import 'package:wastely/storage/box.dart';
import 'package:wastely/urls/urls.dart';

class LoginController extends GetxController {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  RxBool isReady = false.obs;
  userModel user = userModel();
  @override
  void onInit() {
    super.onInit();
  }

  Future<void> getProfile() async {
    try {
      final response = await dio.get(profileUrl);

      if (response.statusCode == 200) {
        user = userModel.fromJson(response.data);
        isReady.value = true;
      }
    } catch (e) {
      print(e);
    }
  }

  Future<bool> request() async {
    try {
      final response = await dio.post(loginUrl, data: {
        'username': usernameController.text,
        'password': passwordController.text,
      });

      if (response.statusCode == 200) {
        // Get.snackbar('Success', 'Login Successful');
        box.write('uid', response.data['uid']);
        Get.toNamed('/dashboard');
        return true;
      } else {
        // Get.snackbar('Error', response.data['message']);
        return false;
      }
    } catch (e) {
      print(e);
      // Get.snackbar("Error", e.toString());
    }
    return false;
  }

  void login() {
    if (usernameController.text.isEmpty || passwordController.text.isEmpty) {
      Get.snackbar('Error', 'Please fill all fields');
    } else {
      request();
    }
  }
}
