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
      id: "1",
      otr_name: "OTR 1",
      created_date: DateTime.now().toString(),
      updated_date: DateTime.now().toString(),
      address_id: "Location 1",
      has_special_badge: false,
      otr_end_date: DateTime.now().toString(),
      cost: 100,
      mode: 'OFFLINE',
      participant_count: 5,
      max_participant_count: 50,
      image_links: [],
      locations: [],
    ),
    OTREvent(
      id: "2",
      otr_name: "OTR 2",
      has_special_badge: false,
      created_date: DateTime.now().toString(),
      updated_date: DateTime.now().toString(),
      address_id: "Location 1",
      otr_end_date: DateTime.now().toString(),
      cost: 100,
      mode: 'OFFLINE',
      participant_count: 5,
      max_participant_count: 50,
      image_links: [],
      locations: [],
    )
  ];

  final past_otrs = [
    OTREvent(
      id: "1",
      has_special_badge: false,
      otr_name: "OTR 1",
      created_date: DateTime.now().toString(),
      updated_date: DateTime.now().toString(),
      address_id: "Location 1",
      otr_end_date: DateTime.now().toString(),
      cost: 100,
      mode: 'OFFLINE',
      participant_count: 5,
      max_participant_count: 50,
      image_links: [],
      locations: [],
    ),
    OTREvent(
      id: "2",
      otr_name: "OTR 1",
      created_date: DateTime.now().toString(),
      updated_date: DateTime.now().toString(),
      has_special_badge: false,
      address_id: "Location 1",
      otr_end_date: DateTime.now().toString(),
      cost: 100,
      mode: 'OFFLINE',
      participant_count: 5,
      max_participant_count: 50,
      image_links: [],
      locations: [],
    ),
    OTREvent(
      id: "3",
      otr_name: "OTR 3",
      created_date: DateTime.now().toString(),
      updated_date: DateTime.now().toString(),
      address_id: "Location 1",
      has_special_badge: false,
      otr_end_date: DateTime.now().toString(),
      cost: 100,
      mode: 'OFFLINE',
      participant_count: 5,
      max_participant_count: 50,
      image_links: [],
      locations: [],
    ),
    OTREvent(
      id: "4",
      otr_name: "OTR 4",
      created_date: DateTime.now().toString(),
      updated_date: DateTime.now().toString(),
      has_special_badge: false,
      address_id: "Location 1",
      otr_end_date: DateTime.now().toString(),
      cost: 100,
      mode: 'OFFLINE',
      participant_count: 5,
      max_participant_count: 50,
      image_links: [],
      locations: [],
    ),
    OTREvent(
      id: "5",
      otr_name: "OTR 5",
      has_special_badge: false,
      created_date: DateTime.now().toString(),
      updated_date: DateTime.now().toString(),
      address_id: "Location 1",
      otr_end_date: DateTime.now().toString(),
      cost: 100,
      mode: 'OFFLINE',
      participant_count: 5,
      max_participant_count: 50,
      image_links: [],
      locations: [],
    ),
    OTREvent(
      id: "6",
      otr_name: "OTR 6",
      has_special_badge: false,
      created_date: DateTime.now().toString(),
      updated_date: DateTime.now().toString(),
      address_id: "Location 1",
      otr_end_date: DateTime.now().toString(),
      cost: 100,
      mode: 'OFFLINE',
      participant_count: 5,
      max_participant_count: 50,
      image_links: [],
      locations: [],
    ),
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
