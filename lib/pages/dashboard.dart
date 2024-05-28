import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wastely/constants/constants.dart';
import 'package:wastely/pages/controller/dashboard_controller.dart';
import 'package:wastely/urls/urls.dart';
import 'package:wastely/widgets/camera_card.dart';
import 'package:wastely/widgets/cards.dart';
import 'package:wastely/widgets/drawer.dart';
import 'package:wastely/widgets/register_complaint_card.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: DashboardController(),
        builder: (controller) => Obx(
              () => !controller.isReady.value
                  ? Container(
                      child: Center(child: CircularProgressIndicator()),
                    )
                  : Scaffold(
                      appBar: AppBar(
                        title: Text(
                            "Hello " + controller.user.firstName.toString()),
                      ),
                      body: Center(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                RegisterComplaintCard(),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                CardWidget(
                                    title: "Pending Complaints",
                                    subtitle: controller
                                        .pending_complaint.complaints!.length
                                        .toString(),
                                    color: Colors.redAccent),
                                CardWidget(
                                  title: "Resolved Complaints",
                                  subtitle: controller
                                      .resolved_complaint.complaints!.length
                                      .toString(),
                                  color: Colors.green,
                                ),
                              ],
                            ),
                          ),
                        ],
                      )),
                      drawer: const MyDrawer(),
                    ),
            ));
  }
}
