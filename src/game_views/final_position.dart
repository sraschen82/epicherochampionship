import 'package:asp/asp.dart';
import 'package:flutter/material.dart';
import 'package:hackathon23/src/atoms/game_atoms.dart';
import 'package:hackathon23/src/atoms/page_atoms.dart';
import 'package:hackathon23/src/comum/states.dart';

class FinalPosition extends StatelessWidget {
  const FinalPosition({super.key});

  @override
  Widget build(BuildContext context) {
    context.select(() => {
          medalAtom,
        });
    final altura = MediaQuery.of(context).size.height;

    return FractionallySizedBox(
      heightFactor: 0.9,
      widthFactor: 0.8,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            flex: 1,
            child: Center(
              child: Text(medalAtom.value.recado,
                  style: TextStyle(
                      fontSize: altura * 0.05,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
            ),
          ),
          Flexible(
            flex: 2,
            child: Center(
              child: Text(medalAtom.value.descricao,
                  style: TextStyle(
                      fontSize: altura * 0.05,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
            ),
          ),
          Flexible(
            flex: 8,
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              child: Image.asset(
                medalAtom.value.path,
                height: double.infinity,
                width: double.infinity,
                fit: BoxFit.cover,
                filterQuality: FilterQuality.high,
              ),
            ),
          ),
          Flexible(
            flex: 2,
            child: Card(
              elevation: 15,
              margin: const EdgeInsets.all(8),
              child: TextButton(
                  onPressed: () => gameStates.setValue(GameStates.INITIAL),
                  child: Center(
                      child: Text(
                    'Começar Novo Jogo',
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height * 0.03,
                        fontWeight: FontWeight.bold,
                        color: const Color.fromRGBO(68, 2, 6, 0.9)),
                  ))),
            ),
          ),
        ],
      ),
    );
  }
}
