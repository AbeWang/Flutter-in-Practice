import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      children: List.generate(10, (index) {
        return _buildNotificationView("Flutter Book", "Coming soon~~");
      }),
    );
  }

  Widget _buildNotificationView(String title, String subtitle) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: 104.0,
            height: 58.0,
            margin: EdgeInsets.only(right: 16.0, bottom: 16.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              boxShadow: [
                BoxShadow(color: Color(0xff444444), offset: Offset(16.0, 8.0)),
                BoxShadow(color: Color(0xff666666), offset: Offset(8.0, 4.0)),
              ],
              image: DecorationImage(
                image: AssetImage("assets/book.png"),
                fit: BoxFit.cover
              )
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("$title", style: TextStyle(color: Colors.white, fontSize: 16.0)),
              Text("$subtitle", style: TextStyle(color: Colors.grey, fontSize: 16.0)),
              Text("11月1日", style: TextStyle(color: Colors.grey, fontSize: 12.0))
            ],
          ),
        )
      ],
    );
  }
}
