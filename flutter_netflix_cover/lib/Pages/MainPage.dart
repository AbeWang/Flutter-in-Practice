import 'package:custom_navigator/custom_navigator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_netflix_cover/Pages/ComingSoonPage.dart';
import 'package:flutter_netflix_cover/Pages/HomePage.dart';
import 'package:flutter_netflix_cover/Pages/MorePage.dart';
import 'package:flutter_netflix_cover/Pages/SearchPage.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

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
          });
        },
        backgroundColor: Colors.black,
        activeColor: Colors.white,
        inactiveColor: Colors.grey,
        iconSize: 24.0,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("Home")),
          BottomNavigationBarItem(icon: Icon(Icons.search), title: Text("Search")),
          BottomNavigationBarItem(icon: Icon(Icons.featured_play_list), title: Text("Coming")),
          BottomNavigationBarItem(icon: Icon(Icons.file_download), title: Text("Download")),
          BottomNavigationBarItem(icon: Icon(Icons.more_vert), title: Text("More")),
        ],
      ),
    );
  }
}
