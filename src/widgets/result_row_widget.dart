import 'dart:math';

import 'package:flutter/widgets.dart';
import 'package:hackathon23/src/atoms/game_atoms.dart';
import 'package:hackathon23/src/models/personagem_model.dart';
import 'package:hackathon23/src/widgets/results_widgets.dart';
import 'package:hackathon23/src/widgets/vs_widget.dart';

Row rowResultWidget(
    Personagem personagem1, Personagem personagem2, double side) {
  int randomDemage() => Random().nextInt(12) * xpAtom.value;
  List<int> danoLutaRandom = [randomDemage(), randomDemage()];

  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      resultWidget(personagem1, side, danoLutaRandom[0], danoLutaRandom[1]),
      vsWidget(side * 0.1),
      resultWidget(personagem2, side, danoLutaRandom[1], danoLutaRandom[0]),
    ],
  );
}
