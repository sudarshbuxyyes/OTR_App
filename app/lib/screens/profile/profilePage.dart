import 'dart:math';

import 'package:app/screens/profile/editProfile.dart';
import 'package:app/utils/Sizer.dart';
import 'package:app/widgets/NavBar.dart';
import 'package:fl_chart/fl_chart.dart';

import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final List<String> tabs = <String>['STATS', 'BADGES', 'ACTIVITY'];
  static bool stats_visible = true;
  static List<bool> tabs_visible = [true, false, false];
  static List<String> tabs_title = ['Statistics', 'Badges', 'Activity'];
  final List<String> list = <String>['Monthly', 'Weekly'];
  static int current_tab = 0;
  @override
  Widget build(BuildContext context) {
    String dropdownValue = list.first;
    var rng = new Random();
    //generating some dummy XP data for the graph
    final List<FlSpot> dummyDataXP_weekly =
        List.generate(DateTime.now().weekday, (index) {
      return FlSpot(index.toDouble(), rng.nextDouble() * 10);
    });
    final List<FlSpot> dummyDataDistance_weekly =
        List.generate(DateTime.now().weekday, (index) {
      return FlSpot(index.toDouble(), rng.nextDouble() * 10);
    });
    DateTime now = new DateTime.now();
    DateTime lastDayOfMonth = new DateTime(now.year, now.month + 1, 0);
    final List<FlSpot> dummyDataXP_Month =
        List.generate(lastDayOfMonth.day, (index) {
      return FlSpot(index.toDouble(), rng.nextDouble() * 10);
    });
    final List<FlSpot> dummyDataDistance_Month =
        List.generate(lastDayOfMonth.day, (index) {
      return FlSpot(index.toDouble(), rng.nextDouble() * 10);
    });

    Sizer.init(context);
    return Localizations(
        locale: Locale('en', 'US'),
        delegates: const <LocalizationsDelegate<dynamic>>[
          DefaultWidgetsLocalizations.delegate,
          DefaultMaterialLocalizations.delegate,
        ],
        child: Scaffold(
            backgroundColor: Colors.white,
            bottomNavigationBar: NavBar(selected_index: 2),
            appBar: AppBar(
              leading: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.chevron_left_rounded,
                  color: Colors.black,
                ),
              ),
              elevation: 0,
              backgroundColor: Colors.white,
              actions: [
                IconButton(
                  icon: Icon(
                    Icons.settings,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const EditProfile();
                    }));
                  },
                )
              ],
            ),
            body: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(children: [
                  Container(
                      alignment: Alignment.center,
                      height: Sizer.sbh * 35,
                      width: Sizer.screenWidth,
                      child: Stack(children: [
                        CircleAvatar(
                          backgroundColor: Colors.white70,
                          minRadius: Sizer.sbh * 35,
                          child: CircleAvatar(
                            radius: Sizer.sbh * 30,
                            backgroundImage: NetworkImage(
                                "https://github.com/sudarshbuxyyes.png?size=250"),
                          ),
                        ),
                        Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                                width: Sizer.sbh * 20,
                                height: Sizer.sbv * 3.5,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: Colors.amber[600],
                                    border: Border(
                                      bottom: BorderSide(
                                        color: Colors.white,
                                        width: 2.0,
                                      ),
                                      top: BorderSide(
                                        color: Colors.white,
                                        width: 2.0,
                                      ),
                                      left: BorderSide(
                                        color: Colors.white,
                                        width: 2.0,
                                      ),
                                      right: BorderSide(
                                        color: Colors.white,
                                        width: 2.0,
                                      ),
                                    ),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: Sizer.sbh,
                                        blurRadius: Sizer.sbh * 0.75,
                                        offset: Offset(0, 3),
                                      )
                                    ]),
                                child: Text("Lvl. 4",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: Sizer.fss)))),
                      ])),
                  SizedBox(height: Sizer.sbv * 3),
                  Container(
                      alignment: Alignment.center,
                      child: Text(
                        "Username",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: Sizer.fsml,
                            color: Colors.black),
                      )),
                  SizedBox(height: Sizer.sbv * 3),
                  Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.3),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      height: Sizer.sbv * 4,
                      width: Sizer.sbh * 50,
                      child: Text("usernamexyz@gmail.com",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: Sizer.fss,
                              color: Colors.black.withOpacity(0.6)))),
                  SizedBox(height: Sizer.sbv * 3),
                  Container(
                    width: Sizer.screenWidth,
                    decoration: BoxDecoration(
                      border: Border.all(
                          width: 1, color: Colors.grey.withOpacity(0.3)),
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(10)),
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: Sizer.sbv * 2),
                        Container(
                          height: Sizer.sbv * 3,
                          width: Sizer.screenWidth * 0.6,
                          child: Stack(
                            children: [
                              LinearPercentIndicator(
                                lineHeight: Sizer.sbv * 3,
                                width: Sizer.screenWidth * 0.6,
                                barRadius: Radius.circular(10),
                                percent: 0.7,
                                backgroundColor: Colors.grey[200],
                                progressColor: Colors.amber[600],
                              ),
                              Positioned(
                                  left: Sizer.sbh * 5,
                                  child: Text("4",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: Sizer.fss,
                                          color: Colors.grey[100]))),
                              Positioned(
                                right: Sizer.sbh * 5,
                                child: Text(
                                  "5",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: Sizer.fss,
                                      color: Colors.amber[600]),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: Sizer.sbv * 1),
                        Container(
                            width: Sizer.screenWidth * 0.6,
                            child: Row(
                              children: [
                                SizedBox(width: Sizer.sbh),
                                Text("XP: 432/500",
                                    style: TextStyle(
                                        fontSize: Sizer.fss * 0.7,
                                        color: Colors.grey,
                                        fontWeight: FontWeight.bold)),
                                SizedBox(width: Sizer.sbh * 30),
                                Text("68 XP to Lvl 5",
                                    style: TextStyle(
                                        fontSize: Sizer.fss * 0.7,
                                        color: Colors.grey,
                                        fontWeight: FontWeight.bold))
                              ],
                            )),
                        SizedBox(height: Sizer.sbv * 2),
                      ],
                    ),
                  ),
                  Container(
                      width: Sizer.screenWidth,
                      decoration: BoxDecoration(
                        border: Border.all(
                            width: 1, color: Colors.grey.withOpacity(0.3)),
                        borderRadius:
                            BorderRadius.vertical(bottom: Radius.circular(10)),
                      ),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: List.generate(
                              tabs.length,
                              (index) => Padding(
                                  padding: EdgeInsets.all(Sizer.sbh * 4),
                                  child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          current_tab = index;
                                          tabs_visible = List.filled(3, false);
                                          tabs_visible[index] = true;
                                          print(tabs_visible);
                                        });
                                      },
                                      child: Container(
                                          alignment: Alignment.center,
                                          child: Text(tabs[index],
                                              style: TextStyle(
                                                  fontSize: Sizer.fss,
                                                  color: tabs_visible[index]
                                                      ? Colors.amber
                                                      : Colors.grey.withOpacity(
                                                          0.5))))))))),
                  SizedBox(height: Sizer.sbv * 2),
                  if (current_tab == 0) ...[
                    Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: Sizer.sbh * 10),
                        child: Container(
                            alignment: Alignment.centerLeft,
                            child: Text(tabs_title[current_tab],
                                style: TextStyle(
                                    fontSize: Sizer.fsm,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black)))),
                    SizedBox(height: Sizer.sbv * 2),
                    Container(
                        width: Sizer.screenWidth * 0.8,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            border: Border.all(
                                color: Colors.grey.withOpacity(0.3), width: 1)),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                DropdownButton<String>(
                                  value: dropdownValue,
                                  icon: Icon(Icons.keyboard_arrow_down),
                                  items: list.map<DropdownMenuItem<String>>(
                                      (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                  onChanged: (String? value) {
                                    setState(() {
                                      dropdownValue = value!;
                                    });
                                  },
                                ),
                                Column(children: [
                                  Container(
                                    child: Row(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.amber[400]),
                                        ),
                                        Text("XP")
                                      ],
                                    ),
                                  ),
                                  Container(
                                    child: Row(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.brown[400]),
                                        ),
                                        Text("Distance")
                                      ],
                                    ),
                                  )
                                ])
                              ],
                            ),
                            _graphCard(
                                dummyDataXP_Month,
                                dummyDataDistance_Month,
                                0,
                                10,
                                "Month",
                                context,
                                true),
                          ],
                        )),
                    SizedBox(height: Sizer.sbv * 2),
                    Container(
                        width: Sizer.screenWidth * 0.8,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            border: Border.all(
                                color: Colors.grey.withOpacity(0.3), width: 1)),
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(Sizer.sbh * 3),
                              child: Container(
                                  alignment: Alignment.centerLeft,
                                  width: Sizer.screenWidth,
                                  child: Text("Last Week's Stats:",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          decoration: TextDecoration.underline,
                                          fontSize: Sizer.fsm * 0.8,
                                          fontWeight: FontWeight.bold))),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: Sizer.sbh * 5),
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    radius: 3,
                                    backgroundColor: Colors.amber[400],
                                  ),
                                  SizedBox(
                                    width: Sizer.sbh * 2,
                                  ),
                                  Text("XP Earned : 432"),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: Sizer.sbv,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: Sizer.sbh * 5),
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    radius: 3,
                                    backgroundColor: Colors.brown[400],
                                  ),
                                  SizedBox(
                                    width: Sizer.sbh * 2,
                                  ),
                                  Text("Distance Travelled : 432"),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: Sizer.sbv,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: Sizer.sbh * 5),
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    radius: 3,
                                    backgroundColor: Colors.green[400],
                                  ),
                                  SizedBox(
                                    width: Sizer.sbh * 2,
                                  ),
                                  Text("Badges : 100 km badge, 200 km badge"),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: Sizer.sbv * 3,
                            ),
                          ],
                        )),
                    SizedBox(height: Sizer.sbv * 2),
                    Container(
                        width: Sizer.screenWidth * 0.8,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            border: Border.all(
                                color: Colors.grey.withOpacity(0.3), width: 1)),
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(Sizer.sbh * 3),
                              child: Container(
                                  alignment: Alignment.centerLeft,
                                  width: Sizer.screenWidth,
                                  child: Text("Last Month's Stats:",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          decoration: TextDecoration.underline,
                                          fontSize: Sizer.fsm * 0.8,
                                          fontWeight: FontWeight.bold))),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: Sizer.sbh * 5),
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    radius: 3,
                                    backgroundColor: Colors.amber[400],
                                  ),
                                  SizedBox(
                                    width: Sizer.sbh * 2,
                                  ),
                                  Text("XP Earned : 432"),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: Sizer.sbv,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: Sizer.sbh * 5),
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    radius: 3,
                                    backgroundColor: Colors.brown[400],
                                  ),
                                  SizedBox(
                                    width: Sizer.sbh * 2,
                                  ),
                                  Text("Distance Travelled : 432"),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: Sizer.sbv,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: Sizer.sbh * 5),
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    radius: 3,
                                    backgroundColor: Colors.green[400],
                                  ),
                                  SizedBox(
                                    width: Sizer.sbh * 2,
                                  ),
                                  Text("Badges : 100 km badge, 200 km badge"),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: Sizer.sbv * 3,
                            ),
                          ],
                        )),
                    SizedBox(height: Sizer.sbv * 2),
                  ] else if (current_tab == 1) ...[
                    Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: Sizer.sbh * 10),
                        child: Container(
                            alignment: Alignment.centerLeft,
                            child: Text("Badges (4)",
                                style: TextStyle(
                                    fontSize: Sizer.fsm,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black)))),
                    SizedBox(height: Sizer.sbv * 2),
                    Container(
                        height: Sizer.sbv * 10,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 4,
                          itemBuilder: (context, index) {
                            return Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: Sizer.sbh * 2),
                                child: Container(
                                    width: Sizer.sbv * 10,
                                    child: Card(
                                      child: Container(
                                        child: Image.asset(
                                          "assets/images/badge.png",
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    )));
                          },
                        )),
                    SizedBox(height: Sizer.sbv * 2),
                    Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: Sizer.sbh * 10),
                        child: Container(
                            alignment: Alignment.centerLeft,
                            child: Text("Achievements (7)",
                                style: TextStyle(
                                    fontSize: Sizer.fsm,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black)))),
                    SizedBox(height: Sizer.sbv * 2),
                    Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: Sizer.sbh * 10),
                        child: Container(
                          child: Column(
                              children: List.generate(
                                  7,
                                  (index) => Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: Sizer.sbv),
                                      child: Row(
                                        children: [
                                          Card(
                                              child: Container(
                                            width: Sizer.sbv * 5,
                                            height: Sizer.sbv * 5,
                                            child: Image.asset(
                                              "assets/images/off_roading.jpeg",
                                              fit: BoxFit.cover,
                                            ),
                                          )),
                                          Container(
                                              child: Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Text("Achievement Name"),
                                                  SizedBox(
                                                      width: Sizer.sbh * 10),
                                                  Text("+5 XP"),
                                                ],
                                              ),
                                              Text("Unlocked 5 days ago"),
                                            ],
                                          )),
                                        ],
                                      )))),
                        ))
                  ] else ...[
                    Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: Sizer.sbh * 5),
                        child: Container(
                            alignment: Alignment.centerLeft,
                            child: Text("Activity",
                                style: TextStyle(
                                    fontSize: Sizer.fsml,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black)))),
                    SizedBox(height: Sizer.sbv * 2),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Padding(
                                padding: EdgeInsets.all(Sizer.sbh * 3),
                                child: Container(
                                    height: Sizer.sbv * 10,
                                    width: Sizer.sbh * 45,
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: Sizer.sbh * 2),
                                          child: CircleAvatar(
                                            backgroundColor: Colors.red[100],
                                            child: Icon(Icons.map_outlined,
                                                color: Colors.red[600]),
                                          ),
                                        ),
                                        Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: Sizer.sbh),
                                            child: Column(
                                              children: [
                                                SizedBox(
                                                  height: Sizer.sbv,
                                                ),
                                                Text(
                                                  "123 km",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: Sizer.fsm),
                                                ),
                                                Text(
                                                  "Distance",
                                                  style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: Sizer.fss,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: Sizer.sbv,
                                                ),
                                              ],
                                            ))
                                      ],
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: 2,
                                          blurRadius: 5,
                                          offset: Offset(0,
                                              3), // changes position of shadow
                                        ),
                                      ],
                                    ))),
                            Padding(
                                padding: EdgeInsets.all(Sizer.sbh * 3),
                                child: Container(
                                    height: Sizer.sbv * 10,
                                    width: Sizer.sbh * 45,
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: Sizer.sbh * 2),
                                          child: CircleAvatar(
                                            backgroundColor: Colors.blue[100],
                                            child: Icon(Icons.bar_chart_rounded,
                                                color: Colors.blue[600]),
                                          ),
                                        ),
                                        Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: Sizer.sbh),
                                            child: Column(
                                              children: [
                                                SizedBox(
                                                  height: Sizer.sbv,
                                                ),
                                                Text(
                                                  "#3",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: Sizer.fsm),
                                                ),
                                                Text(
                                                  "Leaderboard",
                                                  style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: Sizer.fss,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: Sizer.sbv,
                                                ),
                                              ],
                                            ))
                                      ],
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: 2,
                                          blurRadius: 5,
                                          offset: Offset(0,
                                              3), // changes position of shadow
                                        ),
                                      ],
                                    ))),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Padding(
                                padding: EdgeInsets.all(Sizer.sbh * 3),
                                child: Container(
                                    height: Sizer.sbv * 10,
                                    width: Sizer.sbh * 45,
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: Sizer.sbh * 2),
                                          child: CircleAvatar(
                                            backgroundColor: Colors.green[100],
                                            child: Icon(Icons.event,
                                                color: Colors.green[600]),
                                          ),
                                        ),
                                        Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: Sizer.sbh),
                                            child: Column(
                                              children: [
                                                SizedBox(
                                                  height: Sizer.sbv,
                                                ),
                                                Text(
                                                  "13",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: Sizer.fsm),
                                                ),
                                                Text(
                                                  "Events Attended",
                                                  style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: Sizer.fss,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: Sizer.sbv,
                                                ),
                                              ],
                                            ))
                                      ],
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: 2,
                                          blurRadius: 5,
                                          offset: Offset(0,
                                              3), // changes position of shadow
                                        ),
                                      ],
                                    ))),
                            Padding(
                                padding: EdgeInsets.all(Sizer.sbh * 3),
                                child: Container(
                                    height: Sizer.sbv * 10,
                                    width: Sizer.sbh * 45,
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: Sizer.sbh * 2),
                                          child: CircleAvatar(
                                            backgroundColor: Colors.yellow[100],
                                            child: Icon(Icons.check,
                                                color: Color.fromRGBO(
                                                    206, 171, 17, 1)),
                                          ),
                                        ),
                                        Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: Sizer.sbh),
                                            child: Column(
                                              children: [
                                                SizedBox(
                                                  height: Sizer.sbv,
                                                ),
                                                Text(
                                                  "70 %",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: Sizer.fsm),
                                                ),
                                                Text(
                                                  "Consistency",
                                                  style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: Sizer.fss,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: Sizer.sbv,
                                                ),
                                              ],
                                            ))
                                      ],
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: 2,
                                          blurRadius: 5,
                                          offset: Offset(0,
                                              3), // changes position of shadow
                                        ),
                                      ],
                                    ))),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: Sizer.sbv * 2,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: Sizer.sbh * 3),
                      child: Container(
                          width: Sizer.screenWidth,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.amber[500],
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: Sizer.sbv * 2,
                                    horizontal: Sizer.sbh * 4),
                                child: Container(
                                    width: Sizer.screenWidth,
                                    child: Text(
                                      "Next Quests",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: Sizer.fss,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    )),
                              ),
                              Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: Sizer.sbh * 2,
                                    vertical: Sizer.sbv * 2,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                          child: Row(
                                        children: [
                                          Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: Sizer.sbh * 2),
                                              child: Icon(Icons.waving_hand,
                                                  color: Colors.white,
                                                  size: Sizer.fss)),
                                          Text(
                                            "Say Hi to 5 people",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: Sizer.fss),
                                          )
                                        ],
                                      )),
                                      Container(
                                        child: Row(
                                          children: [
                                            Icon(Icons.star_rounded,
                                                color: Colors.white,
                                                size: Sizer.fss),
                                            Text("20 XP",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: Sizer.fss)),
                                          ],
                                        ),
                                      ),
                                    ],
                                  )),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: Sizer.sbh * 2),
                                child: Divider(
                                  color: Colors.white,
                                  thickness: 1,
                                ),
                              ),
                              Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: Sizer.sbh * 2,
                                    vertical: Sizer.sbv * 2,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                          child: Row(
                                        children: [
                                          Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: Sizer.sbh * 2),
                                              child: Icon(Icons.paid_outlined,
                                                  color: Colors.white,
                                                  size: Sizer.fss)),
                                          Text(
                                            "Go Premium!",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: Sizer.fss),
                                          )
                                        ],
                                      )),
                                      Container(
                                        child: Row(
                                          children: [
                                            Icon(Icons.star_rounded,
                                                color: Colors.white,
                                                size: Sizer.fss),
                                            Text("100 XP",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: Sizer.fss)),
                                          ],
                                        ),
                                      ),
                                    ],
                                  )),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: Sizer.sbh * 2),
                                child: Divider(
                                  color: Colors.white,
                                  thickness: 1,
                                ),
                              ),
                              Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: Sizer.sbh * 2,
                                    vertical: Sizer.sbv * 2,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                          child: Row(
                                        children: [
                                          Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: Sizer.sbh * 2),
                                              child: Icon(Icons.fireplace,
                                                  color: Colors.white,
                                                  size: Sizer.fss)),
                                          Text(
                                            "Streak of 5 : Attend 5 Consecutive Events",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: Sizer.fss),
                                          )
                                        ],
                                      )),
                                      Container(
                                        child: Row(
                                          children: [
                                            Icon(Icons.star_rounded,
                                                color: Colors.white,
                                                size: Sizer.fss),
                                            Text("50 XP",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: Sizer.fss)),
                                          ],
                                        ),
                                      ),
                                    ],
                                  )),
                              // Padding(
                              //   padding: EdgeInsets.symmetric(
                              //       horizontal: Sizer.sbh * 2),
                              //   child: Divider(
                              //     color: Colors.white,
                              //     thickness: 1,
                              //   ),
                              // ),
                              // Padding(
                              //   padding: EdgeInsets.symmetric(
                              //     horizontal: Sizer.sbh * 2,
                              //   ),
                              //   child: Container(
                              //       width: Sizer.screenWidth,
                              //       // color: Colors.blue,
                              //       child: Text(
                              //         "See All",
                              //         textAlign: TextAlign.left,
                              //         style: TextStyle(
                              //             color: Colors.white,
                              //             fontSize: Sizer.fss),
                              //       )),
                              // ),
                              SizedBox(
                                height: Sizer.sbv,
                              )
                            ],
                          )),
                    ),
                    SizedBox(
                      height: Sizer.sbv * 5,
                    ),
                    // Padding(
                    //     padding:
                    //         EdgeInsets.symmetric(horizontal: Sizer.sbh * 3),
                    //     child: Container(
                    //         width: Sizer.screenWidth,
                    //         decoration: BoxDecoration(
                    //             borderRadius: BorderRadius.circular(10),
                    //             color: Colors.amber[400]),
                    //         child: Column(
                    //           children: [
                    //             Padding(
                    //                 padding: EdgeInsets.symmetric(vertical: 0),
                    //                 child: Row(
                    //                   mainAxisAlignment:
                    //                       MainAxisAlignment.spaceAround,
                    //                   children: [
                    //                     Padding(
                    //                         padding: EdgeInsets.symmetric(
                    //                             horizontal: Sizer.sbh * 2),
                    //                         child: Column(
                    //                           children: [
                    //                             Text(
                    //                               "1",
                    //                               style: TextStyle(
                    //                                   color: Colors.white,
                    //                                   fontSize: Sizer.fss),
                    //                             ),
                    //                             Icon(
                    //                                 Icons.arrow_drop_up_rounded,
                    //                                 color: Colors.green[700],
                    //                                 size: Sizer.fss),
                    //                           ],
                    //                         )),
                    //                     Container(
                    //                       height: Sizer.sbv * 4,
                    //                       width: Sizer.screenWidth * 0.6,
                    //                       decoration: BoxDecoration(
                    //                         borderRadius:
                    //                             BorderRadius.circular(15),
                    //                         color: Color.fromARGB(
                    //                             91, 165, 165, 165),
                    //                       ),
                    //                       child: Row(
                    //                         children: [
                    //                           CircleAvatar(
                    //                             radius: 15,
                    //                             backgroundColor:
                    //                                 Colors.transparent,
                    //                             child: ClipOval(
                    //                               child: Image.network(
                    //                                 "",
                    //                                 fit: BoxFit.cover,
                    //                               ),
                    //                             ),
                    //                           ),
                    //                           SizedBox(
                    //                             width: Sizer.sbh * 2,
                    //                           ),
                    //                           Padding(
                    //                               padding: EdgeInsets.symmetric(
                    //                                   horizontal:
                    //                                       Sizer.sbh * 2),
                    //                               child: Text(
                    //                                 "John Doe",
                    //                                 style: TextStyle(
                    //                                     color: Colors.white,
                    //                                     fontSize: Sizer.fss),
                    //                               )),
                    //                           SizedBox(
                    //                             width: Sizer.sbh * 15,
                    //                           ),
                    //                           Padding(
                    //                               padding: EdgeInsets.symmetric(
                    //                                   horizontal:
                    //                                       Sizer.sbh * 2),
                    //                               child: Text(
                    //                                 "1234 XP",
                    //                                 style: TextStyle(
                    //                                     color:
                    //                                         Colors.green[900],
                    //                                     fontSize: Sizer.fss),
                    //                               )),
                    //                         ],
                    //                       ),
                    //                     ),
                    //                   ],
                    //                 ))
                    //           ],
                    //         )))
                  ]
                ]))));
  }
}

Container _graphCard(
  List<FlSpot> dummyData2,
  List<FlSpot> dummyData1,
  double min,
  double max,
  String label,
  BuildContext context,
  bool monthView,
) {
  var dummyData1_avg =
      dummyData1.map((e) => e.y).reduce((value, element) => value + element) /
          dummyData1.length;
  var dummyData2_avg =
      dummyData2.map((e) => e.y).reduce((value, element) => value + element) /
          dummyData2.length;

  // isUp = false;
  return Container(
    margin: const EdgeInsets.all(20),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
    ),
    width: double.infinity,
    child: Column(
      children: [
        Container(
            height: 55,
            width: 150,
            alignment: Alignment(2.0, 1.0),
            child: Row(
              children: [
                Text(
                  "Average XP: ${(dummyData1_avg).round()}%",
                  style: TextStyle(
                      fontSize: 12,
                      color: Color.fromRGBO(218, 224, 225, 1),
                      // fontFamily: Fonts.lato,
                      fontStyle: FontStyle.italic),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(width: 10),
                Container(
                    child: Icon(
                  Icons.trending_up,
                  color: Color.fromARGB(206, 121, 216, 143),
                  size: 15,
                ))
                // Icon(
                //   arrow_upward,
                //   color: Color.fromARGB(206, 121, 216, 143),
                //   size: 15,
                // ),
              ],
            )),
        Container(
            height: 180,
            color: Colors.white,
            child: LineChart(
              LineChartData(
                borderData: FlBorderData(show: false),
                gridData: FlGridData(show: true),
                titlesData: FlTitlesData(
                  show: true,
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  bottomTitles: AxisTitles(sideTitles: SideTitles()),
                  rightTitles: AxisTitles(sideTitles: SideTitles()),
                  topTitles: AxisTitles(sideTitles: SideTitles()),
                ),
                lineTouchData: LineTouchData(
                  enabled: true,
                  touchTooltipData: LineTouchTooltipData(
                    tooltipBgColor: Color.fromARGB(255, 194, 198, 198),
                    tooltipRoundedRadius: 1,
                  ),
                  handleBuiltInTouches: true,
                  touchSpotThreshold: 15,
                ),
                minY: min,
                maxY: max,
                lineBarsData: [
                  LineChartBarData(
                    isCurved: true,
                    barWidth: 1,
                    show: true,
                    isStrokeCapRound: true,
                    dotData: FlDotData(show: false),
                    color: Colors.grey,
                    spots: dummyData2,
                  ),
                  LineChartBarData(
                    isCurved: true,
                    barWidth: 5,
                    isStrokeCapRound: true,
                    dotData: FlDotData(show: false),
                    gradient: LinearGradient(colors: [
                      Color.fromARGB(255, 255, 193, 7),
                      Color.fromARGB(255, 255, 179, 0),
                      Color.fromARGB(255, 255, 143, 0),
                      Color.fromRGBO(255, 111, 0, 1)
                    ]),
                    color: Theme.of(context).colorScheme.surface,
                    spots: dummyData1,
                    shadow: Shadow(
                      color: Colors.amber.withOpacity(0.2),
                      blurRadius: 4,
                      offset: Offset(15, 10),
                    ),
                  ),
                ],
              ),
            )),
        const SizedBox(height: 10),
      ],
    ),
  );
}
