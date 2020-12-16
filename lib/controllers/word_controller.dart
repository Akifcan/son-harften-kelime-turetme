import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'dart:math';
import '../core/string_extensions.dart';

import 'package:kelime_turetme/models/word_model.dart';

class WordController extends GetxController {
  RxList<String> wordList = List<String>().obs;
  List<WordModel> responses = List<WordModel>();
  List<String> oldResponses = List<String>();

  Random random = Random();
  String lastLetter = '';

  @override
  void onInit() {
    super.onInit();
    this.start();
  }

  checkWord(String word) {
    if (word.getFirstLetter == this.lastLetter) {
      var wordIsExists = this
          .wordList
          .firstWhere((element) => element == word, orElse: () => null);
      if (wordIsExists != null) {
        var responseExists = this
            .oldResponses
            .firstWhere((element) => element == word, orElse: () => null);
        if (responseExists == null) {
          this.lastLetter = word.getLastLetter;
          this
              .responses
              .add(WordModel(messageType: MessageType.USER, text: word));
          this.getRandomWord();
          oldResponses.add(word);
        } else {
          this.responses.add(WordModel(
              messageType: MessageType.ALERT,
              text: 'Bu kelimeyi zaten kullandınız 😐 '));
        }
      } else {
        this.responses.add(WordModel(
            messageType: MessageType.ALERT,
            text: 'Böyle bir kelime bulamadım üzgünüm 😐 '));
      }
    } else {
      this.responses.add(WordModel(
          messageType: MessageType.ALERT,
          text: 'Girdiğiniz kelime ${this.lastLetter} ile başlamıyor.'));
    }
    update();
  }

  start() async {
    var words = await rootBundle.loadString('assets/words.json');
    List decodedWords = json.decode(words)['words'];
    wordList.assignAll(decodedWords.map((e) => e));

    String randomWord = this.wordList[random.nextInt(this.wordList.length)];
    this.lastLetter = randomWord.getLastLetter;
    this
        .responses
        .add(WordModel(messageType: MessageType.COMPUTER, text: randomWord));
    this.responses.add(WordModel(
        messageType: MessageType.ALERT,
        text: 'Oyun başladı başlangıç kelimesi ${randomWord.getLastLetter} '));
    update();
  }

  getRandomWord() {
    var words = this
        .wordList
        .where((element) => element.startsWith(this.lastLetter))
        .toList();
    var randomWord = words[random.nextInt(words.length)];
    this.lastLetter = randomWord.getLastLetter;
    this
        .responses
        .add(WordModel(messageType: MessageType.COMPUTER, text: randomWord));
    update();
  }
}
