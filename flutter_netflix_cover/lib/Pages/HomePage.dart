import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_netflix_cover/Pages/DetailPage.dart';
import 'package:flutter_netflix_cover/Pages/DialogSelectCategory.dart';
import 'package:shimmer/shimmer.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GlobalKey<ScaffoldState> _globalKey = GlobalKey(debugLabel: "test");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      backgroundColor: Colors.black,
      body:CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            pinned: false,
            snap: false,
            backgroundColor: Colors.transparent,
            leading: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset("assets/book.png")
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    var result = showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return DialogSelectCategory();
                        });
                  },
                  child: Row(
                    children: [
                      Text("節目", style: TextStyle(color: Colors.white, fontSize: 20.0)),
                      Padding(
                          padding: const EdgeInsets.all(8.0),
                        child: Icon(Icons.arrow_drop_down),
                      )
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    var result = showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return DialogSelectCategory();
                        }
                    );
                  },
                  child: Row(
                    children: [
                      Text("所有類型", style: TextStyle(color: Colors.white.withOpacity(0.7), fontSize: 14.0)),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Icon(Icons.arrow_drop_down),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          FutureBuilder(
            future: _getData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return SliverList(
                  delegate: SliverChildListDelegate(
                      [_buildMajorRecommendedVideo(),
                        _buildWonderfulPreview(),
                        _buildRecommendedMenu("現正熱播"),
                        _buildRecommendedMenu("為你推薦"),
                        _buildTopChartMenu("台灣排行榜前 8 名"),
                        SizedBox(
                          height: 30.0,
                        )
                      ]
                  )
                );
              }
              return _buildLoading();
            }
          )
        ],
      )
    );
  }

  Widget _buildMajorRecommendedVideo() {
    return Container(
      height: MediaQuery.of(context).size.height * .7,
      child: Stack(
        fit: StackFit.expand,
        children: [
          ShaderMask(shaderCallback: (Rect bounds) {
            return LinearGradient(colors: [
              Colors.white,
              Colors.white,
              Colors.transparent
            ], stops: [
              0.0,
              0.7,
              1.0
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter).createShader(bounds);
          },
              child: Image.asset("assets/book.png", fit: BoxFit.fitHeight)
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Wrap(
                  alignment: WrapAlignment.center,
                  children: [
                    Text("黑暗 ", style: TextStyle(color: Colors.white)),
                    Text("刺激 ", style: TextStyle(color: Colors.white)),
                    Text("奇幻冒險 ", style: TextStyle(color: Colors.white)),
                    Text("神話與傳說", style: TextStyle(color: Colors.white))
                  ],
                ),
                SizedBox(
                  height: 24.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.add, color: Colors.white),
                        Text("我的片單", style: TextStyle(color: Colors.white)),
                        SizedBox(
                          width: 80,
                        )
                      ],
                    ),
                    Container(
                      width: 90.0,
                      padding: EdgeInsets.all(4.0),
                      color: Colors.white,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(Icons.play_arrow, size: 30, color: Colors.black),
                          Text("播放",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18
                              ),
                          )
                        ],
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.info_outline, color: Colors.white),
                        Text("資訊", style: TextStyle(color: Colors.white)),
                        SizedBox(
                          width: 80.0,
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildRecommendedMenu(String title) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 24.0),
        Padding(
            padding: const EdgeInsets.all(4.0),
          child: Text(title, style: TextStyle(fontSize: 24.0, color: Colors.white),),
        ),
        SizedBox(
          height: 150.0,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate(8, (index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Ink(
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                      image: AssetImage("assets/book.png"),
                      fit: BoxFit.cover
                    )
                  ),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(8.0),
                    onLongPress: (){
                      _globalKey.currentState?.showSnackBar(SnackBar(content: Text("動畫名稱")));
                    },
                    onTap: (){
                      Navigator.of(context).push(CupertinoPageRoute(builder: (BuildContext context)=>DetailPage()));
                    },
                  ),
                ),
              );
            }),
          ),
        )
      ],
    );
  }

  Widget _buildTopChartMenu(String title) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 24.0),
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: Text(title, style: TextStyle(fontSize: 24.0, color: Colors.white),),
        ),
        SizedBox(
          height: 150.0,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate(8, (index) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(0.0),
                child: SizedBox(
                  width: 120,
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Ink(
                          width: 100,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              image: DecorationImage(
                                  image: AssetImage("assets/book.png"),
                                  fit: BoxFit.cover
                              )
                          ),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(8.0),
                            onLongPress: (){
                              _globalKey.currentState?.showSnackBar(SnackBar(content: Text("動畫名稱")));
                            },
                          ),
                        ),
                      ),
                      Transform.translate(offset: Offset(-14, 120),
                          child: Text("${index + 1}",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 100.0,
                                fontWeight: FontWeight.w700,
                                height: 0.2,
                                letterSpacing: 0.0,
                                wordSpacing: 0.0,
                                shadows: [
                                  Shadow(
                                      offset: Offset(-1.5, -1.5),
                                      color: Colors.white),
                                  Shadow(
                                      offset: Offset(1.5, -1.5),
                                      color: Colors.white),
                                  Shadow(
                                      offset: Offset(1.5, 1.5),
                                      color: Colors.white),
                                  Shadow(
                                      offset: Offset(-1.5, 1.5),
                                      color: Colors.white),
                                ]
                            ),
                          )
                      )
                    ],
                  )
                ),
              );
            }),
          ),
        )
      ],
    );
  }

  Widget _buildWonderfulPreview() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 24.0),
        Padding(padding: const EdgeInsets.all(4.0),
        child: Text("Preview", style: TextStyle(fontSize: 24.0, color: Colors.white))),
        SizedBox(
          height: 140.0,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate(8, (index) {
              return Padding(
                padding: const EdgeInsets.all(4.0),
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Ink(
                      width: 114,
                      height: 114,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Color.fromRGBO(
                              Random().nextInt(255),
                              Random().nextInt(255),
                              Random().nextInt(255),
                              1),
                          width: 2
                        ),
                        image: DecorationImage(
                          image: AssetImage("assets/book.png"),
                          fit: BoxFit.cover
                        )
                      ),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(100),
                        onLongPress: (){
                          _globalKey.currentState?.showSnackBar(SnackBar(content: Text("Name"),));
                        },
                      )
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Text("Drama Name",
                      style: TextStyle(fontSize: 22.0, color: Colors.white),),
                    ),
                    SizedBox(
                      width: 100,
                      height: 10,
                    )
                  ],
                ),
              );
            }),
          ),
        )
      ],
    );
  }

  Widget _buildLoading() {
    Color _color = Colors.black.withOpacity(0.5);
    return SliverList(
      delegate: SliverChildListDelegate([
        Shimmer.fromColors(
          baseColor: Colors.grey,
          highlightColor: Colors.white,
          direction: ShimmerDirection.rtl,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 160.0,
                height: 80.0,
                margin: EdgeInsets.all(8.0),
                color: _color,
              ),
              Container(
                width: 200.0,
                height: 20.0,
                margin: EdgeInsets.all(8.0),
                color: _color,
              ),
              Container(
                width: 80.0,
                height: 30.0,
                margin: EdgeInsets.all(8.0),
                color: _color,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                    width: 150.0,
                    height: 20.0,
                    margin: EdgeInsets.all(8.0),
                    color: _color
                ),
              ),
              SizedBox(
                height: 120.0,
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: List.generate(4, (index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        backgroundColor: _color,
                        radius: 52.0,
                      ),
                    );
                  }),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                    width: 150.0,
                    height: 20.0,
                    margin: EdgeInsets.all(8.0),
                    color: _color
                ),
              ),
              SizedBox(
                height: 120.0,
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: List.generate(4, (index) {
                    return Container(
                      height: 120.0,
                      width: 100.0,
                      color: _color,
                      margin: EdgeInsets.all(4.0),
                    );
                  }),
                ),
              )
            ],
          ),
        )
      ]),
    );
  }

  Future _getData() {
    return Future.delayed(Duration(seconds: 2), (){});
  }

}

