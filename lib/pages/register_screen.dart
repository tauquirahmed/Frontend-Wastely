import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wastely/pages/controller/register_controller.dart';
import 'package:wastely/widgets/gradient_button.dart';
import 'package:wastely/widgets/login_field.dart';
import 'package:wastely/widgets/password_field.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: RegisterController(),
      builder: (controller) => Scaffold(
          body: SingleChildScrollView(
              child: Center(
        child: Column(
          children: [
            Image.asset('assets/images/signin_balls.png'),
            const Text(
              'Register New Account',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 40,
              ),
            ),
            LoginField(
              hintText: 'First Name',
              controller: controller.firstNameController,
            ),
            const SizedBox(height: 15),
            LoginField(
              hintText: 'Last Name',
              controller: controller.lastNameController,
            ),
            const SizedBox(height: 15),
            LoginField(
              hintText: 'Username',
              controller: controller.usernameController,
            ),
            const SizedBox(height: 15),
            LoginField(
              hintText: 'Email',
              controller: controller.emailController,
            ),
            const SizedBox(height: 15),
            PasswordField(
              controller: controller.passwordController,
            ),
            const SizedBox(height: 15),
            GradientButton(
              name: 'Sign Up',
              onPressed: () {
                controller.register();
              },
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Already have an account? ',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey,
                    )),
                TextButton(
                    onPressed: () {
                      Get.toNamed('/login');
                    },
                    child: const Text(
                      'Log In',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    )),
              ],
            ),
          ],
        ),
      ))),
    );
  }
}
