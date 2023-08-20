import 'package:app/models/Badge.dart';
import 'package:app/models/User.dart';
import 'package:app/services/api_services.dart';
import 'package:app/services/userProvider.dart';
import 'package:app/utils/Sizer.dart';
import 'package:app/widgets/NavBar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DisplayBadges extends StatefulWidget {
  const DisplayBadges({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _DisplayBadgeState();
}

class _DisplayBadgeState extends State<DisplayBadges> {
  late Future<List<Badge>> _badges;
  @override
  void initState() {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    _badges = ApiService().getBadges(userProvider.user!.access_token);
  }

  late Widget result = Center();
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
            backgroundColor: Colors.grey[50],
            bottomNavigationBar: NavBar(selected_index: 2),
            appBar: AppBar(
              centerTitle: true,
              title: Text(
                "Badges",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: Sizer.fsm * 0.9,
                    letterSpacing: 1.0),
              ),
              leading: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.chevron_left_rounded,
                  color: Colors.black,
                ),
              ),
              elevation: 0.3,
              backgroundColor: Colors.white,
            ),
            body: FutureBuilder<List<String>>(builder:
                (BuildContext context, AsyncSnapshot<List<String>> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text('Error: ${snapshot.error}'),
                );
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return Center(
                  child: Text('No data available.'),
                );
              } else {
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text("Badge"),
                    );
                  },
                );
              }
            })));
  }
}
