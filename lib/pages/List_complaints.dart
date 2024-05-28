import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:wastely/constants/constants.dart';
import 'package:wastely/pages/controller/dashboard_controller.dart';
import 'package:wastely/pages/dashboard.dart';
import 'package:wastely/widgets/complaint_card.dart';

class ListComplaints extends StatefulWidget {
  const ListComplaints({super.key});

  @override
  State<ListComplaints> createState() => _ListComplaintsState();
}

class _ListComplaintsState extends State<ListComplaints> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: DashboardController(),
      builder: (controller) => Scaffold(
          appBar: AppBar(
            title: const Text('Complaints'),
          ),
          body: Column(
            children: [
              for (int i = 0;
                  i < controller.all_complaint.complaints!.length;
                  i++)
                Column(
                  children: [
                    const SizedBox(height: 10),
                    ComplaintCard(
                      location:
                          controller.all_complaint.complaints![i].location!,
                      description:
                          controller.all_complaint.complaints![i].description!,
                      date: DateFormat('d MMMM y').format(
                        DateTime.parse(controller
                            .all_complaint.complaints![i].createdAt!
                            .toString()),
                      ),
                      pending: controller.all_complaint.complaints![i].status ==
                              'Pending'
                          ? true
                          : false,
                    ),
                    const SizedBox(height: 10),
                  ],
                )
            ],
          )),
    );
  }
}
