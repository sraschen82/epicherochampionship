import 'package:flutter/material.dart';

class MyColors {
  final goldBorder = const Color.fromARGB(255, 202, 174, 16);

  final blueBottom =
      const MaterialStatePropertyAll(Color.fromARGB(255, 2, 26, 63));

  final gradientColors = [
    const Color.fromARGB(255, 2, 36, 64),
    const Color.fromARGB(255, 7, 81, 209),
  ];

  gradientAuth() {
    return LinearGradient(
      colors: gradientColors,
      tileMode: TileMode.decal,
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );
  }

  gradientFigthCards() {
    return LinearGradient(
      colors: gradientColors,
      tileMode: TileMode.mirror,
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    );
  }

  final gradientGreen = [
    const Color.fromARGB(255, 55, 199, 132),
    const Color.fromARGB(255, 10, 109, 51),
  ];

  gradientFight() {
    return LinearGradient(
      colors: gradientGreen,
      tileMode: TileMode.mirror,
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    );
  }

  final gradientRed = [
    const Color.fromARGB(255, 56, 2, 2),
    const Color.fromARGB(255, 167, 15, 15),
    const Color.fromARGB(255, 59, 2, 2),
    const Color.fromARGB(255, 167, 15, 15),
    const Color.fromARGB(255, 59, 2, 2),
    const Color.fromARGB(255, 167, 15, 15),
    const Color.fromARGB(255, 59, 2, 2),
    const Color.fromARGB(255, 167, 15, 15),
    const Color.fromARGB(255, 59, 2, 2),
  ];

  LinearGradient gradientBackground_1() {
    return LinearGradient(
      colors: gradientRed,
      tileMode: TileMode.repeated,
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );
  }

  LinearGradient gradientBackground_2() {
    return LinearGradient(
      colors: gradientRed,
      tileMode: TileMode.clamp,
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    );
  }

  LinearGradient gradientBackground_3() {
    return LinearGradient(
      colors: gradientRed,
      tileMode: TileMode.decal,
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
    );
  }

  LinearGradient gradientBackground_4() {
    return LinearGradient(
      colors: gradientRed,
      tileMode: TileMode.mirror,
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
    );
  }

  LinearGradient randomBackground() {
    LinearGradient back1 = gradientBackground_1();
    LinearGradient back2 = gradientBackground_2();
    LinearGradient back3 = gradientBackground_3();
    LinearGradient back4 = gradientBackground_4();
    List<LinearGradient> backgroundList = [back1, back2, back3, back4];
    backgroundList.shuffle();
    LinearGradient myBackground = backgroundList.first;
    return myBackground;
  }
}
