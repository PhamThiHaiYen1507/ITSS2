import 'package:flutter/material.dart';

class TranslateText extends StatefulWidget {
  const TranslateText({Key? key, required this.onTextTouched})
      : super(key: key);

  final Function(bool) onTextTouched;

  @override
  _TranslateTextState createState() => _TranslateTextState();
}

class _TranslateTextState extends State<TranslateText> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.0,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: InkWell(
              onTap: () {
                widget.onTextTouched(true);
              },
              child: Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
                child: Text(
                  "Enter text",
                  style: TextStyle(
                    color: Colors.grey[700],
                  ),
                ),
              ),
            ),
          ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: <Widget>[
          //     ActionButton(
          //       icon: Icons.camera_alt,
          //       text: "Camera", imageIcon: AssetImage("assets/pen.png"),
          //     ),
          //     ActionButton(
          //       imageIcon: AssetImage("assets/pen.png"),
          //       text: "Handwriting", icon: Icons.camera_alt,
          //     ),
          //     ActionButton(
          //       imageIcon: AssetImage("assets/conversation.png"),
          //       text: "Conversation", icon: Icons.camera_alt,
          //     ),
          //     ActionButton(
          //       icon: Icons.keyboard_voice,
          //       text: "Voice", imageIcon: AssetImage("assets/conversation.png"),
          //     ),
          //   ],
          // )
        ],
      ),
    );
  }
}
