// ignore_for_file: use_build_context_synchronously

import 'package:asp/asp.dart';
import 'package:flutter/material.dart';
import 'package:hackathon23/src/atoms/auth_atoms.dart';
import 'package:hackathon23/src/atoms/firebase_atoms.dart';
import 'package:hackathon23/src/atoms/game_atoms.dart';
import 'package:hackathon23/src/atoms/page_atoms.dart';
import 'package:hackathon23/src/comum/my_colors.dart';
import 'package:hackathon23/src/comum/states.dart';
import 'package:hackathon23/src/game_views/classification.dart';
import 'package:hackathon23/src/game_views/figth.dart';
import 'package:hackathon23/src/game_views/final_position.dart';
import 'package:hackathon23/src/game_views/initial_game.dart';
import 'package:hackathon23/src/game_views/results.dart';
import 'package:hackathon23/src/game_views/select_hero.dart';
import 'package:hackathon23/src/game_views/select_oponent.dart';

class GamePage extends StatelessWidget {
  const GamePage({super.key});

  @override
  Widget build(BuildContext context) {
    context.select(() => {
          userIsLogAtom.value,
          gameStates.value,
          personagensListAtom.value,
          snackSaveGameAtom,
          snackErrorsAtom,
        });

    Center gamePage(Widget widget) {
      return Center(
        child: FractionallySizedBox(
          heightFactor: 0.98,
          widthFactor: 0.98,
          alignment: Alignment.center,
          child: Card(
            borderOnForeground: true,
            elevation: 30,
            shadowColor: Colors.black45,
            color: MyColors().goldBorder,
            child: Container(
                height: double.maxFinite,
                width: double.maxFinite,
                margin: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    gradient: gameStates.value == GameStates.FIGHT
                        ? MyColors().gradientFigthCards()
                        //: MyColors().gradientBackground_1(),
                        : MyColors().randomBackground(),
                    borderRadius: BorderRadius.circular(10)),
                child: widget),
          ),
        ),
      );
    }

    List<IconButton> list3 = [
      IconButton(
        onPressed: () => gameStates.setValue(GameStates.INITIAL),
        icon: const Icon(Icons.home),
        color: Colors.white,
        tooltip: 'Página Inicial',
      ),
      IconButton(
        onPressed: () async {
          saveGameAction();
          await Future.delayed(const Duration(seconds: 1));
          if (statusAtom.value == Status.SUCESS) {
            ScaffoldMessenger.of(context).showSnackBar(snackSaveGameAtom.value);
          }
          if (statusAtom.value == Status.ERROR) {
            ScaffoldMessenger.of(context).showSnackBar(snackErrorsAtom.value);
          }
        },
        icon: const Icon(Icons.save),
        color: Colors.white,
        tooltip: 'Salvar',
      ),
      IconButton(
        onPressed: () => exitAppAction(),
        icon: const Icon(Icons.exit_to_app),
        color: Colors.white,
        tooltip: 'Sair',
      ),
    ];

    List<IconButton> list2 = [
      IconButton(
        onPressed: () => gameStates.setValue(GameStates.INITIAL),
        icon: const Icon(Icons.home),
        color: Colors.white,
        tooltip: 'Página Inicial',
      ),
      IconButton(
        onPressed: () => exitAppAction(),
        icon: const Icon(Icons.exit_to_app),
        color: Colors.white,
        tooltip: 'Sair',
      ),
    ];

    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
            actions:
                gameStates.value == GameStates.SELEC_OPONENT ? list3 : list2,
            titleTextStyle: const TextStyle(fontSize: 20),
            title: const Text('EPIC HERO CHAMPIONSHIP',
                style: TextStyle(color: Colors.white)),
            centerTitle: true),
        body: switch (gameStates.value) {
          (GameStates.INITIAL) => gamePage(InitialGame()),
          (GameStates.SELEC_OPONENT) => gamePage(const SelectOponent()),
          (GameStates.SELECT_HERO) => gamePage(const SelectHero()),
          (GameStates.FIGHT) => gamePage(const GameFigth()),
          (GameStates.RESULTS) => gamePage(const Results()),
          (GameStates.CLASSIFICATION) => gamePage(const Classification()),
          (GameStates.LOADING) =>
            const Center(child: CircularProgressIndicator()),
          (GameStates.FINAL_POSITION) => gamePage(const FinalPosition()),
          (GameStates.ERROR) => gamePage(const Text('Algo saiu errado')),
        });
  }
}
