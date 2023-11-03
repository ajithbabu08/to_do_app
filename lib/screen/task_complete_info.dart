
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
        backgroundColor: Colors.yellow.shade200,
        title: const  Center(
            child: Text('Task Details')),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Container(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Title: $title',
                  style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
                ),
              const  SizedBox(height: 10),
                Text('Description: $description',style: TextStyle(fontSize: 18),),
                // Add more details or formatting as needed
              ],
            ),
        ),
      ),
    );
  }
}
