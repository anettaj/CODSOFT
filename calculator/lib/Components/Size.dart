import 'package:flutter/material.dart';

class ScreenSize{
  final BuildContext context;
  ScreenSize(this.context);
  double height(){
    return MediaQuery.of(context).size.height;
  }
  double width(){
    return MediaQuery.of(context).size.width;
  }
}