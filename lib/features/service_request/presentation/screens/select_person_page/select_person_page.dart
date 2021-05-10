import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

import '../../widgets/day_picker_widget.dart';
import '../../widgets/month_picker_widget.dart';

class SelectPersonPage extends StatefulWidget {
  static String routeName = '/select_person_page';
  SelectPersonPage({Key key}) : super(key: key);

  @override
  _SelectPersonPageState createState() => _SelectPersonPageState();
}

class _SelectPersonPageState extends State<SelectPersonPage> {
  Size size;
  int selectedMonth;
  int selectedDay;
  List<String> days = [];
  int daysCount;
  DateTime now;
  List<String> morningHours = [
    '08:00',
    '09:00',
    '10:00',
    '11:00',
    '12:00',
  ];
  List<String> afternoonHours = [
    '01:00',
    '02:00',
    '03:00',
    '04:00',
    '05:00',
  ];

  @override
  void initState() {
    super.initState();
    initializeDateFormatting('es');
    now = DateTime.now();
    obtainDaysOfMonth(now.month);
    selectedDay = now.day;
  }

  void onMonthChanged(int month) {
    setState(() {
      obtainDaysOfMonth(month);
    });
  }

  void onDayChanded(int day) {
    setState(() {
      selectedDay = day;
    });
  }

  void obtainDaysOfMonth(int month) {
    selectedMonth = month;
    selectedDay = -1;
    daysCount = DateUtils.getDaysInMonth(now.year, selectedMonth);
    days.clear();
    for (int i = 1; i < daysCount + 1; i++) {
      days.add(DateFormat(
        'EEEE',
        'es',
      ).format(DateTime(now.year, selectedMonth, i)));
    }
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text('Sacar una cita', style: GoogleFonts.poppins()),
        backgroundColor: Color.fromARGB(255, 162, 125, 94),
      ),
      body: ListView(
        padding: const EdgeInsets.only(top: 5, bottom: 5),
        children: [
          MonthPickerWidget(
            size: size,
            onMonthChanged: onMonthChanged,
          ),
          SizedBox(
            height: 10,
          ),
          DayPickerWidget(
            size: size,
            daysCount: daysCount,
            selectedMonth: selectedMonth,
            days: days,
            selectedDay: selectedDay,
            onDayChanged: onDayChanded,
          ),
          buildPersonsList(),
          buildAvailableTime(),
          Container(
            margin: const EdgeInsets.only(top: 20),
            padding: const EdgeInsets.symmetric(horizontal: 70),
            child: TextButton(
              style: TextButton.styleFrom(
                  // padding: const EdgeInsets.symmetric(horizontal: 70),
                  backgroundColor: Color.fromARGB(255, 134, 93, 71),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  )),
              child: Text(
                'Agendar ahora',
                style: GoogleFonts.poppins(
                  fontSize: 15,
                  color: Colors.white,
                ),
              ),
              onPressed: () => {},
            ),
          ),
        ],
      ),
    );
  }

  Container buildAvailableTime() {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 30,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Tiempo disponible',
            style: GoogleFonts.poppins(
              fontSize: 20,
              color: Color.fromARGB(255, 134, 93, 71),
            ),
            textAlign: TextAlign.left,
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            'Mañana',
            style: GoogleFonts.poppins(
              fontSize: 15,
              color: Color.fromARGB(200, 134, 93, 71),
            ),
            textAlign: TextAlign.left,
          ),
          SizedBox(
            height: 5,
          ),
          Wrap(
              children: morningHours.map((e) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              height: 30,
              width: 80,
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 206, 166, 133),
                  borderRadius: BorderRadius.circular(5)),
              child: Center(
                child: Text(
                  e,
                  style: GoogleFonts.poppins(
                    fontSize: 17,
                    color: Colors.white,
                  ),
                ),
              ),
            );
          }).toList()),
          SizedBox(
            height: 5,
          ),
          Text(
            'Tarde',
            style: GoogleFonts.poppins(
              fontSize: 15,
              color: Color.fromARGB(200, 134, 93, 71),
            ),
            textAlign: TextAlign.left,
          ),
          SizedBox(
            height: 5,
          ),
          Wrap(
              children: afternoonHours.map((e) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              height: 30,
              width: 80,
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 206, 166, 133),
                  borderRadius: BorderRadius.circular(5)),
              child: Center(
                child: Text(
                  e,
                  style: GoogleFonts.poppins(
                    fontSize: 17,
                    color: Colors.white,
                  ),
                ),
              ),
            );
          }).toList()),
        ],
      ),
    );
  }

  Container buildPersonsList() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Manicuristas',
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  color: Color.fromARGB(255, 134, 93, 71),
                ),
              ),
              Text(
                'Ver todos (as)',
                style: GoogleFonts.poppins(
                  fontSize: 10,
                  color: Color.fromARGB(150, 134, 93, 71),
                ),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 20),
            height: size.height / 4,
            child: NotificationListener<OverscrollIndicatorNotification>(
              onNotification: (overscroll) {
                overscroll.disallowGlow();
                return false;
              },
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, i) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    width: size.height / 5,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          color: Color.fromARGB(255, 206, 166, 133), width: 2),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CircleAvatar(
                          backgroundColor: Color.fromARGB(255, 206, 166, 133),
                          radius: 50,
                          backgroundImage: AssetImage('assets/images/pic.jpg'),
                        ),
                        Text(
                          'Elly',
                          style: GoogleFonts.poppins(
                            fontSize: 17,
                            color: Color.fromARGB(255, 134, 93, 71),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '4.7',
                              style: GoogleFonts.poppins(
                                color: Color.fromARGB(255, 206, 166, 133),
                              ),
                            ),
                            Icon(
                              Icons.star,
                              color: Color.fromARGB(255, 206, 166, 133),
                            ),
                          ],
                        )
                      ],
                    ),
                    height: size.height / 2.5,
                  );
                },
                scrollDirection: Axis.horizontal,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
