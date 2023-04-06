import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  const TextWidget(
      {Key? key,
      required this.label,
      this.fontSize = 17,
      this.color = Colors.white,
      this.fontWeight})
      : super(key: key);

  final String label;
  final double fontSize;
  final Color color;
  final FontWeight? fontWeight;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Text(
        label,
        style: TextStyle(
          color: color,
          fontSize: fontSize,
          fontWeight: fontWeight ?? FontWeight.w500,
        ),
      ),
    );
  }
}
