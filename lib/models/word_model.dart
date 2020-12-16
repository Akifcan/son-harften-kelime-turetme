import 'package:flutter/material.dart';

class WordModel {
  final String text;
  final MessageType messageType;

  WordModel({@required this.text, @required this.messageType});
}

enum MessageType { COMPUTER, ALERT, USER }
