import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_netflix_cover/Pages/NotificationPage.dart';
import 'package:video_player/video_player.dart';

class ComingSoonPage extends StatefulWidget {
  const ComingSoonPage({Key? key}) : super(key: key);

  @override
  _ComingSoonPageState createState() => _ComingSoonPageState();
}

class _ComingSoonPageState extends State<ComingSoonPage> {
  VideoPlayerController _controller = VideoPlayerController.asset('');

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network('https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4')
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: true,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 20.0, bottom: 10.0),
                child: GestureDetector(
                  child: Text("Notifications", style: TextStyle(color: Colors.white, fontSize: 24.0)),
                  onTap: (){
                    Navigator.of(context).push(CupertinoPageRoute(builder:(BuildContext context)=>NotificationPage()));
                  },
                ),
              ),
            ),
            Expanded(
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: List.generate(8, (index) {
                    return Column(
                      children: [
                        Center(
                          child: _controller.value.isPlaying
                              ? AspectRatio(
                            aspectRatio: 16/9,
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _controller.pause();
                                });
                              },
                              child: VideoPlayer(_controller),
                            ),
                          ): AspectRatio(
                            aspectRatio: 16/9,
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Container(
                                  color: Colors.grey,
                                  child: Image.asset('assets/book.png', fit: BoxFit.cover,),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _controller.play();
                                    });
                                  },
                                  child: Icon(
                                    Icons.play_circle_outline,
                                    size: 60.0, color: Colors.white,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Text("Flutter video", style: TextStyle(color: Colors.white, fontSize: 20.0),),
                        SizedBox(
                          height: 20.0,
                        )
                      ],
                    );
                  }),
                )
            )
          ],
        )
    );
  }
}
