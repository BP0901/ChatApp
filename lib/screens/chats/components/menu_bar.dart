import 'package:flutter/material.dart';
import 'package:mychatapp/components/filled_outline_button.dart';
import 'package:mychatapp/constants.dart';
import 'package:mychatapp/models/Chat.dart';
import 'package:mychatapp/screens/chats/components/char_card.dart';

class MenuBar extends StatefulWidget {
  const MenuBar({Key? key}) : super(key: key);

  @override
  _MenuBarState createState() => _MenuBarState();
}

class _MenuBarState extends State<MenuBar> {
  var _isFirstClicked = true;
  var _isSecondClicked = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.fromLTRB(
              kDefaultPadding, 0, kDefaultPadding, kDefaultPadding),
          color: kPrimaryColor,
          child: Row(
            children: <Widget>[
              FillOutlineButton(
                press: () => _checkButton("first"),
                text: "Tin nhắn",
                isFilled: _isFirstClicked ? true : false,
              ),
              SizedBox(
                width: kDefaultPadding,
              ),
              FillOutlineButton(
                press: () => _checkButton("second"),
                text: "Đang hoạt động",
                isFilled: _isSecondClicked ? true : false,
              )
            ],
          ),
        ),
        Expanded(
            child: ListView.builder(
                itemCount: chatsData.length,
                itemBuilder: (context, index) => ChatCard(
                      chat: chatsData[index],
                      press: () {},
                    ))),
      ],
    );
  }

  void _checkButton(String button) {
    setState(() {
      if (button == "first") {
        _isFirstClicked = true;
        _isSecondClicked = false;
      } else {
        _isFirstClicked = false;
        _isSecondClicked = true;
      }
    });
  }
}
