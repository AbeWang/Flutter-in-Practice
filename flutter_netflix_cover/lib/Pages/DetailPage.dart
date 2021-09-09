import 'dart:ui';

import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return _buildMainDetail();
  }

  Widget _buildMainDetail() {
    return Container(
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset("assets/book.png",
            fit: BoxFit.cover,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: AspectRatio(
                          aspectRatio: 9 / 16,
                          child: Image.asset("assets/book.png", fit: BoxFit.cover)
                        ),
                      ),
                    ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("98% for you", style: TextStyle(color: Colors.green),),
                    Text(" 2020 ", style: TextStyle(color: Colors.white)),
                    Text(" 13+ ", style: TextStyle(color: Colors.white)),
                    Text(" 1 Season ", style: TextStyle(color: Colors.white))
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text("第一季上線",style: TextStyle(color: Colors.white, fontSize: 16.0),),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(4.0),
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 4.0),
                    width: double.infinity,
                    padding: EdgeInsets.all(4.0),
                    color: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.play_arrow,
                          size: 30.0,
                          color: Colors.black,
                        ),
                        SizedBox(
                          width: 8.0,
                        ),
                        Text("Play", style: TextStyle(color: Colors.black, fontSize: 18.0),)
                      ],
                    ),
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(4.0),
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 4.0),
                    width: double.infinity,
                    padding: EdgeInsets.all(4.0),
                    color: Colors.grey,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.file_download,
                          size: 30.0,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 8.0,
                        ),
                        Text("Download", style: TextStyle(color: Colors.white, fontSize: 18.0),)
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 8.0,
                ),
                Text(
                    "Flutter Flutter Flutter Flutter Flutter Flutter Flutter Flutter Flutter Flutter Flutter Flutter Flutter Flutter Flutter Flutter Flutter Flutter Flutter Flutter Flutter Flutter Flutter Flutter Flutter Flutter Flutter Flutter Flutter ",
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Colors.white)
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "主演：Abe Wang",
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.add, color: Colors.white,),
                          Text("My favorite", style: TextStyle(color: Colors.white)),
                          SizedBox(
                            width: 80.0,
                          )
                        ],
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.thumb_up, color: Colors.white),
                          Text("Like", style: TextStyle(color: Colors.white)),
                          SizedBox(
                            width: 80.0,
                          )
                        ],
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.share, color: Colors.white),
                          Text("Share", style: TextStyle(color: Colors.white)),
                          SizedBox(
                            width: 80.0,
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
