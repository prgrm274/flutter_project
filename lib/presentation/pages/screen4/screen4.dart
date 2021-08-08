import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:project/const/strings_constants.dart';
import 'package:project/presentation/pages/custom/row_circles.dart';

class Screen4 extends StatefulWidget {
  @override
  _Screen4State createState() => _Screen4State();
}

class _Screen4State extends State<Screen4> with TickerProviderStateMixin{
  late AnimationController _animationController;
  var _selected1;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    )
      ..forward()
      ..repeat(reverse: true);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          elevation: 0,
          leading: IconButton(icon:Icon(Icons.arrow_back),
              onPressed:() => Navigator.pop(context)),
          title: Text('Create Account'),
        ),
        backgroundColor: Colors.blue[500],
        body: Stack(
          fit: StackFit.loose,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: Center(
                    child: Stack(
                      fit: StackFit.loose,
                      children: [
                        Positioned(
                            top: 30,
                            width: MediaQuery.of(context).size.width-40,
                            child: Container(
                              color: Colors.black45,
                              height: 5,
                              width: MediaQuery.of(context).size.width,
                              margin: const EdgeInsets.fromLTRB(40, 0, 40, 0),
                            )
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RowCircle(color: Colors.green, teks: '1'),
                            RowCircle(color: Colors.green, teks: '2'),
                            RowCircle(color: Colors.green, teks: '3'),
                            RowCircle(color: Colors.white, teks: '4'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 40),
                  child: AnimatedBuilder(
                    animation: _animationController,
                    builder: (context, child) {
                      return Container(
                        decoration: ShapeDecoration(
                          color: Colors.white.withOpacity(0.5),
                          shape: CircleBorder(),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(8.0 * _animationController.value),
                          child: child,
                        ),
                      );
                    },
                    child: Container(
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: CircleBorder(),
                      ),
                      child: IconButton(
                        onPressed: () {},
                        color: Colors.blue,
                        icon: Icon(Icons.calendar_today, size: 24),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      Container(
                          margin: const EdgeInsets.fromLTRB(40, 0, 40, 10),
                          child: Text(
                              s4Schedule,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold))
                      ),
                      Container(
                          margin: const EdgeInsets.fromLTRB(40, 0, 40, 20),
                          child: Text(
                              s4ChooseDate,
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                  color: Colors.white70,
                                  fontWeight: FontWeight.bold))
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(40, 0, 40, 20),
                        padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Colors.white,),
                        child: GestureDetector(
                          onTap: ()=> _selectDate(context),
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text('Date', textAlign: TextAlign.start,
                                    style: TextStyle(color: Colors.grey[400]))
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  RichText(
                                    textAlign: TextAlign.justify,
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                            text: _isTapped
                                                ?
                                            "${_returnDayname(selectedDate.toLocal().weekday)}, "
                                                "${selectedDate.toLocal().day} "
                                                "${_returnMonthname(selectedDate.toLocal().month)} "
                                                "${selectedDate.toLocal().year} "
                                                :
                                            "- Choose Date -",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 18)
                                        ),
                                      ],
                                    ),
                                  ),
                                  Icon(Icons.keyboard_arrow_down)
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(40, 0, 40, 20),
                        padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Colors.white,),
                        child: GestureDetector(
                          onTap: ()=> _selectTime(context),
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text('Time', textAlign: TextAlign.start,
                                    style: TextStyle(color: Colors.grey[400])),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  RichText(
                                    textAlign: TextAlign.justify,
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                            text: _isTappedTime
                                                ?
                                            // _time
                                            "${selectedTime.hour}:${selectedTime.minute}"
                                                :
                                            "- Choose Time -",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 18)
                                        ),
                                      ],
                                    ),
                                  ),
                                  Icon(Icons.keyboard_arrow_down)
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      /// Button Next
                      SizedBox(
                        height: 60,
                        width: MediaQuery.of(context).size.width-20,
                        child: Stack(
                          alignment: Alignment.center,
                          fit: StackFit.loose,
                          children: [
                            Positioned(
                              width: MediaQuery.of(context).size.width,
                              bottom: 10,
                              child: Container(
                                height: 50,
                                // padding: const EdgeInsets.fromLTRB(20, 0, 20, 5),
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => Screen4()),
                                    );
                                  },
                                  child: Text(next),
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }

  String _returnDayname(int value){
    var dayname;
    switch(value) {
      case 0: dayname = "Sunday"; break;
      case 1: dayname = "Monday"; break;
      case 2: dayname = "Tuesday"; break;
      case 3: dayname = "Wednesday"; break;
      case 4: dayname = "Thursday"; break;
      case 5: dayname = "Friday"; break;
      case 6: dayname = "Saturday"; break;
    }
    return dayname;
  }

  String _returnMonthname(int value){
    var monthname;
    switch(value) {
      case 1: monthname = "January"; break;
      case 2: monthname = "February"; break;
      case 3: monthname = "March"; break;
      case 4: monthname = "April"; break;
      case 5: monthname = "May"; break;
      case 6: monthname = "June"; break;
      case 7: monthname = "July"; break;
      case 8: monthname = "August"; break;
      case 9: monthname = "September"; break;
      case 10: monthname = "October"; break;
      case 11: monthname = "November"; break;
      case 12: monthname = "December"; break;
    }
    return monthname;
  }

  _selectDate(BuildContext context) async {
    final ThemeData theme = Theme.of(context);
    assert(theme.platform != null);
    switch (theme.platform) {
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
      case TargetPlatform.linux:
      case TargetPlatform.windows:
        return _buildMaterialDatePicker(context);
        // return buildMaterialDatePicker(context);
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
        return buildCupertinoDatePicker(context);
    }
  }


  bool _isTapped = false;
  /// This builds material date picker in Android
  _buildMaterialDatePicker(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
      initialEntryMode: DatePickerEntryMode.calendar,
      initialDatePickerMode: DatePickerMode.day,
      helpText: 'Schedule a date',
      cancelText: 'Cancel',
      confirmText: 'OK',
      errorFormatText: 'Invalid date format',
      errorInvalidText: 'Invalid date format',
      fieldLabelText: 'Start date',
      fieldHintText: 'Year/Month/Date',
      builder: (context, child) {
        return Theme(
          data: ThemeData.dark(),
          child: child!,
        );
      },
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;

        _isTapped = true;///
      });
    /*if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });*/
  }

  // buildMaterialDatePicker(BuildContext context) async {
  Future<Null> buildMaterialDatePicker(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
      /// change theme
      /*builder: (context, child) {
        return Theme(
          data: ThemeData.light(),
          child: child,
        );
      },*/
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }
  /// This builds cupertion date picker in iOS
  buildCupertinoDatePicker(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext builder) {
          return Container(
            height: MediaQuery.of(context).copyWith().size.height / 3,
            color: Colors.white,
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date,
              onDateTimeChanged: (picked) {
                if (picked != null && picked != selectedDate)
                  setState(() {
                    selectedDate = picked;
                  });
              },
              initialDateTime: selectedDate,
              minimumYear: 2000,
              maximumYear: 2025,
            ),
          );
        });
  }

  late String _setTime, _setDate;
  TimeOfDay selectedTime = TimeOfDay(hour: 00, minute: 00);

  /*Future<TimeOfDay?> showTimePicker24Hour(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
    );
  }*/

  bool _isTappedTime = false;
  Future<Null> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (picked != null)
      setState(() {
        selectedTime = picked;

        _isTappedTime = true;
      });}
}