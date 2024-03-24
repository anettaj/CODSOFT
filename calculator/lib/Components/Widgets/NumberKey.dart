import 'package:flutter/material.dart';
import '../Constance.dart';
import '../Size.dart';

class NumberKey extends StatelessWidget {
  const NumberKey({
    Key? key,
    required this.num,
    required this.onPressed,
    required this.color,
  }) : super(key: key);

  final String num;
  final Color color;
  final Function(String) onPressed;

  @override
  Widget build(BuildContext context) {
    ScreenSize size = ScreenSize(context);
    double H = size.height();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () => onPressed(num),
        child: Container(
          decoration: BoxDecoration(
            color: kNumberKeyColor,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                blurRadius: 10,
                color: kKeyShadowColor,
                offset: Offset(8, 1),
                spreadRadius: 1,
              )
            ],
          ),
          child: CircleAvatar(
            backgroundColor: color,
            radius: H * 0.045,
            child: Text(
              num,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
