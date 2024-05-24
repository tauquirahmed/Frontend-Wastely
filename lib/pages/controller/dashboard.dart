import 'package:get/get.dart';
import 'package:wastely/constants/constants.dart';
import 'package:wastely/models/complaint.dart';
import 'package:wastely/models/user.dart';
import 'package:wastely/urls/urls.dart';

class DashboardController extends GetxController {
  RxBool isReady = false.obs;
  userModel user = userModel();
  complaintModel complaint = complaintModel();

  Future<void> getProfile() async {
    try {
      final response = await dio.get(profileUrl);
      final complaint_response = await dio.get(complaintUrl, queryParameters: {
        "CurrentStatus": "pending",
      });

      if (response.statusCode == 200 && complaint_response.statusCode == 200) {
        user = userModel.fromJson(response.data);
        complaint = complaintModel.fromJson(complaint_response.data);
        isReady.value = true;
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void onInit() {
    super.onInit();
    getProfile();
  }
}
