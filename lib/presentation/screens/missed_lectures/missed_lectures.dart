import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:student_app/locale/app_localizations.dart';
import 'package:student_app/utils/app_colors.dart';
import 'package:student_app/utils/hex_color.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

class MissedLecturesScreen extends StatefulWidget {
  const MissedLecturesScreen({Key? key}) : super(key: key);

  @override
  _MissedLecturesScreenState createState() => _MissedLecturesScreenState();
}

class _MissedLecturesScreenState extends State<MissedLecturesScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  DateTime? _selectedDay;
  DateTime _focusedDay = DateTime.now();
  CalendarFormat _calendarFormat = CalendarFormat.week;

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      title: Padding(
        padding: EdgeInsets.fromLTRB(0, 5.h, 0, 0),
        child: Text(
          AppLocalizations.of(context)!.translate('missed_lectures')!,
          style:
              const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      backgroundColor: HexColor('#FFC844'),
      elevation: 0,
      leading: IconButton(
          onPressed: () => _scaffoldKey.currentState!.openDrawer(),
          icon: const Icon(
            Icons.menu,
            color: Colors.black,
          )),
      actions: [
        IconButton(
          icon: const Icon(
            Icons.notifications_outlined,
            color: Colors.black,
          ),
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(
            Icons.share,
            color: Colors.black,
          ),
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(
            Icons.search,
            color: Colors.black,
          ),
          onPressed: () {},
        ),
      ],
    );

    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Container(
          color: HexColor('#FFC844'),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TableCalendar(
                  firstDay: DateTime.utc(2010, 10, 16),
                  lastDay: DateTime.utc(2030, 3, 14),
                  focusedDay: _focusedDay,
                  calendarFormat: _calendarFormat,
                  daysOfWeekStyle: DaysOfWeekStyle(
                    dowTextFormatter: (date, locale) =>
                        DateFormat.E(locale).format(date)[0],
                  ),
                  headerStyle: HeaderStyle(
                      titleCentered: true,
                      titleTextFormatter: (date, locale) =>
                          DateFormat('dd MMMM yyyy').format(date),
                      formatButtonDecoration: BoxDecoration(
                        color: mainAppColor,
                        borderRadius: BorderRadius.circular(22.0),
                      ),
                      formatButtonTextStyle:
                          const TextStyle(color: Colors.white),
                      formatButtonShowsNext: false,
                      formatButtonVisible: false),
                  startingDayOfWeek: StartingDayOfWeek.saturday,
                  selectedDayPredicate: (day) {
                    // Use `selectedDayPredicate` to determine which day is currently selected.
                    // If this returns true, then `day` will be marked as selected.

                    // Using `isSameDay` is recommended to disregard
                    // the time-part of compared DateTime objects.
                    return isSameDay(_selectedDay, day);
                  },
                  onDaySelected: (selectedDay, focusedDay) {
                    if (!isSameDay(_selectedDay, selectedDay)) {
                      // Call `setState()` when updating the selected day
                      setState(() {
                        _selectedDay = selectedDay;
                        _focusedDay = focusedDay;
                      });
                    }
                  },
                  onPageChanged: (focusedDay) {
                    // No need to call `setState()` here
                    _focusedDay = focusedDay;
                  },
                  onFormatChanged: (format) {
                    if (_calendarFormat != format) {
                      // Call `setState()` when updating calendar format
                      setState(() {
                        _calendarFormat = format;
                      });
                    }
                  },
                ),
              ),

              Stack(children: [
                CustomPaint(
                  size: Size(MediaQuery.of(context).size.width,
                      (MediaQuery.of(context).size.height)),
                  //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                  painter: RPSCustomPainter(),
                ),
                Center(
                  child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _calendarFormat = CalendarFormat.month;
                        });
                      },
                      child: const Icon(Icons.keyboard_arrow_down)),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: _selectedDay != null
                      ? Text(DateFormat(' dd MMMM yyyy').format(_selectedDay!))
                      : Text(DateFormat(' dd MMMM yyyy').format(_focusedDay)),
                ),
                Center(
                  child: Container(
                    padding: EdgeInsets.only(top: 30.h),
                    height: 350.h,
                    width: 300.w,
                    child: ListView.builder(
                      itemCount: 7,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.all(10),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text("08 pm"),
                              SizedBox(
                                width: 10.w,
                              ),
                              Container(
                                padding: const EdgeInsets.all(20),
                                color: HexColor("#FFF7D6"),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text("Biology"),
                                        const Text("Mr , Tarek "),
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.alarm,
                                              size: 13.h,
                                            ),
                                            const Text("9 AM - 10 AM"),
                                          ],
                                        ),
                                        const Text("DNA"),
                                      ],
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Column(
                                      children: [
                                        const Icon(Icons.ac_unit),
                                        Container(
                                            color: HexColor("#00B192"),
                                            child: const Text("watch"))
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
                // Image.asset(
                //   "assets/images/backhome.png",
                //   width: double.infinity,
                //   fit: BoxFit.fill,
                // ),
              ]),
              // Container(
              //   width: double.infinity,
              //   height: 400.h,
              //   child: Column(
              //     children: [
              //       CustomPaint(
              //         size: Size(
              //             60.w,
              //             (60.w * 1.5845373961218838)
              //                 .toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
              //         painter: RPSCustomPainter(),
              //       ),
              //       // ClipPath(
              //       //   child: Container(
              //       //       height: 30.h,
              //       //       width: 60.w,
              //       //       color: HexColor('#FFC844'),
              //       //       child: Icon(Icons.arrow_drop_down_sharp)),
              //       //   clipper: RPSCustomPainter(),
              //       // ),
              //       Text("Sdsd"),
              //     ],
              //   ),
              //   decoration: BoxDecoration(
              //       color: Colors.white,
              //       borderRadius: BorderRadius.only(
              //           topLeft: Radius.circular(10.r),
              //           topRight: Radius.circular(10.h))),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width, size.height * 0.05734266);
    path_0.lineTo(size.width, size.height * 0.8924825);
    path_0.cubicTo(size.width, size.height * 0.9519231, size.width * 0.9229917,
        size.height * 1.000175, size.width * 0.8277008, size.height * 1.000175);
    path_0.lineTo(size.width * 0.1722992, size.height * 1.000175);
    path_0.cubicTo(size.width * 0.07700831, size.height, 0,
        size.height * 0.9519231, 0, size.height * 0.8923077);
    path_0.lineTo(0, size.height * 0.05734266);
    path_0.cubicTo(
        size.width * 0.0002770083,
        size.height * 0.02552448,
        size.width * 0.04127424,
        size.height * -0.0001748252,
        size.width * 0.09168975,
        0);
    path_0.lineTo(size.width * 0.3897507, 0);
    path_0.cubicTo(
        size.width * 0.3969529,
        size.height * 0.002272727,
        size.width * 0.4038781,
        size.height * 0.005069930,
        size.width * 0.4099723,
        size.height * 0.008216783);
    path_0.cubicTo(
        size.width * 0.4498615,
        size.height * 0.02849650,
        size.width * 0.4966759,
        size.height * 0.04807692,
        size.width * 0.5429363,
        size.height * 0.02202797);
    path_0.cubicTo(
        size.width * 0.5595568,
        size.height * 0.01258741,
        size.width * 0.5759003,
        size.height * 0.005419580,
        size.width * 0.5916898,
        size.height * 3.105519e-18);
    path_0.lineTo(size.width * 0.9085873, size.height * 3.105519e-18);
    path_0.cubicTo(
        size.width * 0.9587258,
        size.height * -0.0001748252,
        size.width * 0.9997230,
        size.height * 0.02552448,
        size.width,
        size.height * 0.05734266);
    path_0.close();

    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color = const Color(0xffFFFFFF).withOpacity(1.0);
    canvas.drawPath(path_0, paint0Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
