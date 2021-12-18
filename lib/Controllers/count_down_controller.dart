import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sparkt/Utils/appUtils.dart';

class CountDownController extends GetxController {
  var sec = 20.obs;
  var isStarted = false.obs;
  var gameOver = false.obs;




  late Timer _timer;
  // a Method to start the Count Down
  void StateTimerStart(){
    //Timer Loop will execute every 1 second, until it reach 0
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if(sec > 0){
        sec--;
        update();
      }else{
        _timer.cancel();
        gameOver(true);
      }
    });
  }

  // pause the timer
  void Pause(){
    _timer.cancel();
    update();
  }
  // reset count value to 10
  void reset(){
    _timer.cancel();
    sec(20);
    update();
  }

}
