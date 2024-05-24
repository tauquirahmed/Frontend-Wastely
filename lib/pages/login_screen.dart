import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wastely/pages/controller/login_controller.dart';
import 'package:wastely/widgets/gradient_button.dart';
import 'package:wastely/widgets/login_field.dart';
import 'package:wastely/widgets/password_field.dart';
import 'package:wastely/widgets/social_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: LoginController(),
      builder: (controller) => Scaffold(
          body: SingleChildScrollView(
              child: Center(
        child: Column(
          children: [
            Image.asset('assets/images/signin_balls.png'),
            const Text(
              'Sign In',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 40,
              ),
            ),
            LoginField(
              hintText: 'Username',
              controller: controller.usernameController,
            ),
            const SizedBox(
              height: 15,
            ),
            PasswordField(
              hintText: 'Password',
              controller: controller.passwordController,
            ),
            const SizedBox(
              height: 15,
            ),
            GradientButton(
              name: 'Sign In',
              onPressed: () {
                controller.login();
              },
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Don\'t have an account? ',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey,
                    )),
                TextButton(
                    onPressed: () {
                      Get.toNamed('/register');
                    },
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    )),
              ],
            ),
            const Text(
              'or',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 15),
            const SocialButton(
              iconPath: 'assets/svgs/g_logo.svg',
              label: "Continue with Google",
              horizontalPadding: 80,
            ),
            const SizedBox(height: 20),
            const SocialButton(
              iconPath: 'assets/svgs/f_logo.svg',
              label: "Continue with Facebook",
              horizontalPadding: 70,
            ),
          ],
        ),
      ))),
    );
  }
}
