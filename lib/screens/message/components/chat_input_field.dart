import 'package:flutter/material.dart';

import '../../../constants.dart';

class InputField extends StatefulWidget {
  const InputField({Key? key}) : super(key: key);

  @override
  _InputFieldState createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacer(),
        Container(
          decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              boxShadow: [
                BoxShadow(
                    offset: Offset(0.5, 3),
                    blurRadius: 32,
                    color: Color(0xFF087949).withOpacity(1))
              ]),
          padding: EdgeInsets.symmetric(
              horizontal: kDefaultPadding, vertical: kDefaultPadding / 2),
          child: SafeArea(
              child: Row(
            children: [
              Expanded(
                  child: TextField(
                decoration: InputDecoration(
                    hintText: "Nội dung nhắn tin", border: InputBorder.none),
              )),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.send,
                    color: kPrimaryColor,
                  ))
            ],
          )),
        )
      ],
    );
  }
}
