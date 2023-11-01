import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TaskDetailPage extends StatelessWidget {
  final String title;
  final String description;

  TaskDetailPage({
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Task Details'),
      ),
      body: Column(
        children: [
          Text(
            'Title: $title',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text('Description: $description'),
          // Add more details or formatting as needed
        ],
      ),
    );
  }
}
