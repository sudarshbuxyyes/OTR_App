import 'package:app/screens/events/eventsHome.dart';
import 'package:app/screens/otr/otrEventPage.dart';
import 'package:app/screens/otr/otrHome.dart';
import 'package:app/screens/profile/profilePage.dart';
import 'package:app/screens/shop/shopHome.dart';
import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  NavBar({Key? key, required int this.selected_index}) : super(key: key);
  int selected_index;

  @override
  Widget build(BuildContext context) {
    List<BottomNavigationBarItem> _bottomBar = [
      BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
            color: Colors.amber,
          ),
          label: 'OTR'),
      BottomNavigationBarItem(
          icon: new Image.asset(
            'assets/images/otr_icon.png',
            width: 30,
            height: 30,
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
        label: 'Shop',
      ),
    ];
    return BottomNavigationBar(
        backgroundColor: Colors.black,
        items: _bottomBar,
        currentIndex: selected_index,
        onTap: (value) {
          setState() {
            this.selected_index = value;
          }

          // switch case for value
          switch (value) {
            case 0:
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => OTRHome()));
              return;
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
