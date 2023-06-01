import 'package:app/screens/events/eventsHome.dart';
import 'package:app/screens/otr/otrEventPage.dart';
import 'package:app/screens/profile/profilePage.dart';
import 'package:app/screens/shop/shopHome.dart';
import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  NavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int _selectedIndex = 0;
    List<BottomNavigationBarItem> _bottomBar = [
      BottomNavigationBarItem(
          icon: Icon(
            Icons.location_on,
            color: Colors.amber,
          ),
          label: 'OTR'),
      BottomNavigationBarItem(
          icon: Icon(
            Icons.event,
            color: Colors.amber,
          ),
          label: 'Events'),
      BottomNavigationBarItem(
          icon: Icon(
            Icons.person,
            color: Colors.amber,
          ),
          label: 'Profile'),
      BottomNavigationBarItem(
          icon: Icon(
            Icons.shopping_cart,
            color: Colors.amber,
          ),
          label: 'Shop'),
    ];
    return BottomNavigationBar(
        items: _bottomBar,
        currentIndex: _selectedIndex,
        onTap: (value) {
          setState() {
            _selectedIndex = value;
          }

          // switch case for value
          switch (value) {
            case 1:
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => EventsHome()));
              return;
            case 2:
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const ProfilePage()));
              return;
            case 3:
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ShoppingHome()));
              break;
            default:
          }
        });
  }
}
