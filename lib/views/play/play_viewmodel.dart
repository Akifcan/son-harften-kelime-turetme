import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kelime_turetme/controllers/word_controller.dart';

abstract class PlayViewModel extends StatelessWidget {
  final WordController wordController = Get.put(WordController());
  final TextEditingController textEditingController = TextEditingController();
  final ScrollController scrollController = ScrollController();

  newResposne() async {
    wordController.checkWord(textEditingController.text);
    await Future.delayed(Duration(milliseconds: 500));
    scrollController.animateTo(scrollController.position.maxScrollExtent,
        duration: Duration(milliseconds: 500), curve: Curves.bounceIn);
    textEditingController.text = '';
  }
}
