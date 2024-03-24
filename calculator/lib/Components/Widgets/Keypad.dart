import 'package:flutter/material.dart';
import '../Constance.dart';
import '../Size.dart';
import 'NumberKey.dart';
import 'functionKey.dart';


class Keypad extends StatelessWidget {
  final Function(String) onKeyPressed;
  final Function(String) onOperatorPressed;
  final Function() onEqualPressed;
  final Function() onClearPressed;

  const Keypad({
    Key? key,
    required this.onKeyPressed,
    required this.onOperatorPressed,
    required this.onEqualPressed,
    required this.onClearPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenSize size = ScreenSize(context);
    double H = size.height();
    return Container(
      margin: EdgeInsets.only(top: 50),
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Row(
            children: [
              NumberKey(num: '7', onPressed: onKeyPressed, color: kNumberColor),
              NumberKey(num: '8', onPressed: onKeyPressed, color: kNumberColor),
              NumberKey(num: '9', onPressed: onKeyPressed, color: kNumberColor),
              NumberKey(num: '*', onPressed: onOperatorPressed, color: kOperatorColor),
            ],
          ),
          Row(
            children: [
              NumberKey(num: '4', onPressed: onKeyPressed, color: kNumberColor),
              NumberKey(num: '5', onPressed: onKeyPressed, color: kNumberColor),
              NumberKey(num: '6', onPressed: onKeyPressed, color: kNumberColor),
              NumberKey(num: '/', onPressed: onOperatorPressed, color: kOperatorColor),
            ],
          ),
          Row(
            children: [
              NumberKey(num: '1', onPressed: onKeyPressed, color: kNumberColor),
              NumberKey(num: '2', onPressed: onKeyPressed, color: kNumberColor),
              NumberKey(num: '3', onPressed: onKeyPressed, color: kNumberColor),
              NumberKey(num: '+', onPressed: onOperatorPressed, color: kOperatorColor),
            ],
          ),
          Row(
            children: [
              FunctionKey(num: '=', onPressed: onEqualPressed, color: kEqualSymbolColor),
              NumberKey(num: '0', onPressed: onKeyPressed, color: kNumberColor),
              FunctionKey(num: 'C', onPressed: onClearPressed, color: kNumberColor),
              NumberKey(num: '-', onPressed: onOperatorPressed, color: kOperatorColor),
            ],
          )
        ],
      ),
    );
  }
}