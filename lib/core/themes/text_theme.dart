import 'package:flutter/material.dart';

enum RMTextTypes {
  header,
  headerSub,
  card1,
  cardTitle,
  cardLabel,
  cardSub,
  infoTitle,
  infoSub,
  infoMain,
}

const _textTypeWeight = {
  RMTextTypes.header: FontWeight.w500,
  RMTextTypes.headerSub: FontWeight.w600,
  RMTextTypes.card1: FontWeight.w400,
  RMTextTypes.cardTitle: FontWeight.w400,
  RMTextTypes.cardLabel: FontWeight.w400,
  RMTextTypes.cardSub: FontWeight.w400,
  RMTextTypes.infoTitle: FontWeight.w600,
  RMTextTypes.infoSub: FontWeight.w400,
  RMTextTypes.infoMain: FontWeight.w600,
};

const _textTypeSize = {
  RMTextTypes.header: 20.0,
  RMTextTypes.headerSub: 12.0,
  RMTextTypes.card1: 10.0,
  RMTextTypes.cardTitle: 16.0,
  RMTextTypes.cardLabel: 10.0,
  RMTextTypes.cardSub: 12.0,
  RMTextTypes.infoTitle: 17.0,
  RMTextTypes.infoSub: 13.0,
  RMTextTypes.infoMain: 20.0,
};

const _textTypeColor = {
  RMTextTypes.header: Color(0xFF081F32),
  RMTextTypes.headerSub: Color(0xFF4F4F4F),
  RMTextTypes.card1: Color(0xFF4F4F4F),
  RMTextTypes.cardTitle: Color(0xFF000000),
  RMTextTypes.cardLabel: Color(0xFF828282),
  RMTextTypes.cardSub: Color(0xFF000000),
  RMTextTypes.infoTitle: Color(0xFF828282),
  RMTextTypes.infoSub: Color(0xFF081F32),
  RMTextTypes.infoMain: Color(0xFF4F4F4F),
};

class RMTextTheme {
  static TextStyle getStyle({
    RMTextTypes type = RMTextTypes.card1,
    TextDecoration? decoration,
  }) =>
      TextStyle(
        decoration: decoration,
        color: _textTypeColor[type],
        fontFamily: 'Monserrat',
        fontSize: _textTypeSize[type],
        fontWeight: _textTypeWeight[type],
      );
}
