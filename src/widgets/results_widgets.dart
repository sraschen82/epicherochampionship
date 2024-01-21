import 'package:flutter/material.dart';
import 'package:hackathon23/src/atoms/game_atoms.dart';
import 'package:hackathon23/src/comum/atual_hp_view.dart';
import 'package:hackathon23/src/models/personagem_model.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

resultWidget(
    Personagem personagem, double valor, int danoCausado, int danoRecebido) {
  personagensHpAtualizadosListAtom.value
      .removeWhere((element) => element.nome == personagem.nome);

  personagem != personagemEscolhidoAtom.value &&
          personagem != figthOponentAtom.value
      ? {
          personagem.atualHP += (danoCausado - danoRecebido),
          personagem.atualHP < 1
              ? {
                  personagem.atualHP = -adversariosListAtom.value.length,
                  personagem.haveLife = false,
                  danoCausado = 0,
                  danoRecebido = 0,
                  deadOponentsListAtom.value.add(personagem),
                  classificationListAtom.value
                      .removeWhere((e) => e.nome == personagem.nome),
                  adversariosListAtom.value
                      .removeWhere((element) => element.nome == personagem.nome)
                }
              : () {},
        }
      : () {};

  personagensHpAtualizadosListAtom.value.add(personagem);

  return SizedBox(
    height: valor,
    width: valor,
    child: Stack(
      alignment: Alignment.bottomCenter,
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          child: Image.asset(
            personagem.imagemPath,
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.cover,
            filterQuality: FilterQuality.high,
          ),
        ),
        FractionallySizedBox(
          heightFactor: 0.5,
          widthFactor: 0.9,
          alignment: Alignment.center,
          child: Card(
            elevation: 15,
            borderOnForeground: true,
            margin: const EdgeInsets.all(1),
            color: Colors.black.withOpacity(0.7),
            child: ListTile(
              leading: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(MdiIcons.heart,
                      color: const Color.fromARGB(255, 158, 21, 11)),
                  Text('${atualHPinView(personagem.atualHP)}',
                      style: const TextStyle(
                          color: Color.fromARGB(255, 158, 21, 11),
                          fontWeight: FontWeight.bold)),
                ],
              ),
              title: Text(personagem.nome,
                  maxLines: 1,
                  overflow: TextOverflow.visible,
                  style: const TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                      fontWeight: FontWeight.bold)),
              subtitle: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      const SizedBox(height: 10),
                      const Text('DC',
                          style: TextStyle(
                              color: Color.fromARGB(255, 55, 26, 182))),
                      Text('$danoCausado',
                          style: const TextStyle(
                              color: Color.fromARGB(255, 55, 26, 182))),
                    ],
                  ),
                  Column(
                    children: [
                      const SizedBox(height: 10),
                      const Text('DR',
                          style: TextStyle(
                              color: Color.fromARGB(255, 192, 29, 42))),
                      Text('$danoRecebido',
                          style: const TextStyle(
                              color: Color.fromARGB(255, 192, 29, 42))),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
