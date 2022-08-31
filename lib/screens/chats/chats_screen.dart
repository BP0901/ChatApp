import 'package:flutter/material.dart';
import 'package:mychatapp/constants.dart';

import 'components/menu_bar.dart';

class ChatSceen extends StatefulWidget {
  const ChatSceen({Key? key}) : super(key: key);

  @override
  _ChatSceenState createState() => _ChatSceenState();
}

class _ChatSceenState extends State<ChatSceen> {
  var _selectedIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: MenuBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: kPrimaryColor,
        child: Icon(
          Icons.person_add_alt_1,
          color: Colors.white,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: (value) {
            setState(() {
              _selectedIndex = value;
            });
          },
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.messenger), label: "Chat"),
            BottomNavigationBarItem(
                icon: CircleAvatar(
                  radius: 14,
                  backgroundImage: AssetImage("assets/images/user_3.png"),
                ),
                label: "Thông tin cá nhân"),
          ]),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Text("Chats"),
      actions: [
        IconButton(onPressed: () {}, icon: Icon(Icons.search)),
      ],
    );
  }
}
