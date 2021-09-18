import 'package:flutter/material.dart';

class MorePage extends StatefulWidget {
  const MorePage({Key? key}) : super(key: key);

  @override
  _MorePageState createState() => _MorePageState();
}

class _MorePageState extends State<MorePage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _buildUserList(),
          _buildEditButton(),
          _buildShareLink()
        ],
      ),
    );
  }

  Widget _buildUserList() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(5, (index) => _buildUserItemImage(index)),
        ),
        Row(
          children: List.generate(5, (index) => _buildUserItemName(index)),
        )
      ],
    );
  }

  Widget _buildEditButton() {
    return FlatButton.icon(
        onPressed: () {},
        splashColor: Colors.grey,
        icon: Icon(Icons.edit, color: Colors.white),
        label: Text("Manage user", style: TextStyle(color: Colors.white))
    );
  }

  Widget _buildShareLink() {
    return Container(
      color: Colors.grey.withOpacity(0.2),
      padding: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.message, color: Colors.white),
              Text("將 Flutter 介紹給好友", style: TextStyle(color: Colors.white))
            ],
          ),
          Text("將此連結分享給朋友，讓他們也可以一起討論。", style: TextStyle(color: Colors.white)),
          Text("條款與條件", style: TextStyle(color: Colors.indigo)),
          Container(
            color: Colors.black,
            child: Row(
              children: [
                Expanded(
                  child: Text("https://www.google.com", maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(color: Colors.white),),
                ),
                FlatButton(
                  onPressed: (){},
                  child: Text("Copy"),
                  color: Colors.white,
                )
              ],
            ),
          ),
          SizedBox(
            height: 16.0,
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              _buildShareIcon("Line", "assets/book.png"),
              _buildDivider(),
              _buildShareIcon("Facebook", "assets/book.png"),
              _buildDivider(),
              _buildShareIcon("Gmail", "assets/book.png"),
              _buildDivider(),
              Expanded(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.all(4.0),
                      width: 30.0,
                      height: 30.0,
                      child: Icon(Icons.more_horiz, color: Colors.white),
                    ),
                    Text("More", style: TextStyle(color: Colors.white))
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _buildShareIcon(String title, String assetName) {
    return Expanded(
      child: Column(
        children: [
          Padding(padding: const EdgeInsets.all(4.0),
              child: Image.asset(assetName, width: 30.0, height: 30.0)),
          Text(title, style: TextStyle(color: Colors.white),)
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return Container(
      color: Colors.grey.withOpacity(0.6),
      width: 2.0,
      height: 40.0,
    );
  }

  Widget _buildUserItemImage(int index) {
    return Flexible(
      flex: selectedIndex == index ? 4: 3,
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedIndex = index;
          });
        },
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 8.0),
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Image.asset('assets/book.png')
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildUserItemName(int index) {
    return Flexible(
      flex: selectedIndex == index ? 4: 3,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Text("Player $index", style: TextStyle(color: selectedIndex == index ? Colors.white: Colors.grey))
      ),
    );
  }
}
