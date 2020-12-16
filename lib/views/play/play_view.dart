import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kelime_turetme/controllers/word_controller.dart';
import 'package:kelime_turetme/core/constants.dart';
import 'package:kelime_turetme/views/play/play_viewmodel.dart';
import 'package:kelime_turetme/widgets/message_bubble.dart';

class PlayView extends PlayViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _wordList(context),
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              _textfield
            ],
          ),
        ),
      ),
    );
  }

  Widget _wordList(context) => Container(
        height: MediaQuery.of(context).size.height * 0.3,
        child: GetBuilder<WordController>(
          init: wordController,
          builder: (context) {
            return ListView.builder(
                controller: scrollController,
                itemCount: wordController.responses.length,
                itemBuilder: (context, index) =>
                    MessageBubble(wordModel: wordController.responses[index]));
          },
        ),
      );

  Widget get _textfield => TextField(
        controller: textEditingController,
        decoration: InputDecoration(
            hintText: PLAY_HINT_TEXT,
            suffixIcon:
                IconButton(icon: Icon(Icons.send), onPressed: newResposne),
            fillColor: Colors.white,
            filled: true,
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(14))),
      );
}
