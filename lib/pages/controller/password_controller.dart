import 'package:get/get.dart';

class PasswordController extends GetxController {
  final isVisible = true.obs;
  void toggleVisibility() {
    isVisible.value = !isVisible.value;
  }
}
