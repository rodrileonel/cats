import 'package:flutter/material.dart';
import 'package:cats/core/themes/text_theme.dart';

class RMText extends StatelessWidget {
  const RMText({
    Key? key,
    required this.text,
    this.type = RMTextTypes.card1,
    this.textAlign = TextAlign.start,
    this.overflow,
    this.decoration,
    this.maxLines = 1,
  }) : super(key: key);

  final String text;
  final RMTextTypes type;
  final TextOverflow? overflow;
  final TextAlign textAlign;
  final int? maxLines;
  final TextDecoration? decoration;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      overflow: overflow,
      textAlign: textAlign,
      style: RMTextTheme.getStyle(
        decoration: decoration,
        type: type,
      ),
    );
  }
}
