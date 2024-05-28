import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wastely/palletes/pallets.dart';
import 'package:wastely/storage/box.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Pallete.borderColor,
      child: Column(
        children: [
          DrawerHeader(
            child: Icon(
              Icons.account_circle,
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('H O M E'),
            onTap: () {
              Get.toNamed('/dashboard');
            },
          ),
          ListTile(
            leading: Icon(Icons.dashboard),
            title: Text('C O M P L A I N T S'),
            onTap: () {
              Get.toNamed('/list_complaint_screen');
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('S E T T I N G S'),
            onTap: null,
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('L O G O U T'),
            onTap: () {
              box.remove('uid');
              Get.offAllNamed('/login');
            },
          ),
        ],
      ),
    );
  }
}
