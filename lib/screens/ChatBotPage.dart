import 'package:flutter/material.dart';
import 'dart:math'; // For random response selection

class ChatBotPage extends StatefulWidget {
  @override
  _ChatBotPageState createState() => _ChatBotPageState();
}

class _ChatBotPageState extends State<ChatBotPage> {
  final TextEditingController _controller = TextEditingController();
  final List<Map<String, String>> _messages = [];

  /// Mood responses for specific mood keywords.
  /// You can extend each list to include more responses.
  final Map<String, List<String>> moodResponses = {
    "sad": [
      "It's okay to feel sad. I'm here for you. 💖",
      "Sometimes tears speak what words cannot. 🌧️",
      "Even on the darkest days, stars still shine. ✨",
      "Take your time to heal. Sending you a warm hug. 🤗",
      "Rain clouds pass. Better days are ahead! 🌈",
      "You're stronger than you think. Keep going! 💪",
      "Allow yourself to feel and then let it go. 🤍",
      "I care about you. Your feelings matter. 💕",
      "Rest if you need to; you deserve self-care. 🌿",
      "I'm always here if you need to talk. 🤝",
      "Even in the darkest moments, remember that hope is just a heartbeat away 🌟",
"Your strength shines brightest when you're feeling low 💪",
"Every tear waters the seeds of a brighter tomorrow 🌱",
"Sometimes a quiet pause can lead to a peaceful rebirth 🕊️",
"Embrace your feelings; they pave the way to renewal 🌈,",
"Your journey matters, even when the road is tough 🛤️,",
"Hold on to the little sparks of hope in your heart ✨,",
"You deserve comfort and care in every moment 💖,",
"Let the warmth of your inner light guide you forward 🔥,",
"A gentle smile can break through the clouds ☀️,",
"Every storm eventually gives way to calm skies ⛅,",
"Your resilience is a quiet, powerful force 💫,",
"In the silence of sadness, find a whisper of strength 🎶,",
"You are not defined by your darkest days 🌜,",
"Every moment of sorrow is a step towards healing 💚,",
"The weight of sadness is lighter when shared with care 🤝,",
"Your tears can water the seeds of future joy 🌻,",
"Take one gentle step at a time; brighter days await 🚶‍♀️,",
"Even the night is filled with stars shining for you ⭐,",
"Let your heart heal slowly, like a rose blooming at dawn 🌹,",
"Embrace the quiet moments; they nurture your strength 🌿,",
"Every shadow is a reminder of the light waiting to return 💡,",
"Your inner courage is a beacon through the storm ⛵,",
"Allow yourself the grace to feel and heal 🕊️,",
"In every tear lies the promise of tomorrow's joy 🌅,",
"Your journey through sadness builds a resilient spirit 🌳,",
"The clouds will pass, revealing a radiant sky 🌞,",
"Your heart is a treasure of strength and hope 💎,",
"Every gentle breath brings you closer to peace 🍃,",
"Cherish your progress, no matter how small it may seem 🌼,",
"Let your soul rest and gather strength for a new dawn 🌄,",
"Your feelings are valid, and so is your hope 🌟,",
"Even in sorrow, there is a hidden spark of joy 🔥,",
"Every moment of sadness prepares you for a brighter future 🌈,",
"Hold onto hope; it's the light in the dark tunnel 🌟,",
"Your heart beats with the promise of renewal ❤️,",
"Sometimes the rain nourishes the most beautiful blooms 🌧️🌷,",
"Even a quiet moment holds the power of transformation 🌀,",
"You are a masterpiece in progress, painted with every emotion 🎨,",
"In your solitude, discover the strength to shine again ✨,",
"Your spirit is like the moon, ever-present even in darkness 🌙,",
"Every soft sigh paves the way for new beginnings 🌬️,",
"Within your sadness lies the seed of strength waiting to grow 🌱,",
"Your journey through gloom is a path to renewed light 🌞,",
"Even the smallest spark can ignite a fire of hope 🔥,",
"Every day offers a fresh start and a new burst of courage 🌄,",
"Your inner beauty glows brightest when you overcome darkness 🌟,",
"Allow the gentle rhythm of your heart to guide you forward 🎵,",
"In the quiet of despair, listen for the call of hope 📣,",
"Every moment of vulnerability holds the power to heal 🌿,",


      // ... add more 'sad' responses
    ],
    "happy": [
      "Yay! Keep that happiness alive! 😊",
      "Your smile lights up the world! 🌟",
      "Enjoy every step of your joyful journey! 💖",
      "Keep spreading those positive vibes! ✨",
      "Happiness looks amazing on you. Stay awesome! 😎",
      "Celebrate every little win today! 🎉",
      "Your energy is contagious—shine on! 🤩",
      "May your day be as bright as your smile! 😁",
      "Happiness is best when shared. Keep it up! 💞",
      "You're radiating pure joy! 💫",
      "You are radiating pure joy today! Keep it up! 😁",
"Your happiness is contagious! Spread it around! 😃",
"The world shines brighter with your smile! 🌟",
"Enjoy the little moments; they make life wonderful! 💖",
"Keep that positive energy flowing! 🎉",
"Your happiness inspires others—keep shining! ✨",
"Today is a great day, and you’re making it even better! ☀️",
"You deserve every bit of joy you’re feeling right now! 🥳",
"Life is full of beautiful surprises—stay open to them! 🎈",
"Happiness looks so good on you! 😊",
"Celebrate yourself today! You are amazing! 🎊",
"Your joy is a gift to the world! 🎁",
"Keep riding this wave of happiness! 🌊",
"The energy you bring is so uplifting! 🌞",
"You make happiness look effortless! 💃",
"Let your laughter fill the air! 🤣",
"Smiles suit you—wear them often! 😆",
"Today is a day to cherish every happy moment! 🎶",
"Your joy is magnetic—everyone feels it! 💫",
"Keep that positive mindset—it’s working wonders! 🌼",
"The best things in life are the moments like this! 💖",
"You’re glowing with positivity! ✨",
"May your happiness multiply today! 💕",
"Keep that carefree spirit—it’s refreshing! 🌿",
"Every joyful moment adds to your story—enjoy them! 📖",
"Let happiness be your default mode today! 😄",
"Smiling is your superpower! 🦸",
"Your energy is making today brighter! ☀️",
"The world needs more of your joy—keep sharing it! 🌍",
"Enjoy today to the fullest—you deserve it! 🎉",
"Life is a celebration—dance through it! 💃",
"Your enthusiasm is inspiring! 🙌",
"Embrace all the goodness coming your way! 🥰",
"You bring so much light into this world! 🔥",
"Your positive vibes are felt everywhere! ✨",
"Joy is your natural state—stay in it! 🌈",
"Keep finding reasons to smile! 😊",
"Your presence alone brightens any space! 💡",
"Let your heart be as light as a feather today! 🕊️",
"You’re proof that happiness is a choice! 🌸",
"Enjoy the ride of life—it’s a fun one! 🎢",
"Let today be full of delightful surprises! 🎁",
"The sun shines brighter when you’re happy! ☀️",
"Stay excited about life—there’s so much to love! 💖",
"Your happiness is a reflection of your beautiful soul! 😍",
"Spread that happiness like confetti! 🎊",
"Smile big, laugh loud, and love freely! ❤️",
"You deserve to feel this happy every day! 🌟",
"Every joyful moment you experience is a victory! 🏆",
      // ... add more 'happy' responses
    ],
    "anxious": [
      "Breathe deeply; you're safe. 🌿",
      "One step at a time—you are strong. 💪",
      "Focus on the present moment. 🚶‍♀️",
      "It's okay to feel anxious. Take a deep breath. 🤍",
      "Try grounding exercises; name 5 things you see. 🌳",
      "Pause, relax, and know that this too shall pass. 🌈",
      "Let’s take a moment of calm together. 🧘",
      "You're capable of handling this. Trust yourself. 💡",
      "Sometimes a short walk can help clear your mind. 🚶",
      "Remember: you're more than your anxious thoughts. 💖",
      "Your brain is acting like a tab hoarder—close some thoughts. 🖥️",
"Deep breath in… deep breath out… repeat till your brain stops glitching. 🌬️",
"Overthinking is like bad WiFi—disconnect and reconnect. 🔄",
"Your thoughts are running a marathon, but you don’t have to keep up. 🏃‍♂️",
"Your mind is in ‘what if’ mode, but reality is chill. 🛑",
"Anxiety is just your brain trying to protect you… aggressively. 🏋️‍♀️",
"You’re not in danger, your brain just needs a nap. 😴",
"Everything feels like a crisis when you're tired—get some rest. 🛏️",
"Let’s be real, 90% of what you’re stressing over won’t matter in a week. ⏳",
"Your brain: 🏎️ Your body: 🚶‍♂️ Take a second to sync up. 💭",
"If your thoughts had a mute button, now would be a great time to use it. 🔇",
"Reminder: You don’t have to solve every problem right this second. ⏸️",
"You are not behind in life, you’re just on your own timeline. 🏁",
"Your intrusive thoughts are just pop-up ads—close them. ❌",
"Anxiety is a liar, don’t believe everything it tells you. 🚫",
"Your heart is racing, but you’re not in the Olympics—chill. 🏅",
"Is this a real problem or just a brain-made-up crisis? 🤔",
"You wouldn’t let your worst enemy talk to you like this, so don’t let your brain either. 🧠💀",
"If your brain is gonna make up worst-case scenarios, make it imagine best-case ones too. 🌈",
"You are not ‘too much,’ your thoughts are just being dramatic. 🎭",
"Overthinking is like binge-watching a bad show—turn it off. 📺",
"One thing at a time. No need to speedrun life. 🎮",
"Your feelings are valid, but they don’t always tell the truth. 🗣️",
"Fear and excitement feel the same—maybe you’re just hyped? ⚡",
"You don’t have to respond to every thought—leave some on ‘read.’ 📵",
"Perfection is fake, but peace is real. Choose peace. ☁️",
"Not every thought deserves your energy. Save some for yourself. 🔋",
"You are still safe, even if your brain is acting like you’re not. 🛡️",
"Your brain is a drama queen, and you do NOT have to engage. 👑",
"You wouldn’t trust a malfunctioning GPS, so why trust an anxious mind? 🗺️",
"Stress is just your body trying to protect you—thank it and move on. ❤️",
"Anxiety is loud, but your calm is stronger. 🕊️",
"Bestie, you’re overthinking again. Drink some water and log off. 💧",
"Being anxious doesn’t mean something bad is coming. It’s just a feeling. 🌀",
"Your worth is not measured by how productive or perfect you are. 🎯",
"It’s okay to pause. You don’t have to be ‘on’ all the time. ⏸️",
"You don’t need to have all the answers right now. Trust the process. 🔄",
"Take the pressure off yourself. You’re already enough. 🌻",
"Your thoughts are fast, but your reality is calm. Match the energy. 🏖️",
"You’re not behind. You’re exactly where you need to be. 🌍",
"Imagine your anxiety as a TV show—hit ‘skip intro’ on the overthinking. 📼",
"You are not weak for feeling anxious. You are human. ❤️",
"This moment will pass, just like every anxious moment before. 🕰️",
"Not everything needs an immediate answer. Let things unfold. 🎭",
"If you’re feeling anxious, you’re probably just too in your head. Get out of it. 🚶",
"Close your eyes, unclench your jaw, and take a real breath. 🛑",
"Feeling overwhelmed? Step outside, touch some grass, and reset. 🌱",
"Your future self will look back at this and be proud of how you handled it. 🌅",
"You are safe. You are strong. You are gonna be okay. 💪",
      // ... add more 'anxious' responses
    ],
    "angry": [
      "Let go of anger—peace is within your reach. 🕊️",
      "Take a deep breath and try to calm down. 🌬️",
      "Channel your energy into something creative. 🎨",
      "It's okay to feel angry; just don’t let it rule you. 💛",
      "Sometimes writing down your feelings helps. ✍️",
      "Anger is temporary; calmness will return. ✨",
      "Count slowly to ten and feel the tension ease. 🔢",
      "Focus on solutions instead of the problem. 🔧",
      "A brief break might help you regain balance. ☕",
      "Your peace is more important than your anger. 💙",
      "Okay but like… deep breaths before you throw hands. 🥊",
"You’re one WiFi lag away from snapping, huh? 😤",
"Take a walk before you text something wild. 🚶‍♂️",
"Don’t let people who don’t matter ruin your vibe. 🚫",
"Remember: You control the reaction, not the situation. 🎛️",
"Punch a pillow, not your phone. 🛏️",
"Is it worth your peace? If not, let it go. 🕊️",
"Sometimes the best clapback is silence. 🔇",
"Your peace is too expensive to give away for free. 💰",
"Channel that anger into leveling up, not lashing out. 📈",
      // ... add more 'angry' responses
    ],
    "excited": [
      "Your excitement is contagious—enjoy every moment! 🚀",
      "Embrace that energy; something great is coming! 🌟",
      "Celebrate your passion; it's one of your superpowers! 💥",
      "Keep riding that wave of excitement! 🎉",
      "Your energy is pure magic—spread the joy! 😊",
      "Anticipation makes life thrilling. Keep dreaming big! ✨",
      "Every moment is a new opportunity—seize it! 🌈",
      "You're on fire! Shine bright and inspire others. 🔥",
      "Let your excitement light up your day! 💫",
      "Stay pumped and enjoy the ride! 💯",
      // ... add more 'excited' responses
    ],
    "neutral": [
      "It's okay to feel neutral; sometimes calm is all you need. ☁️",
      "Embrace the stillness; it's a space for growth. 🌱",
      "A quiet moment can lead to great insights. 🧘",
      "Balance is key. Enjoy the peace around you. ⚖️",
      "Take this time to rest and recharge. 🌸",
      "Neutrality can be refreshing—enjoy the pause. ⏸️",
      "Being in a calm state is a gift. Cherish it. 🤍",
      "Sometimes, simple quiet is all we need. 🌿",
      "A balanced mood is a sign of inner strength. 💪",
      "Relax and savor the calm. ☀️",
      "You’re just existing today, and honestly, same. 😌",
"Not sad, not hyped, just here. That’s valid. ✅",
"Vibing at a solid 5/10 today. No complaints. 😴",
"Low energy but still iconic. 💅",
"You don’t always have to be DOING something. Just chill. 🛋️",
"Floating through the day like a Sim on autopilot. 🎮",
"No big emotions, just mild vibes. 🌊",
"Blank stare, zero thoughts, but still slaying. 😶‍🌫️",
"Neutral is just pre-happy. Give it time. ⏳",
"Existing is enough. You don’t have to be 100% all the time. 💖",
"Lowkey just vibing today. 😌",
"Not mad, not hyped, just existing. 🏝️",
"Today’s mood? Meh, but in a peaceful way. 🌿",
"No strong opinions today, just vibes. 🌊",
"Brain is on airplane mode. ✈️",
"Just coasting through the day like an NPC. 🎮",
"Energy level: 50%, vibes intact. ⚖️",
"Feeling neutral is underrated. Let’s normalize it. 🤍",
"Not every day needs to be a high-energy day. 😴",
"Sometimes just chilling is the best plan. 🍵",
      // ... add more 'neutral' responses
    ],
  };

  /// General conversation responses for basic greetings and common chat.
  final List<String> generalResponses = [
    "Hi there! How can I help you today? 😊",
    "Hello, friend! What's on your mind? 💬",
    "Hey! I'm here for you—tell me what's up. 🤗",
    "Greetings! How are you doing today? 🌟",
    "Hi! Let's chat—I’m all ears. 💖",
    "Hey there! I'm happy to talk with you. 😄",
    "What's going on? I'm here if you need to talk. 💬",
    "Good to see you! How's your day going? 😊",
    "Hello! I'm here to listen and support you. 🤝",
    "Hey! Tell me more, I'm all yours. 💕",
        "Hey, what's up fam? 😎",
    "Yo, how's it going? 🤙",
    "Sup, friend! Let's vibe. ✨",
    "Hey, how are you feeling today? 🌈",
    "Yo, you got this, no cap! 💯",
    "What's good? I'm here to chat! 💬",
    "Hey there, let's spill some tea! 🍵",
    "Wassup? Keep it 100, I'm all ears. 🗣️",
    "Yo, you're lit today! Keep shining. 🔥",
    "Hey, don't stress, everything's gonna be chill. ❄️",
    "Hey, I'm here if you need to vent. 👐",
    "Yo, how's your day been so far? ☀️",
    "Sup, feeling extra today? Let’s chat! 😜",
    "Hey, what's the vibe? Let's catch up. 🎧",
    "Yo, spill the tea, I'm ready! 🍹",
    "Hey, you're awesome, don't forget that! 🌟",
    "Sup, how's life treating you? 🤩",
    "Hey, just vibing here—what about you? 😌",
    "Yo, keep it real, I'm all ears. 👂",
    "Hey, sending good vibes your way! ✨",
    "Sup, ready for some chill convos? 🧊",
    "Hey, hope you're slaying the day! 👑",
    "Yo, let's get into it. What's poppin'? 🎉",
    "Hey, I'm here to listen, fam. 💖",
    "Sup, how you doin'? Let's chat it out. 😊",
    "Hey, feeling those good vibes? Let's talk! 🌞",
    "Yo, your energy is on point today! ⚡",
    "Hey, what’s the mood? Let's vibe together. 🎶",
    "Sup, drop a line, let's kick it. 🏄‍♀️",
    "Hey, you’re a real one, always keep it real! 💯",
    "Yo, how’s the day treating you? Keep shining! 🌟",
    "Hey, let's chat about what's on your mind. 🤔",
    "Sup, you're amazing—never forget that! 🥰",
    "Hey, sending you some digital love! 💌",
    "Yo, what's the latest? I'm here for you! 📣",
    "Hey, hope you're vibing and thriving today! 🌱",
    "Sup, let's catch up and keep it chill. ❄️",
    "Hey, you got the juice—keep that energy up! 🔋",
    "Yo, I'm here to chat whenever you need! ⏰",
    "Hey, what's the scoop? Spill it all! 🥄",
    "Sup, you're on fleek today—let's talk! 💅",
    "Hey, let's have a real talk. I'm all ears! 🎧",
    "Yo, how are you really doing? Let's get into it. 🔍",
    "Hey, thanks for stopping by—what's new with you? ✌️",
    "Sup, you're a vibe! Let's connect. 🌊",
    "Hey, keep that head high and spirit lit! 🔥",
    "Yo, how's it going? Ready to chat? 📱",
    "Hey, I'm here to listen, no judgment. 🕊️",
    "Sup, let's turn those good vibes up! 🎚️",
    "Hey, you're a legend—let's share some laughs! 😂"


    // ... add more general conversation responses
  ];

  /// Sends the user's message and appends a bot response.
  void sendMessage() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        _messages.add({"user": _controller.text});
        _messages.add({"bot": getBotResponse(_controller.text)});
      });
      _controller.clear();
    }
  }

  /// Determines the appropriate bot response based on keywords in the user's message.
  String getBotResponse(String userMessage) {
    String lowerMessage = userMessage.toLowerCase();

    // Mood-specific responses:
    if (lowerMessage.contains("sad,feeling down,unhappy,down,hate,lost")) return getRandomResponse("sad");
    if (lowerMessage.contains("happy,cool,good,wholesome,day,cool")) return getRandomResponse("happy");
    if (lowerMessage.contains("anxious")) return getRandomResponse("anxious");
    if (lowerMessage.contains("angry,mad")) return getRandomResponse("angry");
    if (lowerMessage.contains("excited,thrilled,goog")) return getRandomResponse("excited");
    if (lowerMessage.contains("neutral,nothing")) return getRandomResponse("neutral");

    // Basic conversation: greetings
    if (lowerMessage.contains("hi") ||
        lowerMessage.contains("hello") ||
        lowerMessage.contains("hey")) {
      return getRandomGeneralResponse();
    }
    // How are you type queries
    if (lowerMessage.contains("how are you")) {
      return "I'm just a friendly bot, but I'm here to listen and help however I can! 😊";
    }
    // What’s up queries
    if (lowerMessage.contains("what's up") ||
        lowerMessage.contains("whats up") ||
        lowerMessage.contains("sup")) {
      return "Not much! I'm here to chat and keep you company. How about you? 💬";
    }
    // Default general response if no keyword is matched.
    return getRandomGeneralResponse();
  }

  /// Returns a random response for the given mood.
  String getRandomResponse(String mood) {
    final random = Random();
    List<String> responses = moodResponses[mood]!;
    return responses[random.nextInt(responses.length)];
  }

  /// Returns a random general conversation response.
  String getRandomGeneralResponse() {
    final random = Random();
    return generalResponses[random.nextInt(generalResponses.length)];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AI Chatbot"),
        centerTitle: true,
        backgroundColor: Colors.pink.shade400,
      ),
      backgroundColor: Colors.pink.shade50,
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                String sender = _messages[index].keys.first;
                String message = _messages[index][sender]!;
                bool isUser = sender == "user";
                return Align(
                  alignment:
                      isUser ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: isUser ? Colors.pink.shade300 : Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.shade300, blurRadius: 5)
                      ],
                    ),
                    child: Text(
                      message,
                      style: TextStyle(
                        fontSize: 16,
                        color: isUser ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(12),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: "Type a message...",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send, color: Colors.pink),
                  onPressed: sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
