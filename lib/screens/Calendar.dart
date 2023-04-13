import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import '../utils/ThemeController.dart';

final DateTime _now = DateTime.now();

class CalendarWidget extends StatefulWidget {
  const CalendarWidget({Key? key}) : super(key: key);

  @override
  State<CalendarWidget> createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  final ThemeController _themeController = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Theme(
        data: _themeController.theme,
        child: SfCalendar(
          view: CalendarView.month,
          monthViewSettings: const MonthViewSettings(showAgenda: true),
          dataSource: MeetingDataSource(_getDataSource()),
        ),
      ),
    );
  }

  List<Meeting> _getDataSource() {
    final List<Meeting> meetings = <Meeting>[];
    final DateTime today = DateTime.now();
    final DateTime startTime =
        DateTime(today.year, today.month, today.day, 9, 0, 0);
    final DateTime endTime = startTime.add(const Duration(hours: 2));
    meetings.add(
      Meeting(
        'Prayer Meeting',
        startTime,
        endTime,
        const Color(0xFF0F8644),
        false,
       const CircleAvatar(
          radius: 15,
          backgroundImage: NetworkImage("https://media.istockphoto.com/id/1289461328/photo/portrait-of-a-handsome-black-man.jpg?s=612x612&w=0&k=20&c=y_mzB0Tbe5LErNy6pqfY7sz2HiDT7fOAUCwupN3-Bg4="),
        )
      ),
    );
    meetings.add(
      Meeting(
        'Prayer Meeting',
        startTime,
        endTime,
        const Color(0xFF0F8644),
        false,
       const CircleAvatar(
          radius: 15,
          backgroundImage: NetworkImage("https://media.istockphoto.com/id/1289461328/photo/portrait-of-a-handsome-black-man.jpg?s=612x612&w=0&k=20&c=y_mzB0Tbe5LErNy6pqfY7sz2HiDT7fOAUCwupN3-Bg4="),
        )
      ),
    );
    return meetings;
  }
}

class Meeting {
  Meeting(this.eventName, this.from, this.to, this.background, this.isAllDay,
      this.imageUrl);

  String eventName;
  DateTime from;
  DateTime to;
  Color background;
  bool isAllDay;
  Widget imageUrl;
}

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Meeting> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return appointments![index].from;
  }

  @override
  DateTime getEndTime(int index) {
    return appointments![index].to;
  }

  @override
  String getSubject(int index) {
    return appointments![index].eventName;
  }

  @override
  Color getColor(int index) {
    return appointments![index].background;
  }

  @override
  bool isAllDay(int index) {
    return appointments![index].isAllDay;
  }

  @override
  Widget imageUrl(int index) {
    return appointments![index].imageUrl;
  }
}
