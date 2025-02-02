import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class PeriodTrackerPage extends StatefulWidget {
  @override
  _PeriodTrackerPageState createState() => _PeriodTrackerPageState();
}

class _PeriodTrackerPageState extends State<PeriodTrackerPage> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  DateTime? _firstPeriodStartDate;
  List<DateTime> _periodDays = [];

  // The cycle length of a typical period (e.g., 28 days)
  final int cycleLength = 28;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Period Tracker", style: TextStyle(fontFamily: 'DancingScript')),
        backgroundColor: Colors.pink.shade400,
        centerTitle: true,
      ),
      backgroundColor: Colors.pink.shade50,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Custom Heading
            Text(
              "Track Your Period Days",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                fontFamily: 'Lobster',
                color: Colors.pink.shade800,
              ),
            ),
            SizedBox(height: 20),

            // TableCalendar for Period Tracking
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
                  _markPeriodDay(selectedDay);
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
                leftChevronIcon: Icon(Icons.chevron_left, color: Colors.pink.shade700),
                rightChevronIcon: Icon(Icons.chevron_right, color: Colors.pink.shade700),
              ),
              calendarStyle: CalendarStyle(
                selectedDecoration: BoxDecoration(
                  color: Colors.pink.shade200,
                  shape: BoxShape.circle,
                ),
                todayDecoration: BoxDecoration(
                  color: Colors.pink.withOpacity(0.5),
                  shape: BoxShape.circle,
                ),
                weekendTextStyle: TextStyle(color: Colors.pink.shade700),
                outsideTextStyle: TextStyle(color: Colors.grey.shade400),
              ),
              calendarBuilders: CalendarBuilders(
                // Adding markers for period days
                todayBuilder: (context, date, events) {
                  return _periodDays.contains(date)
                      ? Container(
                          decoration: BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Text(
                              '${date.day}',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        )
                      : null;
                },
                markerBuilder: (context, date, events) {
                  if (_periodDays.contains(date)) {
                    return Positioned(
                      bottom: 1,
                      right: 1,
                      child: Icon(
                        Icons.circle,
                        size: 8,
                        color: Colors.red,
                      ),
                    );
                  }
                  return null;
                },
              ),
            ),
            SizedBox(height: 20),
            // Explanation text for the user
            Text(
              "Your period days are marked in red. Tap on a date to mark it as the start of your period. The next period will be tracked automatically.",
              style: TextStyle(
                fontSize: 16,
                fontFamily: 'DancingScript',
                color: Colors.pink.shade700,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // This method will mark the selected day as the first day of the period
  void _markPeriodDay(DateTime selectedDay) {
    // If it's the first period start date
    if (_firstPeriodStartDate == null) {
      _firstPeriodStartDate = selectedDay;
      _periodDays.add(_firstPeriodStartDate!);
      // Automatically track next periods (e.g., every 28 days)
      _trackNextPeriods();
    } else {
      // If there's already a start date, just track the next period based on the cycle length
      if (!_periodDays.contains(selectedDay)) {
        _periodDays.add(selectedDay);
        _trackNextPeriods();
      }
    }
  }

  // This function tracks next periods based on cycle length (28 days by default)
  void _trackNextPeriods() {
    if (_firstPeriodStartDate != null) {
      // Calculate the next periods based on cycle length (28 days)
      DateTime nextPeriodDate = _firstPeriodStartDate!;
      for (int i = 1; i <= 12; i++) {  // Track up to 12 periods in advance
        nextPeriodDate = nextPeriodDate.add(Duration(days: cycleLength));
        if (!_periodDays.contains(nextPeriodDate)) {
          _periodDays.add(nextPeriodDate);
        }
      }
    }
  }
}
