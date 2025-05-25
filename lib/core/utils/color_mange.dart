import 'package:flutter/material.dart';

class ColorManger {
  static Color defaultColor = const Color(0xff8000FF);

  static Color blackColor = const Color(0xff1E1F3D);

  static Color redColor = const Color(0xffDA2609);

  static Color wightColor = const Color(0xffFFFFFF);

  static Color bodyColor = const Color(0xffF2F6FE);

  static Color grayColor = const Color(0xff828282);

  static Gradient backgroundGradient = const LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0xFF8000FF), Color(0xff000000)],
  );

  static Color searchColor = const Color(0xff36076B);

  static Color buttonColor = const Color(0xffFF1F8A);

  static Color selctedColor = const Color(0xFFFFD600);

  static Color unSelctedColor = const Color(0xFF232336);
}
