import 'package:asp/asp.dart';
import 'package:flutter/material.dart';
import 'package:hackathon23/src/atoms/game_atoms.dart';
import 'package:hackathon23/src/comum/atual_hp_view.dart';
import 'package:hackathon23/src/comum/my_colors.dart';
import 'package:hackathon23/src/models/personagem_model.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class Classification extends StatelessWidget {
  const Classification({super.key});

  @override
  Widget build(BuildContext context) {
    context.select(() => {
          personagensHpAtualizadosListAtom,
          classificationListAtom,
          adversariosListAtom,
          deadOponentsListAtom
        });

    int classificationListAtomLength = classificationListAtom.value.length;

    double altura = MediaQuery.of(context).size.height;
    double largura = MediaQuery.of(context).size.width;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          heightFactor: 0.9,
          widthFactor: 0.9,
          child: Text(
            'CLASSIFICAÇÃO - CAMPANHA ${campanhaAtom.value}',
            style: TextStyle(
                fontSize: MediaQuery.of(context).size.height * 0.026,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(227, 64, 29, 219)),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.7,
          width: MediaQuery.of(context).size.width * 0.85,
          child: ListView.builder(
              itemCount: classificationListAtomLength,
              itemBuilder: (BuildContext ctx, int index) {
                List<Personagem> classificacao = classificationListAtom.value;
                classificacao.sort((a, b) => b.atualHP.compareTo(a.atualHP));
                myPositionAtom.setValue(classificationListAtom.value
                        .indexOf(personagemEscolhidoAtom.value) +
                    1);
                return Card(
                  borderOnForeground: true,
                  color: classificacao.elementAt(index).haveLife == false
                      ? Colors.grey
                      : classificacao.elementAt(index) ==
                              personagemEscolhidoAtom.value
                          ? MyColors().goldBorder
                          : Colors.white,
                  elevation: 30,
                  child: ListTile(
                    splashColor: Colors.cyan,
                    style: ListTileStyle.drawer,
                    shape: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    contentPadding: const EdgeInsets.all(2),
                    iconColor: Colors.red,
                    leading: SizedBox(
                      height: 30,
                      width: 90,
                      child: Card(
                        elevation: 15,
                        borderOnForeground: true,
                        margin: const EdgeInsets.all(1),
                        color: Colors.white,
                        child: ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          child: Image.asset(
                            classificacao[index].imagemPath,
                            height: double.infinity,
                            width: double.infinity,
                            fit: BoxFit.cover,
                            filterQuality: FilterQuality.high,
                          ),
                        ),
                      ),
                    ),
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('${index + 1}. ${classificacao[index].nome}'),
                        Row(
                          children: [
                            Icon(MdiIcons.heart,
                                color: const Color.fromARGB(255, 158, 21, 11)),
                            Text(
                                '${atualHPinView(classificacao[index].atualHP)}',
                                style: const TextStyle(
                                    color: Color.fromARGB(255, 158, 21, 11),
                                    fontWeight: FontWeight.bold)),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              }),
        ),
        FractionallySizedBox(
          widthFactor: altura > largura ? 0.8 : 0.5,
          child: Card(
            elevation: 15,
            margin: const EdgeInsets.all(8),
            child: TextButton(
                onPressed: () => classificationButtonAction(),
                child: Center(
                    child: Text(
                  'Selecionar Oponente',
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
