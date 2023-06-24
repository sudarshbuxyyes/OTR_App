import 'package:app/models/Event.dart';
import 'package:app/screens/events/eventDetails.dart';
import 'package:app/utils/Sizer.dart';
import 'package:app/widgets/EventCard.dart';
import 'package:app/widgets/NavBar.dart';
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
        num_participants: 12,
        num_limit: 50,
        Event_ongoing: true),
    Event(
        EventID: 2,
        EventName: "Event 2",
        EventDescription: "Description for Event 2",
        EventDate: DateTime.now(),
        EventLocation: "Location for Event 2",
        Event_attended: true,
        num_participants: 34,
        num_limit: 50,
        Event_ongoing: true),
    Event(
        EventID: 3,
        EventName: "Event 3",
        EventDescription: "Description for Event 3",
        EventDate: DateTime.now(),
        EventLocation: "Location for Event 3",
        Event_attended: true,
        num_participants: 23,
        num_limit: 50,
        Event_ongoing: true),
    Event(
        EventID: 4,
        EventName: "Event 4",
        EventDescription: "Description for Event 4",
        EventDate: DateTime.now(),
        EventLocation: "Location for Event 4",
        Event_attended: false,
        num_participants: 47,
        num_limit: 50,
        Event_ongoing: true),
    Event(
        EventID: 5,
        EventName: "Event 5",
        EventDescription: "Description for Event 5",
        EventDate: DateTime.now(),
        EventLocation: "Location for Event 5",
        Event_attended: false,
        num_participants: 13,
        num_limit: 50,
        Event_ongoing: true),
    Event(
        EventID: 6,
        EventName: "Event 6",
        EventDescription: "Description for Event 6",
        EventDate: DateTime.now(),
        EventLocation: "Location for Event 6",
        Event_attended: false,
        num_participants: 23,
        num_limit: 50,
        Event_ongoing: true),
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
          bottomNavigationBar: NavBar(selected_index: 1),
          backgroundColor: Colors.grey[100],
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.white,
            elevation: 0.2,
            title: const Text(
              "Active Events",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color.fromARGB(255, 215, 162, 3),
                  letterSpacing: 0.5,
                  wordSpacing: 1.2),
            ),
            leading: Container(),
          ),
          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(children: [
              SizedBox(height: Sizer.sbv * 2),
              Container(
                // Add padding around the search bar
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                width: Sizer.screenWidth * 0.9,
                // Use a Material design search bar
                child: TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[200],
                    hintText: 'Search Event Name',
                    hintStyle: TextStyle(
                        color: Colors.grey[400],
                        fontSize: Sizer.fss * 1.2,
                        letterSpacing: 0.3,
                        wordSpacing: 1.0),
                    // Add a clear button to the search bar
                    suffixIcon: IconButton(
                      icon: Icon(Icons.clear),
                      onPressed: () => _searchController.clear(),
                    ),
                    // Add a search icon or button to the search bar
                    prefixIcon: IconButton(
                      icon: Icon(Icons.search),
                      color: Colors.black54,
                      onPressed: () {
                        // Perform the search here
                      },
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: BorderSide.none,
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
