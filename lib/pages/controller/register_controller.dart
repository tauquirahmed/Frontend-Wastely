import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wastely/urls/urls.dart';

class RegisterController extends GetxController {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final dio =
      Dio(BaseOptions(baseUrl: baseUrl, validateStatus: (status) => true));
  @override
  void onInit() {
    super.onInit();
  }

  void request() async {
    try {
      final response = await dio.post(registerUrl, data: {
        'first_name': firstNameController.text,
        'last_name': lastNameController.text,
        'username': usernameController.text,
        'email': emailController.text,
        'password': passwordController.text,
      });
      if (response.statusCode == 201) {
        Get.snackbar('Success', 'Registration Successful');
      } else {
        Get.snackbar('Error', response.data['message']);
      }
    } catch (e) {
      print(e);
    }
  }

  void register() {
    if (firstNameController.text.isEmpty ||
        usernameController.text.isEmpty ||
        emailController.text.isEmpty ||
        passwordController.text.isEmpty ||
        lastNameController.text.isEmpty) {
      Get.snackbar('Error', 'Please fill all fields');
    } else {
      request();
      Get.snackbar('Success', 'Registration Successful');
    }
  }
}
