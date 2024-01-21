import 'package:flutter/widgets.dart';

vsWidget(double tamanho) {
  return SizedBox(
    height: tamanho,
    width: tamanho,
    child: ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(30)),
      child: Image.asset(
        'assets/images/vs.png',
        height: double.maxFinite,
        width: double.maxFinite,
        fit: BoxFit.cover,
        filterQuality: FilterQuality.high,
        alignment: Alignment.center,
      ),
    ),
  );
}
