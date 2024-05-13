import 'package:flutter/material.dart';
import 'package:wastely/widgets/camera_card.dart';
import 'package:wastely/widgets/cards.dart';
import 'package:wastely/widgets/drawer.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
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
                CameraCard(),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CardWidget(
                    title: "Pending Complaints",
                    subtitle: "10",
                    color: Colors.redAccent),
                CardWidget(
                  title: "Resolved Complaints",
                  subtitle: "5",
                  color: Colors.green,
                ),
              ],
            ),
          ),
        ],
      )),
      drawer: const MyDrawer(),
    );
  }
}
