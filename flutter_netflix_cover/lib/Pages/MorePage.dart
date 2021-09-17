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
              Icon(Icons.message, color: Colors.white,),
              Text("將 Flutter 介紹給好友", style: TextStyle(color: Colors.white),)
            ],
          ),
          Text("將此連結分享給朋友，讓他們也可以一起討論。", style: TextStyle(color: Colors.white),),
          Text("條款與條件", style: TextStyle(color: Colors.white),),
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

            ],
          )
        ],
      ),
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
