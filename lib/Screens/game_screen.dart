import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sparkt/Controllers/card_controller.dart';
import 'package:sparkt/Controllers/count_down_controller.dart';
import 'package:sparkt/Controllers/life_controller.dart';
import 'package:sparkt/Utils/appUtils.dart';
import 'package:sparkt/widgets/displayd_card.dart';
import 'package:sparkt/widgets/hidden_card.dart';
import 'package:collection/collection.dart';

class GameScreen extends StatelessWidget {
  final timerController = Get.put(CountDownController());
  final cardController = Get.put(CardController());
  final lifeController = Get.put(PlayerLifeController());





  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - kToolbarHeight - 24) / 5;
    final double itemWidth = size.width / 5;

    timerController.gameOver.listen((val) {
      if(val){
        AppUtils.restartGame();
        AppUtils.displayAlert(context, 'Better luck next time');
      }
    });

    return SafeArea(
      child: Scaffold(
        body: Container(
          margin: const EdgeInsets.only(right: 20, left: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  //Reset Button
                  Expanded(
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: MaterialButton(
                        onPressed: () {
                          AppUtils.restartGame();
                        },
                        color: Colors.black26,
                        textColor: Colors.white,
                        child: const Text('Reset game'),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                      ),
                    ),
                  ),

                  //Timer
                  GetX<CountDownController>(builder: (controller) {
                    return Text(
                      '00 : 00 : ${timerController.sec.toString()}',
                      style: TextStyle(fontSize: 20),
                    );
                  }),

                  SizedBox(
                    width: 20,
                  ),

                  //AlarmIcon
                  const Icon(
                    Icons.alarm,
                    size: 35,
                  )
                ],
              ),
              SizedBox(height: 10),
        GetBuilder<CardController>(
          builder: (context) {
            return Container(
                padding: EdgeInsets.all(1),
                color: Color(0xff686868),
                child: GridView.count(
                  crossAxisSpacing: 1,
                  mainAxisSpacing: 1,
                  childAspectRatio: (itemWidth / itemHeight),
                  shrinkWrap: true,
                  crossAxisCount: 5,
                  children: cardController.cardList
                      .mapIndexed((index, element) => element.show ?? true
                      ? DisplayedCard(
                    index: index,
                    element: element,
                  )
                      :
                    HiddenCard(
                                index: index,
                                element: element,
                              )
                  )
                      .toList(),
                ));
          }
        ),
            ],
          ),
        ),
      ),
    );
  }
}
