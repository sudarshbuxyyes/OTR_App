import 'package:app/cafe/CafePage.dart';
import 'package:app/utils/generateQR.dart';
import 'package:flutter/material.dart';

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text(
              'Welcome',
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
            decoration: BoxDecoration(
                color: Colors.amber[600],
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/images/otr.jpg'))),
          ),
          ListTile(
            leading: Icon(Icons.input),
            title: Text('OTR Cafe'),
            onTap: () => {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const CafeHome()))
            },
          ),
          ListTile(
            leading: Icon(Icons.verified_user),
            title: Text('Moderator'),
            onTap: () => {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const GenerateQR()))
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.border_color),
            title: Text('Feedback'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap: () => {Navigator.of(context).pop()},
          ),
        ],
      ),
    );
  }
}
