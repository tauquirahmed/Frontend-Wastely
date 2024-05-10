import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:wastely/pages/login_screen.dart';
import 'package:wastely/pages/register_screen.dart';
import 'package:wastely/palletes/pallets.dart';
import 'package:wastely/widgets/camera.dart';

void main() {
  setPathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Wastely',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark()
          .copyWith(scaffoldBackgroundColor: Pallete.backgroundColor),
      initialRoute: '/camera',
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
      ],
    );
  }
}
