import 'package:custom_navigator/custom_navigator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_netflix_cover/Pages/ComingSoonPage.dart';
import 'package:flutter_netflix_cover/Pages/HomePage.dart';
import 'package:flutter_netflix_cover/Pages/MorePage.dart';
import 'package:flutter_netflix_cover/Pages/SearchPage.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  int notificationCount = 0;

  List<Widget> pages = [
    HomePage(),
    SearchPage(),
    ComingSoonPage(),
    HomePage(),
    MorePage()
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomNavigator(
        home: pages[currentIndex],
        navigatorKey: navigatorKey,
        pageRoute: PageRoutes.cupertinoPageRoute,
      ),
      bottomNavigationBar: CupertinoTabBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            navigatorKey.currentState!.maybePop();
            currentIndex = index;
            notificationCount++;
          });
        },
        backgroundColor: Colors.black,
        activeColor: Colors.white,
        inactiveColor: Colors.grey,
        iconSize: 24.0,
        items: [
          BottomNavigationBarItem(icon: _buildHomeItemWithNotification(), title: Text(AppLocalizations.of(context)!.home)),
          BottomNavigationBarItem(icon: Icon(Icons.search), title: Text(AppLocalizations.of(context)!.search)),
          BottomNavigationBarItem(icon: Icon(Icons.featured_play_list), title: Text(AppLocalizations.of(context)!.coming)),
          BottomNavigationBarItem(icon: Icon(Icons.file_download), title: Text(AppLocalizations.of(context)!.download)),
          BottomNavigationBarItem(icon: Icon(Icons.more_vert), title: Text(AppLocalizations.of(context)!.more)),
        ],
      ),
    );
  }

  Widget _buildHomeItemWithNotification() {
    return Stack(
      children: [
        Icon(Icons.home),
        if (notificationCount != 0) Positioned(
          top: 0.0,
          right: 0.0,
          child: Transform.translate(
            offset: Offset(3, -3),
            child: Container(
              padding: EdgeInsets.all(1.0),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(6.0)
              ),
              constraints: BoxConstraints(
                minHeight: 12.0,
                minWidth: 12.0
              ),
              child: Text('$notificationCount', style: TextStyle(color: Colors.white, fontSize: 10.0), textAlign: TextAlign.center,)
            ),
          ),
        )
      ],
    );
  }
}
