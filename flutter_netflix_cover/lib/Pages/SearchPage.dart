import 'package:flutter/material.dart';
import 'package:flutter_netflix_cover/Models/Series.dart';
import 'package:transparent_image/transparent_image.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<Series> _series = [
    Series("Flutter dog", "yo yo yo", "3:00", "https://img.ltn.com.tw/Upload/news/600/2019/03/30/phpUCF6ub.jpg", "Doggy"),
    Series("Flutter dog", "yo yo yo", "3:00", "https://img.ltn.com.tw/Upload/news/600/2019/03/30/phpUCF6ub.jpg", "Doggy"),
    Series("Flutter dog", "yo yo yo", "3:00", "https://img.ltn.com.tw/Upload/news/600/2019/03/30/phpUCF6ub.jpg", "Doggy"),
    Series("Flutter dog", "yo yo yo", "3:00", "https://img.ltn.com.tw/Upload/news/600/2019/03/30/phpUCF6ub.jpg", "Doggy"),
    Series("Flutter dog", "yo yo yo", "3:00", "https://img.ltn.com.tw/Upload/news/600/2019/03/30/phpUCF6ub.jpg", "Doggy"),
    Series("Flutter dog", "yo yo yo", "3:00", "https://img.ltn.com.tw/Upload/news/600/2019/03/30/phpUCF6ub.jpg", "Doggy")
  ];

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
                child: StreamBuilder<List<Series>>(
                  stream: _getSeries(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                        itemCount: _series.length,
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
                                    child: _buildNetworkImage(_series[index]),
                                  ),
                                ),
                              ),
                              Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Text(
                                      _series[index].title,
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
                      );
                    }
                    return Center(
                      child: SizedBox(
                        width: 50.0,
                        height: 50.0,
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation(Colors.red),
                        ),
                      ),
                    );
                  },
                )
            )
          ],
        ),
      )
    );
  }

  Widget _buildNetworkImage(Series series) {
    return FadeInImage.memoryNetwork(
      placeholder: kTransparentImage,
      image: "https://img.ltn.com.tw/Upload/news/600/2019/03/30/phpUCF6ub.jpg",
      fit: BoxFit.cover,
      imageErrorBuilder: (context, error, s) {
        print('$error');
        return Text('error $s');
      },
      fadeInDuration: Duration(milliseconds: 300),
    );
  }

  Stream<List<Series>> _getSeries() {
    return Stream.fromFuture(Future.delayed(Duration(seconds: 3), () {
      return _series;
    }));
  }
}
