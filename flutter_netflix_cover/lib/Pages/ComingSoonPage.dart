import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_netflix_cover/Pages/NotificationPage.dart';
import 'package:video_player/video_player.dart';

class ComingSoonPage extends StatefulWidget {
  const ComingSoonPage({Key? key}) : super(key: key);

  @override
  _ComingSoonPageState createState() => _ComingSoonPageState();
}

class _ComingSoonPageState extends State<ComingSoonPage> {
  VideoPlayerController _controller = VideoPlayerController.asset('');
  int visibleIndex = 0;

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
                child: NotificationListener(
                  onNotification: (notification) {
                    Future.microtask(() {
                     var index = getMeta<int>(0, MediaQuery.of(context).size.height * 0.5);

                     print("Scrolling to $index");

                     if (index != null) {
                       setState(() {
                         visibleIndex = index;
                       });
                     }
                    });
                    if (notification is ScrollEndNotification) {
                      print("Start playing");
                    }
                    return true;
                  },
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    children: List.generate(8, (index) {
                      return MetaData(
                        metaData: index,
                        behavior: HitTestBehavior.translucent,
                        child: _buildVideoItem(index),
                      );
                    }),
                  ),
                )
            )
          ],
        )
    );
  }

  Widget _buildVideoItem(int index) {
    Color _color = Colors.white.withOpacity(visibleIndex == index ? 1.0: 0.4);
    return ShaderMask(
      shaderCallback: (rect) {
        return LinearGradient(colors: [_color, _color]).createShader(rect);
      },
      child: Column(
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
      ),
    );
  }

  T? getMeta<T>(double x, double y) {
    var renderBox = context.findRenderObject() as RenderBox;
    var offset = renderBox.localToGlobal(Offset(x, y));

    HitTestResult result = HitTestResult();
    WidgetsBinding.instance!.hitTest(result, offset);

    for (var path in result.path) {
      if (path.target is RenderMetaData) {
        var d = path.target as RenderMetaData;
        if (d.metaData is T) {
          return d.metaData as T;
        }
      }
    }
    return null;
  }

}
