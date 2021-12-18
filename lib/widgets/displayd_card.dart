import 'package:flutter/material.dart';
import 'package:sparkt/Models/card_model.dart';

class DisplayedCard extends StatelessWidget {
  int? index;
  CardModel? element;

  DisplayedCard({this.index, this.element});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: element?.icons,
      color: Colors.white,
    );
  }
}
