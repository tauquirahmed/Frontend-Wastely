import 'package:get/get.dart';
import 'package:wastely/constants/constants.dart';
import 'package:wastely/models/complaint.dart';
import 'package:wastely/models/user.dart';
import 'package:wastely/storage/box.dart';
import 'package:wastely/urls/urls.dart';

class DashboardController extends GetxController {
  RxBool isReady = false.obs;
  userModel user = userModel();
  complaintModel pending_complaint = complaintModel();
  complaintModel resolved_complaint = complaintModel();
  complaintModel all_complaint = complaintModel();

  Future<void> getProfile() async {
    try {
      dynamic uid = box.read('uid');
      if (uid == null) {
        Get.offAllNamed('/login');
      } else {
        final response = await dio.get(profileUrl, queryParameters: {
          "uid": uid,
        });
        final pending_response = await dio.get(complaintUrl, queryParameters: {
          "CurrentStatus": "pending",
          "uid": uid,
        });
        final resolved_response = await dio.get(complaintUrl, queryParameters: {
          "CurrentStatus": "resolved",
          "uid": uid,
        });
        final all_response = await dio.get(complaintUrl, queryParameters: {
          "uid": uid,
        });
        if (response.statusCode == 200 &&
            pending_response.statusCode == 200 &&
            resolved_response.statusCode == 200) {
          user = userModel.fromJson(response.data);
          pending_complaint = complaintModel.fromJson(pending_response.data);
          resolved_complaint = complaintModel.fromJson(resolved_response.data);
          all_complaint = complaintModel.fromJson(all_response.data);
          isReady.value = true;
        }
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
