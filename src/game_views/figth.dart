import 'package:asp/asp.dart';
import 'package:flutter/material.dart';
import 'package:hackathon23/src/atoms/game_atoms.dart';
import 'package:hackathon23/src/atoms/page_atoms.dart';
import 'package:hackathon23/src/comum/atual_hp_view.dart';
import 'package:hackathon23/src/comum/my_colors.dart';
import 'package:hackathon23/src/comum/states.dart';
import 'package:hackathon23/src/game_informations/defences.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class GameFigth extends StatelessWidget {
  const GameFigth({super.key});

  @override
  Widget build(BuildContext context) {
    double altura = MediaQuery.of(context).size.height;
    double largura = MediaQuery.of(context).size.width;

    context.select(() => {
          personagemEscolhidoAtom,
          figthOponentAtom,
          gameStates,
          roundsAtom,
          danoAction,
          figthStatesAtom,
          attackTypeAtom,
          defenderTypeAtom,
          danoIniciallAtom,
          danoFinalAtom,
          danoCausadoAtom,
          danoRecebidoAtom,
          defenceButtonAction,
          adversariosListAtom,
        });

    TextButton botomAttack(int index, acao) {
      return TextButton(
          onPressed: acao,
          child: Text(
            personagemEscolhidoAtom.value.ataques.values
                .elementAt(index - 1)
                .descricao,
            style: TextStyle(fontSize: altura * 0.02, color: Colors.white),
          ));
    }

    TextButton botomDefence(Defences defesa, acao) {
      return TextButton(
          onPressed: acao,
          child: Text(
            defesa.descricao,
            style: TextStyle(fontSize: altura * 0.02, color: Colors.white),
          ));
    }

    Widget statsLayout(Tooltip icon, int valor) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          icon,
          Padding(
            padding: EdgeInsets.only(left: altura * 0.02),
            child: Text('$valor',
                style:
                    TextStyle(fontSize: altura * 0.023, color: Colors.white)),
          ),
        ],
      );
    }

    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            fit: FlexFit.tight,
            flex: 2,
            child: Stack(
              fit: StackFit.passthrough,
              alignment: Alignment.center,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.25,
                  width: MediaQuery.of(context).size.height * 0.98,
                  child: DecoratedBox(
                      position: DecorationPosition.foreground,
                      decoration: BoxDecoration(
                        gradient: MyColors().gradientFigthCards(),
                        backgroundBlendMode: BlendMode.colorBurn,
                      )),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Text(personagemEscolhidoAtom.value.nome,
                            style: const TextStyle(
                                fontSize: 25, color: Colors.white)),
                        statsLayout(
                            Tooltip(
                              message: 'Vida',
                              child: Icon(MdiIcons.heart, color: Colors.red),
                            ),
                            atualHPinView(
                                personagemEscolhidoAtom.value.atualHP)),
                        statsLayout(
                            const Tooltip(
                              message: 'Dano Total',
                              child: Icon(
                                Icons.fluorescent_outlined,
                                color: Colors.white,
                              ),
                            ),
                            danoCausadoAtom.value),
                        statsLayout(
                            Tooltip(
                                message: 'Força de Ataque',
                                child: Icon(MdiIcons.magicStaff,
                                    color: Colors.white)),
                            personagemEscolhidoAtom.value.attackPower),
                        statsLayout(
                            const Tooltip(
                              message: 'Força de Defesa',
                              child: Icon(
                                Icons.panorama_photosphere_select_outlined,
                                color: Colors.white,
                                fill: 0.5,
                              ),
                            ),
                            personagemEscolhidoAtom.value.defencePower),
                      ],
                    ),
                    Column(
                      children: [
                        Text(figthOponentAtom.value.nome,
                            style: const TextStyle(
                                fontSize: 25, color: Colors.white)),
                        statsLayout(
                            Tooltip(
                              message: 'Vida',
                              child: Icon(MdiIcons.heart, color: Colors.red),
                            ),
                            atualHPinView(figthOponentAtom.value.atualHP)),
                        statsLayout(
                            const Tooltip(
                              message: 'Dano Total',
                              child: Icon(Icons.fluorescent_outlined,
                                  color: Colors.white),
                            ),
                            danoRecebidoAtom.value),
                        statsLayout(
                            Tooltip(
                              message: 'Força de Ataque',
                              child: Icon(MdiIcons.magicStaff,
                                  color: Colors.white),
                            ),
                            figthOponentAtom.value.attackPower),
                        statsLayout(
                            const Tooltip(
                              message: 'Força de Defesa',
                              child: Icon(
                                Icons.panorama_photosphere_select_outlined,
                                color: Colors.white,
                                fill: 0.5,
                              ),
                            ),
                            figthOponentAtom.value.defencePower),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Flexible(
            fit: FlexFit.tight,
            flex: 4,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.51,
                  width: MediaQuery.of(context).size.height * 0.98,
                  child: ClipRRect(
                    child: Image.asset(
                      'assets/images/cenario1.gif',
                      height: double.infinity,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      filterQuality: FilterQuality.high,
                    ),
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.18,
                      width: MediaQuery.of(context).size.height * 0.18,
                      child: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        child: Image.asset(
                          personagemEscolhidoAtom.value.imagemPath,
                          height: double.infinity,
                          width: double.infinity,
                          fit: BoxFit.cover,
                          filterQuality: FilterQuality.high,
                        ),
                      ),
                    ),
                    const Padding(padding: EdgeInsets.fromLTRB(20, 0, 20, 0)),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.18,
                      width: MediaQuery.of(context).size.height * 0.18,
                      child: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        child: Image.asset(
                          figthOponentAtom.value.imagemPath,
                          height: double.infinity,
                          width: double.infinity,
                          fit: BoxFit.cover,
                          filterQuality: FilterQuality.high,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Flexible(
            fit: FlexFit.tight,
            flex: 3,
            child: Stack(
              alignment: Alignment.topCenter,
              fit: StackFit.loose,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.28,
                  width: MediaQuery.of(context).size.height * 0.98,
                  child: DecoratedBox(
                      position: DecorationPosition.foreground,
                      decoration: BoxDecoration(
                        gradient: MyColors().gradientFight(),
                        backgroundBlendMode: BlendMode.colorBurn,
                        border: Border.all(
                          strokeAlign: BorderSide.strokeAlignOutside,
                        ),
                      )),
                ),
                Padding(
                  padding: EdgeInsets.only(top: altura * 0.01),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        figthStatesAtom.value !=
                                    FigthStates.COMPARATIVO_ATAQUE &&
                                figthStatesAtom.value !=
                                    FigthStates.COMPARATIVO_DEFESA
                            ? Text(roundsAtom.value.descricao,
                                style: TextStyle(
                                    fontSize: altura * 0.025,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.red))
                            : Text('COMBATE',
                                style: TextStyle(
                                    fontSize: altura * 0.025,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.red)),
                        Center(
                            child: switch (figthStatesAtom.value) {
                          FigthStates.ATAQUE => Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                botomAttack(
                                    1, () => attackButtonAction.setValue(1)),
                                botomAttack(
                                    2, () => attackButtonAction.setValue(2)),
                                botomAttack(
                                    3, () => attackButtonAction.setValue(3)),
                              ],
                            ),
                          FigthStates.DEFESA => Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      botomDefence(
                                          Defences.DEFESA_SIMPLES,
                                          () => defenceButtonAction.setValue(
                                              Defences.DEFESA_SIMPLES)),
                                      botomDefence(
                                          Defences.DEFESA_FISICA,
                                          () => defenceButtonAction.setValue(
                                              Defences.DEFESA_FISICA)),
                                      botomDefence(
                                          Defences.DEFESA_DE_FUGA,
                                          () => defenceButtonAction.setValue(
                                              Defences.DEFESA_DE_FUGA)),
                                    ]),
                                Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      botomDefence(
                                          Defences.DEFESA_ESQUIVA,
                                          () => defenceButtonAction.setValue(
                                              Defences.DEFESA_ESQUIVA)),
                                      botomDefence(
                                          Defences.DEFESA_MAGICA,
                                          () => defenceButtonAction.setValue(
                                              Defences.DEFESA_MAGICA)),
                                      botomDefence(
                                          Defences.DEFESA_COM_ANTIDOTOS,
                                          () => defenceButtonAction.setValue(
                                              Defences.DEFESA_COM_ANTIDOTOS)),
                                    ]),
                              ],
                            ),
                          FigthStates.COMPARATIVO_ATAQUE =>
                            FractionallySizedBox(
                                widthFactor: 0.99,
                                alignment: Alignment.center,
                                child: Card(
                                  borderOnForeground: true,
                                  margin: const EdgeInsets.all(8),
                                  elevation: 20,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(attackTypeAtom.value.descricao,
                                              maxLines: 1,
                                              overflow: TextOverflow.visible),
                                          const Text('    VS     '),
                                          Text(defenderTypeAtom.value.descricao,
                                              maxLines: 1,
                                              overflow: TextOverflow.visible)
                                        ],
                                      ),
                                      Text(
                                          'Dano Causado: ${danoFinalAtom.value}'),
                                    ],
                                  ),
                                )),
                          FigthStates.COMPARATIVO_DEFESA =>
                            FractionallySizedBox(
                                widthFactor: 0.99,
                                child: Card(
                                  margin: const EdgeInsets.all(8),
                                  elevation: 20,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(defenderTypeAtom.value.descricao,
                                              maxLines: 1,
                                              overflow: TextOverflow.visible),
                                          const Text('    VS     '),
                                          Text(attackTypeAtom.value.descricao,
                                              maxLines: 1,
                                              overflow: TextOverflow.visible)
                                        ],
                                      ),
                                      Text(
                                          'Dano Recebido: ${danoFinalAtom.value}'),
                                    ],
                                  ),
                                )),
                          FigthStates.LOADING =>
                            const Center(child: CircularProgressIndicator()),
                        }),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ]);
  }
}
