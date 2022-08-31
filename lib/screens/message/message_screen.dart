import 'package:flutter/material.dart';
import 'package:mychatapp/constants.dart';
import 'package:mychatapp/models/Chat.dart';
import 'package:mychatapp/screens/message/components/body_message.dart';

class MessageScreen extends StatefulWidget {
  final Chat chat;
  const MessageScreen({Key? key, required this.chat}) : super(key: key);

  @override
  _MessageScreenState createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: MessageContent(),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Row(children: <Widget>[
        BackButton(),
        Stack(children: <Widget>[
          CircleAvatar(
            radius: 24,
            backgroundImage: AssetImage(widget.chat.image),
          ),
          if (widget.chat.isActive)
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
        ]),
        SizedBox(
          width: kDefaultPadding * 0.75,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              widget.chat.name,
              style: TextStyle(fontSize: 13),
            ),
            if (widget.chat.isActive)
              Text(
                "online",
                style: TextStyle(fontSize: 13),
              )
          ],
        )
      ]),
    );
  }
}
