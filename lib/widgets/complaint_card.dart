import 'package:flutter/material.dart';

class ComplaintCard extends StatelessWidget {
  final String location;
  final String description;
  final String date;
  bool pending;

  ComplaintCard({
    super.key,
    required this.location,
    required this.description,
    required this.date,
    required this.pending,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        elevation: 5,
        color: (pending) ? Colors.amberAccent : Colors.green,
        child: Container(
          width: MediaQuery.of(context).size.width * 0.98,
          child: Column(
            children: [
              ListTile(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.location_on, color: Colors.redAccent),
                    Text(
                      location,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        description,
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.black87,
                        ),
                      ),
                      Text(
                        'Date: ' + date,
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.black87,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
