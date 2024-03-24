import 'package:flutter/material.dart';
import '../Constance.dart';
import '../Size.dart';

class CustomTextField extends StatelessWidget {
  final String currentValue;

  const CustomTextField({Key? key, required this.currentValue}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenSize size = ScreenSize(context);
    double W = size.width();
    return Container(
      width: W,
      padding: EdgeInsets.only(top: 120),
      color: kCustomTextFieldColor,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          currentValue,
          textAlign: TextAlign.end,
          style: kCustomTextFieldStyle
        ),
      ),
    );
  }
}