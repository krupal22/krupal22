import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sparkt/Models/card_model.dart';

class CardController extends GetxController {
  int totalCard = 25;
  var cardList = <CardModel>[];

  @override
  void onInit() {
    setupGameBord();
  }

  setupGameBord() {
    cardList.clear();
    for (int i = 0; i < totalCard; i++) {
      cardList.add(CardModel(
          icons: i > 3
              ? const Icon(
                  Icons.close,
                  color: Colors.red,
                )
              : const Icon(Icons.check),
          show: false,
          type: i > 3 ? 1 : 0));
    }
    cardList.shuffle();
    update();
  }

  void showCard(int index) {
    cardList[index].show = true;
    update();
  }
}
