import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        top: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              color: Color(0xff333333),
              child: ListTile(
                leading: Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
                title: TextField(
                  decoration: InputDecoration(
                      hintText: "搜索節目、電影等",
                      hintStyle: TextStyle(
                          color: Colors.grey
                      ),
                      border: InputBorder.none
                  ),
                ),
                trailing: IconButton(
                  icon: Icon(
                      Icons.mic,
                      color: Colors.grey
                  ),
                  onPressed: (){},
                ),
              ),
            ),
            Padding(padding: const EdgeInsets.all(8.0),
              child: Text(
                "熱門搜尋",
                style: TextStyle(fontSize: 22.0, color: Colors.white),
              ),
            ),
            Expanded(
                child: ListView.builder(
                  itemCount: 8,
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(4.0),
                            child: SizedBox(
                              width: 160,
                              height: 80,
                              child: Image.asset("assets/book.png", fit: BoxFit.cover,),
                            ),
                          ),
                        ),
                        Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text(
                                "Flutter Book",
                                style: TextStyle(fontSize: 16.0, color: Colors.white),
                              ),
                            )
                        ),
                        Icon(
                          Icons.play_arrow,
                          size: 32.0,
                          color: Colors.white,
                        )
                      ],
                    );
                  },
                )
            )
          ],
        ),
      )
    );
  }
}
