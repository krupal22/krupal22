import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sparkt/Controllers/card_controller.dart';
import 'package:sparkt/Controllers/count_down_controller.dart';
import 'package:sparkt/Controllers/life_controller.dart';

class AppUtils {
  static void restartGame() {
    Get.find<CardController>().setupGameBord();
    Get.find<CountDownController>().gameOver(false);
    Get.find<CountDownController>().isStarted.toggle();
    Get.find<CountDownController>().reset();
    Get.find<PlayerLifeController>().life.value=3;
  }

  static displayAlert(BuildContext context, String msg) {
    return showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
              title: Center(
                  child: Text(
                msg.toString(),
                textAlign: TextAlign.center,
              )),
              actions: [
                MaterialButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  color: Colors.black,
                  textColor: Colors.white,
                  child: const Text('Play Again'),
                )
              ],
            ));
  }
}
