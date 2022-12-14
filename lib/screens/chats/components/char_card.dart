import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mychatapp/constants.dart';
import 'package:mychatapp/models/Chat.dart';
import 'package:mychatapp/screens/message/message_screen.dart';

class ChatCard extends StatelessWidget {
  const ChatCard({Key? key, required this.chat, required this.press})
      : super(key: key);
  final Chat chat;
  final VoidCallback press;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(context,
          MaterialPageRoute(builder: (context) => MessageScreen(chat: chat))),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: kDefaultPadding * 0.75,
          horizontal: kDefaultPadding,
        ),
        child: Row(
          children: <Widget>[
            Stack(
              children: <Widget>[
                CircleAvatar(
                  radius: 24,
                  backgroundImage: AssetImage(chat.image),
                ),
                if (chat.isActive)
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Container(
                      height: 16,
                      width: 16,
                      decoration: BoxDecoration(
                          color: kPrimaryColor,
                          shape: BoxShape.circle,
                          border: Border.all(
                              color: Theme.of(context).scaffoldBackgroundColor,
                              width: 3)),
                    ),
                  ),
              ],
            ),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    chat.name,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Opacity(
                    opacity: 0.64,
                    child: Text(
                      chat.lastMessage,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            )),
            Opacity(opacity: 0.64, child: Text(chat.time))
          ],
        ),
      ),
    );
  }
}
