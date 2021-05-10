import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MonthPickerWidget extends StatefulWidget {
  MonthPickerWidget({
    Key key,
    @required this.size,
    @required this.onMonthChanged,
  }) : super(key: key);

  final Size size;
  final ValueChanged<int> onMonthChanged;

  @override
  _MonthPickerWidgetState createState() => _MonthPickerWidgetState();
}

class _MonthPickerWidgetState extends State<MonthPickerWidget> {
  final List months = [
    'Ene',
    'Feb',
    'Mar',
    'Abr',
    'May',
    'Jun',
    'Jul',
    'Ago',
    'Sep',
    'Oct',
    'Nov',
    'Dic'
  ];

  PageController controller;

  int currentMonth;

  @override
  void initState() {
    super.initState();
    DateTime now = new DateTime.now();
    currentMonth = now.month;
    controller = PageController(initialPage: currentMonth - 1);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.size.width / 4,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            icon: Icon(
              Icons.arrow_back_ios_outlined,
              color: Color.fromARGB(255, 134, 93, 71),
            ),
            iconSize: 20,
            onPressed: () {
              controller.previousPage(
                  duration: Duration(milliseconds: 200), curve: Curves.easeIn);
            },
          ),
          Container(
            height: 50,
            width: widget.size.width / 6,
            child: NotificationListener<OverscrollIndicatorNotification>(
              onNotification: (overscroll) {
                overscroll.disallowGlow();
                return false;
              },
              child: PageView(
                onPageChanged: (index) {
                  widget.onMonthChanged.call(index + 1);
                },
                controller: controller,
                scrollDirection: Axis.horizontal,
                children: months
                    .map((e) => Center(
                          child: Text(
                            e,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                              fontSize: 17,
                              color: Color.fromARGB(255, 134, 93, 71),
                            ),
                          ),
                        ))
                    .toList(),
              ),
            ),
          ),
          IconButton(
            iconSize: 20,
            icon: Icon(
              Icons.arrow_forward_ios_outlined,
              color: Color.fromARGB(255, 134, 93, 71),
            ),
            onPressed: () {
              controller.nextPage(
                  duration: Duration(milliseconds: 200), curve: Curves.easeIn);
            },
          ),
        ],
      ),
    );
  }
}
