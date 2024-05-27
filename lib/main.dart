import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:wastely/constants/constants.dart';
import 'package:wastely/pages/complaint_screen.dart';
import 'package:wastely/pages/dashboard.dart';
import 'package:wastely/pages/login_screen.dart';
import 'package:wastely/pages/register_screen.dart';
import 'package:wastely/palletes/pallets.dart';
import 'package:wastely/storage/box.dart';
import 'package:wastely/urls/urls.dart';
import 'package:wastely/widgets/camera.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';

void main() async {
  setPathUrlStrategy();
  dio.interceptors.add(CookieManager(cookieJar));
  await GetStorage.init();
  // fetchData();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isLoggedIn = box.read('uid') != null ? true : false;

    return GetMaterialApp(
      title: 'Wastely',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark()
          .copyWith(scaffoldBackgroundColor: Pallete.backgroundColor),
      initialRoute: isLoggedIn ? '/dashboard' : '/login',
      getPages: [
        GetPage(
            name: '/login',
            page: () => const LoginScreen(),
            transition: Transition.leftToRightWithFade,
            transitionDuration: const Duration(milliseconds: 500)),
        GetPage(
            name: '/register',
            page: () => const RegisterScreen(),
            transition: Transition.leftToRightWithFade,
            transitionDuration: const Duration(milliseconds: 500)),
        GetPage(
          name: '/camera',
          page: () => CameraApp(),
        ),
        GetPage(
          name: '/dashboard',
          page: () => Dashboard(),
        ),
        GetPage(
          name: '/complaint_screen',
          page: () => const CameraScreen(),
        ),
      ],
    );
  }
}
