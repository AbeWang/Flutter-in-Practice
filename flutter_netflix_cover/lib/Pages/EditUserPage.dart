import 'package:flutter/material.dart';
import 'package:flutter_netflix_cover/Models/User.dart';

class EditUserPage extends StatefulWidget {
  User _user;

  EditUserPage(this._user);

  @override
  _EditUserPageState createState() => _EditUserPageState();
}

class _EditUserPageState extends State<EditUserPage> {
  bool _isButtonDisabled = false;
  bool _savingState = false;

  TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    _controller = TextEditingController(text: widget._user.name);
    _controller.addListener(() {
      print(_controller.text);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: IconButton(
                          icon: Icon(Icons.arrow_back, color: Colors.white),
                          onPressed: (){
                            Navigator.of(context).pop();
                          },
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Text("編輯使用者", style: TextStyle(color: Colors.white, fontSize: 24.0),),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: FlatButton(
                          textColor: Colors.lightGreenAccent,
                          disabledTextColor: Colors.grey,
                          padding: EdgeInsets.zero,
                          child: Text("Save", style: TextStyle(fontSize: 20.0),),
                          onPressed: _isButtonDisabled ? null: _saveChange,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildUserAvatar(),
                      _buildInputTextField(),
                      _buildTextMessage()
                    ],
                  ),
                )
              ],
            ),
            Offstage(
              offstage: !_savingState,
              child: Container(
                color: Colors.black.withOpacity(0.5),
                child: Center(
                  child: SizedBox(
                    width: 50.0,
                    height: 50.0,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation(Colors.red),
                    ),
                  ),
                ),
              ),
            )
          ],
        )
      )
    );
  }

  void _saveChange() {
    widget._user.name = _controller.text;
    print("name: ${widget._user.name}");

    setState(() {
      _savingState = true;
    });

    // Delay 2s
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        _savingState = false;
        Navigator.of(context).pop(1);
      });
    });
  }

  Widget _buildUserAvatar() {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Ink(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              image: DecorationImage(
                image: AssetImage(
                  widget._user.assetName
                )
              ),
            ),
            width: MediaQuery.of(context).size.width * 0.3,
            height: MediaQuery.of(context).size.width * 0.3,
            child: InkWell(
              borderRadius: BorderRadius.circular(8.0),
              onTap: () {

              },
            ),
          ),
        ),
        Positioned(
          right: 0.0,
          bottom: 0.0,
          child: Icon(Icons.edit, color: Colors.white,),
        )
      ],
    );
  }

  Widget _buildInputTextField() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      margin: EdgeInsets.all(16.0),
      color: Colors.grey,
      width: MediaQuery.of(context).size.width * 0.7,
      child: TextField(
        cursorColor: Colors.white,
        controller: _controller,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          border: InputBorder.none
        ),
      ),
    );
  }

  Widget _buildTextMessage() {
    return Expanded(
        child: Text(
          "所有年齡分級\n顯示所有年齡分級的影片給這位使用者觀賞\n請前往設定變更",
          maxLines: 3,
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white, fontSize: 14.0),
        )
    );
  }

}
