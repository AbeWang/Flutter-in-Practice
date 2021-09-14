import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class User {
  User(this.name, this.assetName);

  String name;
  String assetName;
}

List<User> _users = [
  User("Player 1", "assets/book.png"),
  User("Player 2", "assets/book.png"),
  User("Player 3", "assets/book.png"),
  User("Player 4", "assets/book.png"),
  User("Player 5", "assets/book.png")
];

TextStyle titleStyle = TextStyle(color: Colors.white, fontSize: 20.0);
TextStyle userNameStyle = TextStyle(color: Colors.white, fontSize: 14.0);