import 'package:flutter/material.dart';
import 'package:flutter_netflix_cover/Models/User.dart';
import 'package:flutter_netflix_cover/Pages/EditUserPage.dart';
import 'package:flutter_netflix_cover/Pages/MainPage.dart';

class UserPage extends StatefulWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  List<User> _users = [
    User("Player 1", "assets/book.png"),
    User("Player 2", "assets/book.png"),
    User("Player 3", "assets/book.png"),
    User("Player 4", "assets/book.png"),
    User("Player 5", "assets/book.png")
  ];

  TextStyle titleStyle = TextStyle(color: Colors.white, fontSize: 20.0);
  TextStyle userNameStyle = TextStyle(color: Colors.white, fontSize: 14.0);

  bool editMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: SizedBox(
              height: 80.0,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Offstage(
                      offstage: !editMode,
                      child: IconButton(
                        icon: Icon(Icons.arrow_back, color: Colors.white),
                        onPressed: () {
                          setState(() {
                            editMode = false;
                          });
                        },
                      ),
                    ),
                  ),
                  Image.asset("assets/book.png", height: 80.0),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Offstage(
                      offstage: editMode,
                      child: IconButton(
                        icon: Icon(Icons.mode_edit, color: Colors.white),
                        onPressed: () {
                          setState(() {
                            editMode = true;
                          });
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.6,
              child: GridView.count(
                crossAxisCount:2,
                shrinkWrap: true,
                crossAxisSpacing: 16.0,
                mainAxisSpacing: 16.0,
                childAspectRatio: 10/12,
                children: List.generate(_users.length, (index) => _buildUser(_users[index])),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildUser(User user) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (_) => editMode ? EditUserPage(user): MainPage())).then((value) {
              if (value == 1) {
                setState(() {});
              } else {
                print("No change");
              }
        });
      },
      child: Container(
        child: Column(
          children: [
            Expanded(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(user.assetName),
                  Offstage(
                    offstage: !editMode,
                    child: Container(color: Colors.black.withOpacity(0.5))
                  ),
                  Offstage(
                    offstage: !editMode,
                    child: Icon(Icons.edit, color: Colors.white),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            Text("${user.name}", style: userNameStyle)
          ],
        ),
      ),
    );
  }
}
