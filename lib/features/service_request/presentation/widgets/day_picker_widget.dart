import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DayPickerWidget extends StatelessWidget {
  const DayPickerWidget({
    Key key,
    @required this.size,
    @required this.daysCount,
    @required this.selectedMonth,
    @required this.days,
    @required this.selectedDay,
    @required this.onDayChanged,
  }) : super(key: key);

  final Size size;
  final int daysCount;
  final int selectedMonth;
  final List<String> days;
  final int selectedDay;
  final ValueChanged<int> onDayChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height / 12,
      child: ListView.builder(
        itemCount: daysCount,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, i) {
          return GestureDetector(
            onTap: () {
              onDayChanged.call(i + 1);
            },
            behavior: HitTestBehavior.translucent,
            child: Container(
              height: size.height / 11,
              margin: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  Text(
                    days[i].substring(0, 3),
                    style: GoogleFonts.poppins(
                      fontSize: 10,
                      color: Color.fromARGB(255, 134, 93, 71),
                    ),
                  ),
                  Text(
                    '${i + 1}',
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      color: Color.fromARGB(255, 134, 93, 71),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  i + 1 == selectedDay
                      ? Container(
                          width: 12,
                          height: 5,
                          color: Color.fromARGB(255, 134, 93, 71),
                        )
                      : const SizedBox.shrink(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
