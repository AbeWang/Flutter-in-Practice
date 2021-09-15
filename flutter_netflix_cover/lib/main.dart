import 'package:flutter/material.dart';
import 'package:flutter_netflix_cover/Pages/UserPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: Colors.black
      ),
      home: SplashScreenPage()
    );
  }
}

class SplashScreenPage extends StatefulWidget {
  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  bool startAnimation = false;

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 1), (){
      setState(() {
        startAnimation = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: AnimatedOpacity(
          opacity: startAnimation ? 0.0 : 1.0,
          duration: Duration(milliseconds: 1000),
          child: AnimatedContainer(
            duration: Duration(milliseconds: 1000),
            width: startAnimation ? 150.0 : 250.0,
            child: Image.asset("assets/book.png"),
          onEnd: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=>UserPage()));
          }))
      )
    );
  }
}
