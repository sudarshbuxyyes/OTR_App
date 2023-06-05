import 'package:app/models/Event.dart';
import 'package:app/screens/events/eventDetails.dart';
import 'package:app/utils/Sizer.dart';
import 'package:app/widgets/EventCard.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

class EventsHome extends StatefulWidget {
  const EventsHome({Key? key}) : super(key: key);

  @override
  State<EventsHome> createState() => _EventsHomeState();
}

class _EventsHomeState extends State<EventsHome> {
  final items = [
    'assets/images/off_roading.jpeg',
    'assets/images/otr_adventures.png',
    'assets/images/otr.jpeg'
  ];
  int currentIndex = 0;
  final TextEditingController _searchController = TextEditingController();

  //dummy data for events to generate event cards//
  final ongoing_events = [
    Event(
        EventID: 1,
        EventName: "Event 1",
        EventDescription: "Description for Event 1",
        EventDate: DateTime.now(),
        EventLocation: "Location for Event 1",
        Event_attended: false,
        num_participants: 123),
    Event(
        EventID: 2,
        EventName: "Event 2",
        EventDescription: "Description for Event 2",
        EventDate: DateTime.now(),
        EventLocation: "Location for Event 2",
        Event_attended: true,
        num_participants: 123),
    Event(
        EventID: 3,
        EventName: "Event 3",
        EventDescription: "Description for Event 3",
        EventDate: DateTime.now(),
        EventLocation: "Location for Event 3",
        Event_attended: true,
        num_participants: 123),
    Event(
        EventID: 4,
        EventName: "Event 4",
        EventDescription: "Description for Event 4",
        EventDate: DateTime.now(),
        EventLocation: "Location for Event 4",
        Event_attended: false,
        num_participants: 123),
    Event(
        EventID: 5,
        EventName: "Event 5",
        EventDescription: "Description for Event 5",
        EventDate: DateTime.now(),
        EventLocation: "Location for Event 5",
        Event_attended: false,
        num_participants: 123),
    Event(
        EventID: 6,
        EventName: "Event 6",
        EventDescription: "Description for Event 6",
        EventDate: DateTime.now(),
        EventLocation: "Location for Event 6",
        Event_attended: false,
        num_participants: 123),
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
            title: const Text(
              "Active Events",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.amber),
            ),
            leading: Container(),
          ),
          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(children: [
              SizedBox(height: Sizer.sbv * 2),
              Container(
                // Add padding around the search bar
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                // Use a Material design search bar
                child: TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    hintText: 'Search...',
                    // Add a clear button to the search bar
                    suffixIcon: IconButton(
                      icon: Icon(Icons.clear),
                      onPressed: () => _searchController.clear(),
                    ),
                    // Add a search icon or button to the search bar
                    prefixIcon: IconButton(
                      icon: Icon(Icons.search),
                      onPressed: () {
                        // Perform the search here
                      },
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                ),
              ),
              SizedBox(height: Sizer.sbv * 2),
              CarouselSlider(
                options: CarouselOptions(
                  height: Sizer.sbv * 40,
                  autoPlay: false,
                  aspectRatio: 1.0,
                  enlargeCenterPage: false,
                  onPageChanged: (index, reason) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                ),
                items: items.map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        margin: EdgeInsets.all(Sizer.sbh),
                        padding:
                            EdgeInsets.symmetric(horizontal: Sizer.sbh * 2),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                                image: AssetImage(i), fit: BoxFit.cover)),
                        width: Sizer.screenWidth * 0.8,
                      );
                    },
                  );
                }).toList(),
              ),
              DotsIndicator(
                dotsCount: items.length,
                position: currentIndex,
                decorator: DotsDecorator(
                  activeColor: Colors.orange,
                  color: Color.fromARGB(255, 212, 212, 212),
                  size: Size.square(10.0),
                  activeSize: Size(20.0, 10.0),
                  activeShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0)),
                ),
              ),
              SizedBox(height: Sizer.sbv * 2),
              Container(
                child: Column(
                    children: List.generate(
                        ongoing_events.length,
                        (index) => Padding(
                            padding: EdgeInsets.all(Sizer.sbv),
                            child: EventCard(
                                event: ongoing_events[index],
                                showCover: true)))),
              )
            ]),
          ),
        ));
  }
}
