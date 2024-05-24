import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wastely/pages/controller/password_controller.dart';
import 'package:wastely/palletes/pallets.dart';

class PasswordField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  const PasswordField({
    super.key,
    this.hintText = 'Password',
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: PasswordController(),
      builder: (con) => Obx(
        () => ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 370),
          child: TextFormField(
            controller: controller,
            obscureText: con.isVisible.value,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(27),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Pallete.borderColor,
                  width: 3,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Pallete.borderColor,
                  width: 3,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              hintText: hintText,
              suffixIcon: IconButton(
                icon: Icon(
                  con.isVisible.value ? Icons.visibility_off : Icons.visibility,
                  color: Pallete.borderColor,
                ),
                onPressed: () {
                  con.toggleVisibility();
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
