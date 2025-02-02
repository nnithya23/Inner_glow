import 'package:flutter/material.dart';
import 'dart:math';  // For random quotes
import 'ChatBotPage.dart'; // Import the chatbot page

class MoodPage extends StatefulWidget {
  @override
  _MoodPageState createState() => _MoodPageState();
}

class _MoodPageState extends State<MoodPage> {
  String _mood = '';
  String _emoji = '';
  String _quote = '';

  // List of moods and corresponding emojis and multiple quotes
  final Map<String, Map<String, List<String>>> moodData = {
    'Sad': {
      'emoji': ['😞'],
      'quotes': [
        '“It’s okay to not be okay. Better days are ahead.”',
        '“Tears are a sign of strength. You’re healing.”',
        '“The darkest hour is just before dawn. Hang in there.”'
      ],
    },
    'Happy': {
      'emoji': ['😊'],
      'quotes': [
        '“Happiness is a choice. You deserve it!”',
        '“You’re doing great, keep smiling!”',
        '“Stay positive, stay happy!”'
      ],
    },
    'Angry': {
      'emoji': ['😡'],
      'quotes': [
        '“Take a deep breath, calm down, and rise above it.”',
        '“Let go of anger, embrace peace.”',
        '“You’re stronger than the anger you feel.”'
      ],
    },
    'Excited': {
      'emoji': ['🤩'],
      'quotes': [
        '“Let your enthusiasm shine. The world is waiting for you!”',
        '“The best things are yet to come. Keep going!”',
        '“Excitement is the first step to success!”'
      ],
    },
    'Anxious': {
      'emoji': ['😟'],
      'quotes': [
        '“Take one step at a time. You’re stronger than you think.”',
        '“Breathe deeply, you’ve got this.”',
        '“It’s okay to feel anxious. Just don’t give up.”'
      ],
    },
    'Neutral': {
      'emoji': ['😐'],
      'quotes': [
        '“It’s okay to feel neutral. Sometimes peace is the best state.”',
        '“Embrace the calm. You’re in control.”',
        '“Take it easy, everything will work out.”'
      ],
    },
  };

  // Function to select a random quote
  String getRandomQuote(String mood) {
    final random = Random();
    List<String> quotes = moodData[mood]!['quotes']!;
    return quotes[random.nextInt(quotes.length)];
  }

  // Function to update mood, emoji, and quote
  void updateMood(String mood) {
    setState(() {
      _mood = mood;
      _emoji = moodData[mood]!['emoji']![0];  // Get the emoji
      _quote = getRandomQuote(mood);  // Get a random quote
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mood Tracker', style: TextStyle(fontFamily: 'Pacifico')),
        backgroundColor: Colors.pink.shade400,
        centerTitle: true,
      ),
      backgroundColor: Colors.pink.shade50,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Heading
            Text(
              'How are you feeling today?',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                fontFamily: 'Lobster',
                color: Colors.pink.shade800,
              ),
            ),
            SizedBox(height: 30),

            // Mood buttons in a GridView layout with two boxes per row
            GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              shrinkWrap: true,
              childAspectRatio: 2 / 1, // Adjusted ratio to make boxes smaller
              children: moodData.keys.map((mood) {
                return GestureDetector(
                  onTap: () => updateMood(mood),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.pink.shade300,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(
                        mood,
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'Lobster',
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
            SizedBox(height: 40),

            // Display selected mood emoji and quote
            if (_mood.isNotEmpty)
              Column(
                children: [
                  Text(
                    _emoji,
                    style: TextStyle(
                      fontSize: 80,
                    ),
                  ),
                  SizedBox(height: 20),
                  // Display the quote
                  Text(
                    _quote,
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'DancingScript',
                      fontStyle: FontStyle.italic,
                      color: Colors.pink.shade600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),

            SizedBox(height: 30),

            // Chat with AI Button
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => ChatBotPage()));
              },
              icon: Icon(Icons.chat),
              label: Text("Chat with AI 💬", style: TextStyle(fontSize: 18)),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                backgroundColor: Colors.pink.shade400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
