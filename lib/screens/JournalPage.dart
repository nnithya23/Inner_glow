import 'package:flutter/material.dart';
import 'package:mentalhealth/services/firebase_services.dart';

class JournalPage extends StatefulWidget {
  @override
  _JournalPageState createState() => _JournalPageState();
}

class _JournalPageState extends State<JournalPage> {
  FirestoreServices fs = FirestoreServices();
  final TextEditingController _morningController = TextEditingController();
  final TextEditingController _eveningController = TextEditingController();
  final TextEditingController _journalController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "My Journal",
          style: TextStyle(fontFamily: 'Pacifico'),
        ),
        centerTitle: true,
        backgroundColor: Colors.pink.shade400,
      ),
      backgroundColor: Colors.pink.shade50,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // **Morning Highlight Box**
            Text(
              "🌅 Morning Highlight",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'Lobster',
                color: Colors.pink.shade700,
              ),
            ),
            SizedBox(height: 8),
            _buildTextBox(
                _morningController, "What made you smile this morning?"),

            SizedBox(height: 20),

            // **Evening Reflection Box**
            Text(
              "🌙 Evening Reflection",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'Lobster',
                color: Colors.pink.shade700,
              ),
            ),
            SizedBox(height: 8),
            _buildTextBox(_eveningController, "A beautiful moment from today?"),

            SizedBox(height: 20),

            // **Main Journal Entry Box**
            Text(
              "📖 Journal Entry",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                fontFamily: 'DancingScript',
                color: Colors.pink.shade800,
              ),
            ),
            SizedBox(height: 8),
            Expanded(
              child: _buildBigTextBox(
                  _journalController, "Write your thoughts here..."),
            ),

            SizedBox(height: 10),

            // **Save Button**
            Center(
              child: ElevatedButton(
                onPressed: () {
                  if (_morningController.text.isNotEmpty &&
                      _eveningController.text.isNotEmpty &&
                      _journalController.text.isNotEmpty) {
                    fs.addDate(_morningController.text, _eveningController.text,
                        _journalController.text, DateTime.now());
                  }

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Journal saved successfully!"),
                      backgroundColor: Colors.pink.shade300,
                    ),
                  );
                },
                child: Text("Save ✨",
                    style: TextStyle(fontSize: 18, color: Colors.white)),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                  backgroundColor: Colors.pink.shade400,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // **Method to build small text boxes**
  Widget _buildTextBox(TextEditingController controller, String hint) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.pink.shade100,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide.none),
          hintText: hint,
          hintStyle: TextStyle(
              color: Colors.grey.shade500,
              fontSize: 16,
              fontFamily: 'DancingScript'),
        ),
      ),
    );
  }

  // **Method to build a large text box for journaling**
  Widget _buildBigTextBox(TextEditingController controller, String hint) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.pink.shade100,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: TextField(
        controller: controller,
        maxLines: null,
        keyboardType: TextInputType.multiline,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(15),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide.none),
          hintText: hint,
          hintStyle: TextStyle(
              color: Colors.grey.shade500,
              fontSize: 16,
              fontFamily: 'DancingScript'),
        ),
      ),
    );
  }
}
