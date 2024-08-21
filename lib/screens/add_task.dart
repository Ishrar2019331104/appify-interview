import 'package:flutter/material.dart';
import 'package:flutter_sandbox/utils/app_colors.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

class AddTask extends StatelessWidget {
  final DateTime date;

  const AddTask({super.key, required this.date});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        leading: Transform.translate(
          offset: const Offset(16, 0),
          child: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              border: Border.all(
                color: const Color(0xFFC0C1CE),
              ),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Center(
              child: IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                  size: 22.0,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 16),
            width: 55,
            height: 60,
            decoration: BoxDecoration(
              border: Border.all(
                color: const Color(0xFFC0C1CE),
              ),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Center(
              child: IconButton(
                icon: const Icon(
                  Icons.more_vert_outlined,
                  size: 22.0,
                ),
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                DateFormat.yMMMMd().format(date),
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              color: Colors.white,
              child: TableCalendar(
                firstDay: DateTime.utc(2010, 10, 16),
                lastDay: DateTime.utc(2030, 3, 14),
                focusedDay: DateTime.now(),
                locale: "en_US",
                rowHeight: 42,
                headerStyle: HeaderStyle(
                    titleTextFormatter: (date, locale) {
                      return "";
                    },
                    formatButtonVisible: false,
                    leftChevronVisible: false,
                    rightChevronVisible: false,
                    titleCentered: true,
                    decoration: BoxDecoration(color: Colors.white)),
                availableGestures: AvailableGestures.all,
                calendarFormat: CalendarFormat.week,
                calendarStyle: const CalendarStyle(
                    todayTextStyle: TextStyle(color: Colors.black),
                    todayDecoration: BoxDecoration(color: Colors.transparent),
                    selectedTextStyle: TextStyle(color: AppColors.primary),
                    selectedDecoration: BoxDecoration(
                        color: AppColors.secondary, shape: BoxShape.circle)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
