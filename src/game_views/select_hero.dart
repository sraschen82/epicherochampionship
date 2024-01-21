import 'package:asp/asp.dart';
import 'package:flutter/material.dart';
import 'package:hackathon23/src/atoms/game_atoms.dart';
import 'package:hackathon23/src/atoms/page_atoms.dart';

class SelectHero extends StatelessWidget {
  const SelectHero({super.key});

  @override
  Widget build(BuildContext context) {
    context.select(() => {
          personagensListAtom,
          personagemEscolhidoAtom,
          gameStates,
        });

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Expanded(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.fromLTRB(15, 30, 15, 5),
              child: Text(
                'Escolha um guerreiro para jogar',
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            )),
        Expanded(
          flex: 7,
          child: Container(
            margin: const EdgeInsets.fromLTRB(15, 1, 15, 30),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 300,
                  childAspectRatio: 3 / 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20),
              itemCount: personagensListAtom.value.length,
              itemBuilder: (BuildContext ctx, index) {
                return Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: const BorderRadius.all(Radius.circular(30)),
                  ),
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(30)),
                        child: Image.asset(
                          personagensListAtom.value[index].imagemPath,
                          height: double.infinity,
                          width: double.infinity,
                          fit: BoxFit.cover,
                          filterQuality: FilterQuality.high,
                        ),
                      ),
                      Container(
                        constraints: const BoxConstraints.expand(
                            width: BorderSide.strokeAlignOutside,
                            height: BorderSide.strokeAlignOutside),
                        color: Colors.black.withOpacity(0.8),
                      ),
                      Center(
                        child: Column(
                          //crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Card(
                              color: Colors.white.withOpacity(0.6),
                              margin: const EdgeInsets.all(5),
                              elevation: 20,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  personagensListAtom.value[index].nome,
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: double.infinity,
                        width: double.infinity,
                        child: TextButton(
                          onPressed: () => newGameAction.setValue(index),
                          child: Container(
                            constraints: const BoxConstraints.expand(
                                width: BorderSide.strokeAlignOutside,
                                height: BorderSide.strokeAlignOutside),
                            color: Colors.black.withOpacity(0.8),
                          ),
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
