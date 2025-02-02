import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MeditationPage extends StatelessWidget {
  // List of YouTube video URLs and their thumbnails
  final List<Map<String, String>> meditationVideos = [
    {
      "title": "Guided Meditation for Relaxation",
      "url": "https://youtu.be/V3XRSul5dRc?si=VTORD4OljbDzLPXd"
    },
    {
      "title": "Morning Meditation to Start Your Day",

      "url": "https://youtu.be/YD5W5eZy90c?si=8pCSeR-4PT9YDaux"
    },
    {
      "title": "Deep Sleep Meditation",
      
      "url": "https://youtu.be/lu_cLaBTXio?si=Hepwe1VocRSTtNPx"
    },
    {
      "title": "Guided Meditation for Stress Relief",
      
      "url": "https://youtu.be/X4WjbW6amQw?si=L6hDyPS5KDAs9Cqb"
    },
    {
      "title": "Mindfulness Meditation for Anxiety",
      
      "url": "https://youtu.be/v-w-vSvi-24?si=zF7_JjXb_5Vn1Ijz"
    },
    {
      "title": "30 Minute Guided Meditation",
      
      "url": "https://youtu.be/I7h2H16nvYQ?si=SabQyOxEpN7XBA9c"
    },
    {
      "title": "Meditation for Self-Love",
      
      "url": "https://youtu.be/itZMM5gCboo?si=Z63Muu9P74u2Djlr"
    },
    {
      "title": "Meditation for Positive Energy",
      "thumbnail": "https://youtu.be/j734gLbQFbU?si=LVCBDV9k1SpqlUhJ",
      "url": ""
    },
    {
      "title": "Healing Meditation for the Soul",
      "thumbnail": "https://img.youtube.com/vi/9SHk9nKZJzE/0.jpg",
      "url": "https://youtu.be/MuCUzaqmbFc?si=Sue9nBXDVW7A2ZST"
    },
    {
      "title": "Evening Meditation to Unwind",
      "thumbnail": "https://img.youtube.com/vi/VkhL99iVDbk/0.jpg",
      "url": "https://youtu.be/KTkwOrhx3Lc?si=e41x4rcLGNt-JwMX"
    }
  ];

  // Function to launch the YouTube video URL
  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Meditation Videos"),
        backgroundColor: Colors.pink.shade400,
      ),
      body: ListView.builder(
        itemCount: meditationVideos.length,
        itemBuilder: (context, index) {
          final video = meditationVideos[index];
          return Card(
            margin: EdgeInsets.all(10),
            elevation: 5,
            child: ListTile(
              title: Text(video["title"]!),
              trailing: Icon(Icons.play_arrow, color: Colors.pink),
              onTap: () => _launchURL(video["url"]!),
            ),
          );
        },
      ),
    );
  }
}
