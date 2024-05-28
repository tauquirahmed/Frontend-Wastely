import 'package:flutter/material.dart';

class ListComplaints extends StatefulWidget {
  const ListComplaints({super.key});

  @override
  State<ListComplaints> createState() => _ListComplaintsState();
}

class _ListComplaintsState extends State<ListComplaints> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Complaints'),
      ),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Complaint $index'),
            subtitle: Text('Description of complaint $index'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Navigate to complaint details screen
            },
          );
        },
      ),
    );
  }
}
