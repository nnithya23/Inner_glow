import 'package:flutter/material.dart';
import 'package:mentalhealth/services/firebase_auth_service.dart';
import 'package:table_calendar/table_calendar.dart'; // Ensure this file exists
import 'MoodPage.dart';
import 'PeriodTrackerPage.dart'; // Ensure this file exists
import 'MeditationPage.dart'; // Ensure this file exists
import 'JournalPage.dart'; // Ensure this file exists

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

CalendarFormat _calendarFormat = CalendarFormat.month;
DateTime _focusedDay = DateTime.now();
DateTime? _selectedDay;
 SignUpService sus = SignUpService();

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () {
            sus.signOut();
          }, icon: Icon(Icons.logout)),
        ],
        title: Text('YOUR,WELLBEING ASSIST'),
        centerTitle: true,
      ),
      backgroundColor: Colors.pink.shade50,
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            // GridView for Feature Sections
            Expanded(
              child: GridView(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, crossAxisSpacing: 3, mainAxisSpacing: 3),
                children: [
                  // Mood Tracker
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MoodPage()),
                      );

                      // Navigate to Mood Tracker page
                    },
                    child: Container(
                      color: Colors.green,
                      child: Center(
                        child:
                            Text('MOOD', style: TextStyle(color: Colors.white)),
                      ),
                    ),
                  ),

                  // Period Tracker
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PeriodTrackerPage()),
                      );
                    },
                    child: Container(
                      color: Colors.red,
                      child: Center(
                        child: Text('PERIOD',
                            style: TextStyle(color: Colors.white)),
                      ),
                    ),
                  ),

                  // Meditation
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MeditationPage()),
                      );
                    },
                    child: Container(
                      color: Colors.pink,
                      child: Center(
                        child: Text('MEDITATION',
                            style: TextStyle(color: Colors.white)),
                      ),
                    ),
                  ),

                  // Journal
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => JournalPage()),
                      );
                    },
                    child: Container(
                      color: Colors.amber,
                      child: Center(
                        child: Text('JOURNAL',
                            style: TextStyle(color: Colors.white)),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // TableCalendar for Special Dates
            TableCalendar(
              firstDay: DateTime.utc(2020, 1, 1),
              lastDay: DateTime.utc(2030, 12, 31),
              focusedDay: _focusedDay,
              calendarFormat: _calendarFormat,
              selectedDayPredicate: (day) {
                return isSameDay(_selectedDay, day);
              },
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay;
                });
              },
              onFormatChanged: (format) {
                setState(() {
                  _calendarFormat = format;
                });
              },
              headerStyle: HeaderStyle(
                formatButtonVisible: true,
                titleCentered: true,
              ),
              calendarStyle: CalendarStyle(
                selectedDecoration: BoxDecoration(
                  color: Colors.blueAccent,
                  shape: BoxShape.circle,
                ),
                todayDecoration: BoxDecoration(
                  color: Colors.blue.withOpacity(0.5),
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
