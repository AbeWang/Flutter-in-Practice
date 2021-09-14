import 'package:flutter/material.dart';

class DialogSelectCategory extends StatefulWidget {
  const DialogSelectCategory({Key? key}) : super(key: key);

  @override
  _DialogSelectCategoryState createState() => _DialogSelectCategoryState();
}

class _DialogSelectCategoryState extends State<DialogSelectCategory> {
  List<String> _list = ["Item 1", "Item 2", "Item 3", "Item 4", "Item 5", "Item 6", "All"];
  String selected = "All";

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 64.0),
            child: ListView(
              shrinkWrap: true,
              children: List.generate(_list.length, (index) => _buildTitle(_list[index])),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Icon(
                Icons.cancel,
                size: 64.0,
                color: Colors.white,
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _buildTitle(String data) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          data,
          style: TextStyle(
            fontSize: selected == data ? 24.0: 20.0,
            color: selected == data ? Colors.white: Colors.white.withOpacity(0.6)
          ),
        ),
      ),
    );
  }
}
