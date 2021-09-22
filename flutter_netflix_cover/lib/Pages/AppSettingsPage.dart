import 'package:flutter/material.dart';

class AppSettingsPage extends StatefulWidget {
  const AppSettingsPage({Key? key}) : super(key: key);

  @override
  _AppSettingsPageState createState() => _AppSettingsPageState();
}

class _AppSettingsPageState extends State<AppSettingsPage> {
  bool _notification = true;
  bool _onlyWifi = false;
  bool _smartDownload = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Container(
        color: Colors.black,
        child: ListView(
          children: [
            _buildTitle("Video Playback"),
            _buildListTile(Icons.wifi, "行動數據用量", "自動",  null, null),
            _buildTitle("Notifications"),
            _buildListTile(Icons.notifications, "允許通知", null, _notification, (value) {
              setState(() {
                _notification = value;
              });
            }),
            _buildTitle("Downloads"),
            _buildListTile(Icons.wifi, "Wi-Fi Only", null, _onlyWifi, (value) {
              setState(() {
                _onlyWifi = value;
              });
            }),
            _buildListTile(Icons.file_download, "智慧下載", "看完的集數會被刪除，並替換為下一集，僅限Wi-Fi模式使用。", _smartDownload, (value) {
              setState(() {
                _smartDownload = value;
              });
            }),
            _buildListTile(Icons.picture_in_picture_alt, "下載畫質", "標準", null, null)
          ],
        ),
      )
    );
  }

  Widget _buildTitle(String title) {
    return ListTile(
      title: Text(title, style: TextStyle(color: Colors.white),),
    );
  }

  Widget _buildListTile(IconData iconData, String title, String? subtitle, bool? switchState, Function? function) {
    return Card(
      color: Colors.white.withOpacity(0.2),
      child: ListTile(
        onTap: () {},
        leading: Icon(iconData, color: Colors.white),
        title: Text(title, style: TextStyle(color: Colors.white),),
        subtitle: subtitle != null ? Text(subtitle, style: TextStyle(color: Colors.white),): null,
        trailing: switchState != null ? Switch(value: switchState, onChanged: (value) {
          function!(value);
        }): null,
      ),
    );
  }
}
