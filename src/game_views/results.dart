import 'package:asp/asp.dart';
import 'package:flutter/material.dart';
import 'package:hackathon23/src/atoms/game_atoms.dart';
import 'package:hackathon23/src/atoms/page_atoms.dart';
import 'package:hackathon23/src/comum/states.dart';
import 'package:hackathon23/src/models/personagem_model.dart';
import 'package:hackathon23/src/widgets/result_row_widget.dart';
import 'package:hackathon23/src/widgets/results_widgets.dart';
import 'package:hackathon23/src/widgets/vs_widget.dart';

class Results extends StatelessWidget {
  const Results({super.key});

  @override
  Widget build(BuildContext context) {
    context.select(() => {
          campanhaAtom,
          personagensHpAtualizadosListAtom,
          danoCausadoAtom,
          danoRecebidoAtom,
          adversariosEnfrentadosListAtom
        });

    double altura = MediaQuery.of(context).size.height;
    double largura = MediaQuery.of(context).size.width;

    adversariosEnfrentadosListAtom.value.add(figthOponentAtom.value);
    classificationListAtom.setValue(personagensHpAtualizadosListAtom.value);
    List<Personagem> outrosPersonagens = [];
    outrosPersonagens.addAll(personagensHpAtualizadosListAtom.value);
    outrosPersonagens
        .removeWhere((element) => element.nome == figthOponentAtom.value.nome);
    outrosPersonagens.removeWhere(
        (element) => element.nome == personagemEscolhidoAtom.value.nome);
    outrosPersonagens
        .removeWhere((e) => deadOponentsListAtom.value.contains(e));

    outrosPersonagens.shuffle();

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Center(
          heightFactor: 0.9,
          widthFactor: 0.9,
          child: Text(
            'CAMPANHA ${campanhaAtom.value}',
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.height * 0.05,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            resultWidget(personagemEscolhidoAtom.value, altura * 0.2,
                danoCausadoAtom.value, danoRecebidoAtom.value),
            vsWidget(altura * 0.02),
            resultWidget(figthOponentAtom.value, altura * 0.2,
                danoRecebidoAtom.value, danoCausadoAtom.value),
          ],
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.4,
          width: MediaQuery.of(context).size.width * 0.98,
          child: ListView.builder(
              itemCount: (outrosPersonagens.length / 2).floor(),
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: rowResultWidget(
                      outrosPersonagens[index],
                      outrosPersonagens[outrosPersonagens.length - 1 - index],
                      altura * 0.2),
                );
              }),
        ),
        FractionallySizedBox(
          widthFactor: altura > largura ? 0.8 : 0.3,
          child: Card(
            elevation: 15,
            margin: const EdgeInsets.all(8),
            child: TextButton(
                onPressed: () {
                  danoCausadoAtom.setValue(0);
                  danoRecebidoAtom.setValue(0);
                  classificationListAtom
                      .setValue(personagensHpAtualizadosListAtom.value);
                  gameStates.setValue(GameStates.CLASSIFICATION);
                },
                child: Center(
                    child: Text(
                  'Classificação',
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height * 0.03,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromRGBO(68, 2, 6, 0.9)),
                ))),
          ),
        )
      ],
    );
  }
}
