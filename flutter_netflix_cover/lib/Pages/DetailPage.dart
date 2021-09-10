import 'dart:ui';

import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> with TickerProviderStateMixin {
  late TabController _tabController = TabController(length: 2, vsync: this);
  int selectedIndex = 0;

  @override
  void initState() {
    _tabController = TabController(initialIndex: selectedIndex, length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemCount: 2, itemBuilder: (context, index) {
      return index == 0 ? _buildMainDetail(): _buildEpisode();
    });
  }

  Widget _buildMainDetail() {
    return Container(
      height: MediaQuery.of(context).size.height * .8,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset("assets/book.png",
            fit: BoxFit.cover,
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: AspectRatio(
                            aspectRatio: 9 / 16,
                            child: Image.asset("assets/book.png", fit: BoxFit.cover)
                        ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("98% for you", style: TextStyle(color: Colors.green),),
                      Text(" 2021 ", style: TextStyle(color: Colors.white)),
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
                  SizedBox(
                    height: 8.0,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(4.0),
                    child: Container(
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
                    height: 12.0,
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
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEpisode() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: TabBar(
            indicator: BoxDecoration(
                border: Border(
                    top: BorderSide(color: Colors.red, width: 4.0)
                )
            ),
            controller: _tabController,
            tabs: [
              Tab(text: "集數",),
              Tab(text: "類似影片",)
            ],
            isScrollable: true,
            onTap: (index) {
              setState(() {
                selectedIndex = index;
                _tabController.animateTo(index);
              });
            },
          ),
        ),
        IndexedStack(
          index: selectedIndex,
          children: [
            _buildList(),
            Center(
              child: Text("No Data!!", style: TextStyle(color: Colors.white),),
            )
          ],
        )
      ],
    );
  }

  Widget _buildList() {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 8.0),
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.5),
              borderRadius: BorderRadius.circular(4.0)
            ),
            padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 16.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(padding: const EdgeInsets.only(right: 8.0),
                  child: Text("Season 1", style: TextStyle(color: Colors.white)),
                ),
                Icon(Icons.arrow_drop_down, color: Colors.white)
              ],
            ),
          ),
        ),
        for (int i=0; i<8; i+=1) _buildCell()
      ],
    );
  }

  Widget _buildCell() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset("assets/book.png", width: 120.0, height: 60.0, fit: BoxFit.cover),
                ),
                Icon(Icons.play_circle_outline, size: 40.0, color: Colors.white)
              ],
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Name", style: TextStyle(color: Colors.white)),
                  Text("Duration", style: TextStyle(color: Colors.white))
                ],
              ),
            ),
            Icon(Icons.file_download, color: Colors.white)
          ],
        ),
        Text(
          "Hello~ Hello~ Hello~ Hello~ Hello~ Hello~ Hello~ Hello~ Hello~ Hello~ Hello~Hello~ Hello~ Hello~ Hello~ Hello~ Hello~ Hello~ Hello~ Hello~ Hello~ Hello~Hello~ Hello~ Hello~ Hello~ Hello~ Hello~Hello~ Hello~ Hello~ Hello~ Hello~ Hello~",
          style: TextStyle(color: Colors.white, fontSize: 12.0),
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
        ),
        SizedBox(
          height: 8.0,
        )
      ],
    );
  }
}
