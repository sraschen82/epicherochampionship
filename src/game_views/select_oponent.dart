import 'package:asp/asp.dart';
import 'package:flutter/material.dart';
import 'package:hackathon23/src/atoms/game_atoms.dart';
import 'package:hackathon23/src/atoms/page_atoms.dart';
import 'package:hackathon23/src/comum/states.dart';

class SelectOponent extends StatelessWidget {
  const SelectOponent({super.key});

  @override
  Widget build(BuildContext context) {
    context.select(() => {
          personagemEscolhidoAtom,
          figthOponentAtom,
          gameStates,
          adversariosListAtom,
          deadOponentsListAtom,
        });

    adversariosListAtom.value
        .removeWhere((e) => deadOponentsListAtom.value.contains(e));

    return SingleChildScrollView(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.893,
                  width: MediaQuery.of(context).size.height * 0.98,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    child: Image.asset(
                      personagemEscolhidoAtom.value.imagemPath,
                      height: double.infinity,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      filterQuality: FilterQuality.high,
                    ),
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
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Card(
                        color: Colors.white.withOpacity(0.6),
                        margin: const EdgeInsets.all(5),
                        elevation: 40,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            personagemEscolhidoAtom.value.nome,
                            style: const TextStyle(
                                fontSize: 60, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(5, 15, 5, 10),
                        child: Center(
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height * 0.1,
                            width: MediaQuery.of(context).size.height * 0.1,
                            child: ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(30)),
                              child: Image.asset(
                                'assets/images/vs.png',
                                height: double.maxFinite,
                                width: double.maxFinite,
                                fit: BoxFit.cover,
                                filterQuality: FilterQuality.high,
                                alignment: Alignment.center,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.55,
                        width: MediaQuery.of(context).size.height * 0.8,
                        margin: const EdgeInsets.fromLTRB(15, 30, 15, 20),
                        child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent: 150,
                                  childAspectRatio: 2 / 3,
                                  crossAxisSpacing: 20,
                                  mainAxisSpacing: 20),
                          itemCount: adversariosListAtom.value.length,
                          itemBuilder: (BuildContext ctx, index) {
                            return Card(
                              elevation: 30,
                              child: Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10)),
                                ),
                                child: Stack(
                                  children: [
                                    ClipRRect(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(10)),
                                      child: Image.asset(
                                        adversariosListAtom
                                            .value[index].imagemPath,
                                        height: double.infinity,
                                        width: double.infinity,
                                        fit: BoxFit.cover,
                                        filterQuality: FilterQuality.high,
                                      ),
                                    ),
                                    Container(
                                      constraints: const BoxConstraints.expand(
                                          width: BorderSide.strokeAlignOutside,
                                          height:
                                              BorderSide.strokeAlignOutside),
                                      color: Colors.black.withOpacity(0.8),
                                    ),
                                    Center(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Card(
                                            color:
                                                Colors.white.withOpacity(0.6),
                                            margin: const EdgeInsets.all(5),
                                            elevation: 20,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                adversariosListAtom
                                                    .value[index].nome,
                                                style: const TextStyle(
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.bold),
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
                                        onPressed: () {
                                          figthOponentAtom.setValue(
                                              adversariosListAtom.value[index]);
                                          gameStates.setValue(GameStates.FIGHT);
                                        },
                                        child: Container(
                                          constraints:
                                              const BoxConstraints.expand(
                                                  width: BorderSide
                                                      .strokeAlignOutside,
                                                  height: BorderSide
                                                      .strokeAlignOutside),
                                          color: Colors.black.withOpacity(0.8),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ]),
    );
  }
}
