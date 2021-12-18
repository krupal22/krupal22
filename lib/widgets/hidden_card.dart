import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sparkt/Controllers/card_controller.dart';
import 'package:sparkt/Controllers/count_down_controller.dart';
import 'package:sparkt/Controllers/life_controller.dart';
import 'package:sparkt/Models/card_model.dart';
import 'package:sparkt/Utils/appUtils.dart';

class HiddenCard extends StatelessWidget {
  int? index;
  CardModel? element;
  var cardController = Get.find<CardController>();
  var timerController = Get.find<CountDownController>();
  var lifeController = Get.find<PlayerLifeController>();

  HiddenCard({this.index, this.element});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        cardController.showCard(index!);

        //Won the Game
        if (cardController.cardList[index!].type == 0) {
          AppUtils.restartGame();
          AppUtils.displayAlert(context, 'Congratulations You won the game');
        }

        //Select Wrong Card
        else{
          if(timerController.isStarted.isFalse){
            timerController.isStarted.toggle();
            timerController.StateTimerStart();
          }

          lifeController.life--;
          if(lifeController.life.value<=0){
            AppUtils.restartGame();
            AppUtils.displayAlert(context, 'Better luck next time');
          }


        }


      },
      child: Container(
        child: const Icon(
          Icons.help_outline,
        ),
        color: Colors.white,
      ),
    );
  }
}
