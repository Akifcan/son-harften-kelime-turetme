import 'package:flutter/material.dart';
import 'package:kelime_turetme/models/word_model.dart';

class MessageBubble extends StatelessWidget {
  final WordModel wordModel;

  MessageBubble({@required this.wordModel});

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: wordModel.messageType == MessageType.USER
            ? Alignment.centerRight
            : wordModel.messageType == MessageType.COMPUTER
                ? Alignment.centerLeft
                : Alignment.center,
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 5),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color: wordModel.messageType == MessageType.USER
                ? Colors.lightBlue[600]
                : wordModel.messageType == MessageType.COMPUTER
                    ? Colors.lightBlue[800]
                    : Colors.lightBlue,
          ),
          child: Text(wordModel.text,
              style: Theme.of(context)
                  .textTheme
                  .subtitle1
                  .copyWith(color: Colors.white)),
        ));
  }
}
