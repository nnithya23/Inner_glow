import 'package:flutter/material.dart';

class Profilepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink.shade50,
      appBar: AppBar(
        title: Text("Profile Details"),
        backgroundColor: Colors.pink.shade400,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.pink.shade200,
              child: Icon(Icons.person, color: Colors.white, size: 50),
            ),
            SizedBox(height: 20),
            Text("Name: Jane Doe", style: TextStyle(fontSize: 20)),
            SizedBox(height: 10),
            Text("Email: jane.doe@example.com", style: TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }
}
