import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import '../user_recode_vm.dart';

class UserRecodeBody extends StatefulWidget {
  final UserRecodeModel userRecodeModel;
  UserRecodeBody({required this.userRecodeModel, super.key});

  @override
  _UserRecodeBodyState createState() => _UserRecodeBodyState(userRecodeModel);
}

class _UserRecodeBodyState extends State<UserRecodeBody> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now(); // 초기 포커스를 오늘 날짜로 설정
  DateTime? _selectedDay;
  late UserRecodeModel _userRecodeModel;

  _UserRecodeBodyState(this._userRecodeModel);

  @override
  void initState() {
    super.initState();
    List<RecodeInformation> data = _userRecodeModel.recodeInformationList;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          SizedBox(height: 30,),
          Text("파란색 : 운동 수행 완료", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.blue),),
          SizedBox(height: 20,),
          Text("빨간색 : 운동 미완료", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.red),),
          SizedBox(height: 50,),
          TableCalendar(
            firstDay: DateTime.utc(2020, 1, 1),
            lastDay: DateTime.utc(2030, 12, 31),
            focusedDay: _focusedDay,
            calendarFormat: _calendarFormat,
            availableCalendarFormats: const {
              CalendarFormat.month: 'Month'
            },
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
            onPageChanged: (focusedDay) {
              _focusedDay = focusedDay;
            },
            calendarBuilders: CalendarBuilders(
              defaultBuilder: (context, day, focusedDay) {
                for (var recode in _userRecodeModel.recodeInformationList) {
                  if (isSameDay(day, DateTime.parse(recode.date))) {
                    return Container(
                      decoration: BoxDecoration(
                        color: recode.isChecked ? Colors.blue : Colors.red,
                        shape: BoxShape.circle,
                      ),
                      margin: const EdgeInsets.all(6.0),
                      width: 40.0,
                      height: 40.0,
                      alignment: Alignment.center,
                      child: Text(
                        '${day.day}',
                        style: const TextStyle().copyWith(
                          color: Colors.white,
                        ),
                      ),
                    );
                  }
                }
                return null;
              },
            ),
            calendarStyle: CalendarStyle(
              selectedDecoration: BoxDecoration(
                color: Colors.transparent, // 선택된 날짜의 배경색을 투명하게 설정
                shape: BoxShape.circle,
              ),
              todayDecoration: BoxDecoration(
                color: Colors.transparent, // 오늘 날짜의 배경색을 투명하게 설정
                shape: BoxShape.circle,
              ),
              selectedTextStyle: TextStyle(
                color: Colors.black, // 선택된 날짜의 텍스트 색상을 기본 색상으로 설정
              ),
              todayTextStyle: TextStyle(
                color: Colors.black, // 오늘 날짜의 텍스트 색상을 기본 색상으로 설정
              ),
            ),
          ),
          // 여기에 추가적인 위젯이나 내용 추가 가능
        ],
      ),
    );
  }
}
