import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wastely/urls/urls.dart';

class LoginController extends GetxController {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final dio =
      Dio(BaseOptions(baseUrl: baseUrl, validateStatus: (status) => true));
  @override
  void onInit() {
    super.onInit();
  }

  void request() async {
    try {
      final response = await dio.post(loginUrl, data: {
        'username': usernameController.text,
        'password': passwordController.text,
      });
      if (response.statusCode == 200) {
        Get.snackbar('Success', 'Login Successful');
      } else {
        Get.snackbar('Error', response.data['message']);
      }
    } catch (e) {
      print(e);
    }
  }

  void login() {
    if (usernameController.text.isEmpty || passwordController.text.isEmpty) {
      Get.snackbar('Error', 'Please fill all fields');
    } else {
      request();
    }
  }
}
