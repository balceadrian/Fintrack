import 'package:flutter/material.dart';

class ReminderPage extends StatefulWidget {
  const ReminderPage({super.key});

  @override
  State<ReminderPage> createState() => _ReminderPageState();
}

class _ReminderPageState extends State<ReminderPage> {
  bool dailyReminder = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF1E0B30)),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Reminder',
          style: TextStyle(
            color: Color(0xFF1E0B30),
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        centerTitle: false,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(
            color: Colors.grey.shade300,
            height: 1,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(top: 16.0, left: 8, right: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Daily Reminder',
              style: TextStyle(
                color: Color(0xFF1E0B30),
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
            Switch(
              value: dailyReminder,
              onChanged: (val) {
                setState(() {
                  dailyReminder = val;
                });
              },
              activeColor: Color(0xFF7B6F8E),
            ),
          ],
        ),
      ),
    );
  }
} 