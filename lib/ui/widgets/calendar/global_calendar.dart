
import 'package:common_utils/common_utils.dart';
import 'package:date_utils/date_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_study/ui/service/model/calendar/calendar_data_model.dart';
import 'package:table_calendar/table_calendar.dart';

// Example holidays
//final Map<DateTime, List> _holidays = {
//  DateTime(2019, 1, 1): ['New Year\'s Day'],
//  DateTime(2019, 1, 6): ['Epiphany'],
//  DateTime(2019, 2, 14): ['Valentine\'s Day'],
//  DateTime(2019, 7, 21): ['Easter Sunday'],
//};


class PerfectCalendar extends StatefulWidget {


  final ValueChanged<dynamic> eventClick;
  final ValueChanged<dynamic> daySelectClick;
  final ValueChanged<dynamic> dayVisibleChange;
  final String title;
//  final Map<DateTime, List<CalendarDataModel>> eventList;
  final Map<DateTime, List<int>> eventNumList;
  final List<CalendarDataModel> selectList;
  PerfectCalendar({Key key, this.title,this.eventClick,this.daySelectClick,this.eventNumList,this.selectList,this.dayVisibleChange}) : super(key: key);



  @override
  _PerfectCalendarState createState() => _PerfectCalendarState();
}

class _PerfectCalendarState extends State<PerfectCalendar> with TickerProviderStateMixin {
  DateTime _selectedDay;
//  Map<DateTime, List> _events;
//  Map<DateTime, List> _visibleEvents;
//  Map<DateTime, List> _visibleHolidays;
//  List<CalendarDataModel> _selectedEvents;
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _selectedDay = DateTime.now();

//    if(widget.eventNumList==null){
//      widget.eventNumList ={};
//      _visibleEvents = widget.eventNumList;
//      _selectedEvents = widget.eventList[_selectedDay] ?? [];
//    }else{
//      _visibleEvents = {};
//      _selectedEvents =  [];
//    }

//    _selectedEvents = widget.selectList;//将父组件给的事件集合

//    _visibleHolidays = _holidays;

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    _controller.forward();
  }

  void _onDaySelected(DateTime day, List events) {
    setState(() {
      _selectedDay = day;
//      _selectedEvents = widget.selectList;
    });
  }

  void _onVisibleDaysChanged(DateTime first, DateTime last, CalendarFormat format) {

    LogUtil.v(first,tag: " first day");
    LogUtil.v(last,tag: " last day");
//    _onDaySelected(first,List());


    Map map = Map();
    map["first"] = first;
    map["last"] = last;
    if((_selectedDay.isAfter(first) && _selectedDay.isBefore(last))|| Utils.isSameDay(first, _selectedDay)||Utils.isSameDay(last, _selectedDay)){
      map["in"] = true;
      map["day"] = _selectedDay;
    }else{
      map["in"] = false;
    }

    widget.dayVisibleChange(map);
//    setState(() {
//      _selectedDay = DateTime(1999,01,01);
////      _selectedEvents = widget.selectList;
//    });
//    setState(() {
//      _visibleEvents = Map.fromEntries(
//        _events.entries.where(
//              (entry) =>
//          entry.key.isAfter(first.subtract(const Duration(days: 1))) &&
//              entry.key.isBefore(last.add(const Duration(days: 1))),
//        ),
//      );

//      _visibleHolidays = Map.fromEntries(
//        _holidays.entries.where(
//              (entry) =>
//          entry.key.isAfter(first.subtract(const Duration(days: 1))) &&
//              entry.key.isBefore(last.add(const Duration(days: 1))),
//        ),
//      );
//    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
           _buildTableCalendarWithBuilders(),
          const SizedBox(height: 8.0),
          Expanded(child: _buildEventList()),
        ],
      ),
    );
  }
  // More advanced TableCalendar configuration (using Builders & Styles)
  Widget _buildTableCalendarWithBuilders() {
    return TableCalendar(
      locale: 'zh_CN',
      events: widget.eventNumList,
//      holidays: _visibleHolidays,
      initialCalendarFormat: CalendarFormat.month,
      formatAnimation: FormatAnimation.slide,
      startingDayOfWeek: StartingDayOfWeek.sunday,
      availableGestures: AvailableGestures.all,
      availableCalendarFormats: const {
        CalendarFormat.month: '月',
        CalendarFormat.week: '周',
      },
      calendarStyle: CalendarStyle(
        outsideDaysVisible: false,
        weekendStyle: TextStyle().copyWith(color: Colors.blue[800]),
        holidayStyle: TextStyle().copyWith(color: Colors.blue[800]),
      ),
      daysOfWeekStyle: DaysOfWeekStyle(
        weekendStyle: TextStyle().copyWith(color: Colors.blue[600]),
      ),
      headerStyle: HeaderStyle(
        centerHeaderTitle: true,
        formatButtonTextStyle: TextStyle().copyWith(color: Colors.white, fontSize: 15.0),
        formatButtonDecoration: BoxDecoration(
          color: Colors.deepOrange[400],
          borderRadius: BorderRadius.circular(16.0),
        ),
      ),
      builders: CalendarBuilders(
        selectedDayBuilder: (context, date, _) {
          return FadeTransition(
            opacity: Tween(begin: 0.0, end: 1.0).animate(_controller),
            child: Container(
              margin: const EdgeInsets.all(4.0),
              decoration: BoxDecoration(
                color: Colors.deepOrange[300],
                borderRadius: BorderRadius.circular(3),
              ),
              padding: const EdgeInsets.only(top: 5.0, left: 6.0),

              width: 100,
              height: 100,
              child: Text(
                '${date.day}',
                style: TextStyle().copyWith(fontSize: 16.0),
              ),
            ),
          );
        },
        todayDayBuilder: (context, date, _) {
          return Container(
            margin: const EdgeInsets.all(4.0),
            decoration: BoxDecoration(
              color: Colors.amber[400],
                borderRadius: BorderRadius.circular(3),
            ),
            padding: const EdgeInsets.only(top: 5.0, left: 6.0),

            width: 100,
            height: 100,
            child: Text(
              '${date.day}',
              style: TextStyle().copyWith(fontSize: 16.0),
            ),
          );
        },
        markersBuilder: (context, date, events, holidays) {
          final children = <Widget>[];

          if (events.isNotEmpty) {
            children.add(
              Positioned(
                right: 1,
                bottom: 1,
                child: _buildEventsMarker(date, events),
              ),
            );
          }

          if (holidays.isNotEmpty) {
            children.add(
              Positioned(
                right: -2,
                top: -2,
                child: _buildHolidaysMarker(),
              ),
            );
          }

          return children;
        },
      ),
      onDaySelected: (date, events) {

        print('$events onDaySelected!');
        _onDaySelected(date, events);
        _controller.forward(from: 0.0);
        widget.daySelectClick(date);
      },
      onVisibleDaysChanged: _onVisibleDaysChanged,
    );
  }

  Widget _buildEventsMarker(DateTime date, List events) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Utils.isSameDay(date, _selectedDay)
            ? Colors.brown[500]
            : Utils.isSameDay(date, DateTime.now()) ? Colors.brown[300] : Colors
            .blue[400],
      ),
      width: 16.0,
      height: 16.0,
      child: Center(
        child: Text(
          '${events[0]}',
          style: TextStyle().copyWith(
            color: Colors.white,
            fontSize: 12.0,
          ),
        ),
      ),
    );
  }

  Widget _buildHolidaysMarker() {
    return Icon(
      Icons.add_box,
      size: 20.0,
      color: Colors.blueGrey[800],
    );
  }

  Widget _buildEventList() {
    if(widget.selectList!=null)
    return ListView(
      children: widget.selectList
          .map((event) =>
          Container(
            margin: EdgeInsets.only(top: 5,left: 8,right: 8),
            decoration: BoxDecoration(
              border: Border.all(width: 0.8,color: Color(0xff666B74)),
              borderRadius: BorderRadius.circular(12.0),
            ),
//            margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            child: ListTile(
              title: Text(event.name??"无"),
              onTap: (){
                widget.eventClick(event);
               var x=_selectedDay.subtract(Duration(days: 30));
                print('$x tapped!');
              },
            ),
          ))
          .toList(),
    );
    if(widget.selectList==null)
      return Container();
  }
}
