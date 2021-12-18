import 'package:flutter/material.dart';

class CardModel {
  //type 0 = right
  //type 1 = wrong
  int? type;
  Icon? icons;
  bool? show;

  CardModel({this.type, this.icons, this.show});
}
