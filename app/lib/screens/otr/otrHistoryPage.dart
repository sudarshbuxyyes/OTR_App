import 'package:app/models/OTREvent.dart';
import 'package:app/widgets/OTREventHistoryCard.dart';
import 'package:flutter/material.dart';

import '../../utils/Sizer.dart';

class OTRHistory extends StatefulWidget {
  const OTRHistory({Key? key}) : super(key: key);

  @override
  State<OTRHistory> createState() => _OTRHistoryState();
}

class _OTRHistoryState extends State<OTRHistory> {
  //dummy data for creating the history page.

  final recent_otrs = [
    OTREvent(
        EventID: 1,
        EventName: "OTR 1",
        EventDescription: "Description for OTR 1",
        EventDate: DateTime.now(),
        EventLocation: "Location for OTR 1",
        Event_attended: false,
        EventDistance: 123),
    OTREvent(
        EventID: 2,
        EventName: "OTR 2",
        EventDescription: "Description for OTR 2",
        EventDate: DateTime.now(),
        EventLocation: "Location for OTR 2",
        Event_attended: true,
        EventDistance: 123),
  ];

  final past_otrs = [
    OTREvent(
        EventID: 1,
        EventName: "OTR 1",
        EventDescription: "Description for OTR 1",
        EventDate: DateTime.now(),
        EventLocation: "Location for OTR 1",
        Event_attended: false,
        EventDistance: 123),
    OTREvent(
        EventID: 2,
        EventName: "OTR 2",
        EventDescription: "Description for OTR 2",
        EventDate: DateTime.now(),
        EventLocation: "Location for OTR 2",
        Event_attended: true,
        EventDistance: 123),
    OTREvent(
        EventID: 3,
        EventName: "OTR 3",
        EventDescription: "Description for OTR 3",
        EventDate: DateTime.now(),
        EventLocation: "Location for OTR 3",
        Event_attended: true,
        EventDistance: 123),
    OTREvent(
        EventID: 4,
        EventName: "OTR 4",
        EventDescription: "Description for OTR 4",
        EventDate: DateTime.now(),
        EventLocation: "Location for OTR 4",
        Event_attended: false,
        EventDistance: 123),
    OTREvent(
        EventID: 5,
        EventName: "OTR 5",
        EventDescription: "Description for OTR 5",
        EventDate: DateTime.now(),
        EventLocation: "Location for OTR 5",
        Event_attended: false,
        EventDistance: 123),
    OTREvent(
        EventID: 6,
        EventName: "OTR 6",
        EventDescription: "Description for OTR 6",
        EventDate: DateTime.now(),
        EventLocation: "Location for OTR 6",
        Event_attended: false,
        EventDistance: 123),
  ];

  @override
  Widget build(BuildContext context) {
    Sizer.init(context);
    return Localizations(
        locale: Locale('en', 'US'),
        delegates: const <LocalizationsDelegate<dynamic>>[
          DefaultWidgetsLocalizations.delegate,
          DefaultMaterialLocalizations.delegate,
        ],
        child: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text("Your OTR History"),
              leading: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.chevron_left_rounded)),
              backgroundColor: Colors.orangeAccent,
            ),
            body: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    SizedBox(
                      height: Sizer.sbv * 3,
                    ),
                    Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: Sizer.sbh * 10),
                        child: Container(
                            alignment: Alignment.center,
                            height: Sizer.sbv * 5,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Recent OTRs",
                                  style: TextStyle(
                                      fontSize: Sizer.fss,
                                      fontWeight: FontWeight.bold,
                                      decoration: TextDecoration.underline,
                                      color: Colors.black),
                                ),
                                Icon(Icons.history, color: Colors.black)
                              ],
                            ))),
                    SizedBox(height: Sizer.sbv * 3),
                    Container(
                        width: Sizer.screenWidth * 0.8,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey[200]),
                        child: Column(
                            children: List.generate(
                                recent_otrs.length,
                                (index) => Padding(
                                    padding: EdgeInsets.all(Sizer.sbh * 3.5),
                                    child: OTREventHistoryCard(
                                        event: recent_otrs[index]))))),
                    SizedBox(
                      height: Sizer.sbv * 3,
                    ),
                    Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: Sizer.sbh * 10),
                        child: Container(
                            alignment: Alignment.center,
                            height: Sizer.sbv * 5,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Past OTRs",
                                  style: TextStyle(
                                      fontSize: Sizer.fss,
                                      fontWeight: FontWeight.bold,
                                      decoration: TextDecoration.underline,
                                      color: Colors.black),
                                ),
                              ],
                            ))),
                    SizedBox(height: Sizer.sbv * 3),
                    Container(
                        width: Sizer.screenWidth * 0.8,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey[200]),
                        child: Column(
                            children: List.generate(
                                past_otrs.length,
                                (index) => Padding(
                                    padding: EdgeInsets.all(Sizer.sbh * 3.5),
                                    child: OTREventHistoryCard(
                                        event: past_otrs[index]))))),
                  ],
                ))));
  }
}
