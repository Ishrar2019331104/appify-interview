import 'package:flutter/material.dart';
import 'package:flutter_sandbox/provider/task_prpvider.dart';
import 'package:flutter_sandbox/screens/add_task.dart';
import 'package:flutter_sandbox/screens/task_card.dart';
import 'package:flutter_sandbox/utils/app_colors.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

late DateTime _selectedDay;
late DateTime _focusedDay;

class _HomeState extends State<Home> {
  DateTime today = DateTime.utc(2024, 8, 19);

  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
    });
  }

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
                onPressed: () {},
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
      body: Column(
        children: [
          Container(
            color: Colors.white,
            child: TableCalendar(
              firstDay: DateTime.utc(2010, 10, 16),
              lastDay: DateTime.utc(2030, 3, 14),
              focusedDay: today,
              locale: "en_US",
              rowHeight: 42,
              selectedDayPredicate: (day) => isSameDay(day, today),
              headerStyle: HeaderStyle(
                  titleTextFormatter: (date, locale) {
                    return DateFormat('MMMM').format(date);
                  },
                  formatButtonVisible: false,
                  leftChevronVisible: false,
                  rightChevronVisible: false,
                  titleCentered: true,
                  decoration: BoxDecoration(color: Colors.white)),
              availableGestures: AvailableGestures.all,
              onDaySelected: _onDaySelected,
              calendarFormat: CalendarFormat.month,
              calendarStyle: const CalendarStyle(
                  todayTextStyle: TextStyle(color: Colors.black),
                  todayDecoration: BoxDecoration(color: Colors.transparent),
                  selectedTextStyle: TextStyle(color: AppColors.primary),
                  selectedDecoration: BoxDecoration(
                      color: AppColors.secondary, shape: BoxShape.circle)),
            ),
          ),
          SizedBox(height: 16),
          Expanded(
            child:
                Consumer<TaskProvider>(builder: (context, taskProvider, child) {
              return ListView.builder(
                itemCount: taskProvider.tasks.length,
                itemBuilder: (context, index) {
                  return TaskCard(
                      title: taskProvider.tasks[index]['title'],
                      time: taskProvider.tasks[index]['time'],
                      color: taskProvider.tasks[index]['color']);
                },
              );
            }),
          ),
          SizedBox(height: 16),
        ],
      ),
      floatingActionButton: Stack(
        children: [
          Positioned(
            bottom: 16,
            left: MediaQuery.of(context).size.width / 2 -
                28, // Center horizontally
            child: FloatingActionButton(
              backgroundColor: AppColors.primary,
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => AddTask(date: today),
                  ),
                );
              },
              child: const Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
