import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mentalhealth/main.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final List<String> quotes = [
    "You are stronger than you think!",
    "Believe in yourself and all that you are!",
    "You are capable of amazing things!",
    "Embrace your beauty and confidence!",
    "You light up the world with your smile!",
    "Self-care is not selfish.",
    "Your emotions are valid.",
    "You are loved, just as you are.",
    "Progress, not perfection.",
    "You deserve happiness.",
    "Your mental health matters.",
    "Take deep breaths and trust yourself.",
    "You are resilient and brave.",
    "Each day is a new beginning.",
    "Happiness starts with you.",
    "It’s okay to take a break.",
    "Love yourself unconditionally.",
    "Your feelings are important.",
    "Let go of what you can't control.",
    "One step at a time.",
    "Keep going, you are doing great!",
    "Your journey is unique and valuable.",
    "Take care of your mind and body.",
    "Believe in your potential.",
    "Rest is productive too.",
    "Your well-being comes first.",
    "Every storm runs out of rain.",
    "Choose kindness, especially for yourself.",
    "Give yourself grace.",
    "You are worthy of love and peace.",
    "Small progress is still progress.",
    "You are enough, exactly as you are.",
    "You don’t have to be perfect.",
    "Healing takes time, and that’s okay.",
    "Your thoughts don’t define you.",
    "Be gentle with yourself today.",
    "Keep shining, the world needs your light.",
    "You are not alone in this journey.",
    "Your inner strength is inspiring.",
    "Your feelings are valid, always.",
    "It's okay to not be okay.",
    "Breathe, and take things one step at a time.",
    "Trust yourself, you are doing great.",
    "Your mind deserves rest too.",
    "Be proud of how far you’ve come.",
    "You are brave for facing each day.",
    "Your kindness makes the world brighter.",
    "There is hope in every new day.",
    "You have so much to offer the world.",
    "Take care of your heart and soul."
  ];

  @override
  void initState() {
    Timer(Duration(seconds: 5), (){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> AuthWrapper()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final String randomQuote = quotes[Random().nextInt(quotes.length)];

    return Scaffold(
      backgroundColor: Colors.pink.shade200,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'HI',
              style: TextStyle(
                fontSize: 60,
                fontWeight: FontWeight.bold,
                fontFamily: 'Pacifico',
                color: Colors.white,
                shadows: [
                  Shadow(
                      blurRadius: 10,
                      color: Colors.pink.shade700,
                      offset: Offset(2, 2))
                ],
              ),
            ),
            SizedBox(height: 10),
            Text(
              randomQuote,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                fontFamily: 'DancingScript',
                color: Colors.white,
              ),
            ),
            SizedBox(height: 20),
            Icon(Icons.favorite, color: Colors.white, size: 40),
            SizedBox(height: 40),
            
          ],
        ),
      ),
    );
  }
}
