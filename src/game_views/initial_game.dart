import 'package:asp/asp.dart';
import 'package:flutter/material.dart';
import 'package:hackathon23/src/atoms/firebase_atoms.dart';
import 'package:hackathon23/src/atoms/page_atoms.dart';
import 'package:hackathon23/src/comum/my_colors.dart';
import 'package:hackathon23/src/comum/states.dart';
import 'package:hackathon23/src/widgets/alerts_dialogs.dart';

class InitialGame extends StatelessWidget {
  InitialGame({super.key});
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    context.select(() => {
          initialBottomStatusAtom,
          savedGameAtom,
          stringGameNamesAtom,
          snackErrorsAtom,
          statusAtom,
        });

    saveNewGame() {
      controller.text.isNotEmpty
          ? {
              savedGameAtom.setValue(controller.text),
              gameStates.setValue(GameStates.SELECT_HERO)
            }
          : gameStates.setValue(GameStates.INITIAL);
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(15, 20, 15, 70),
            child: TextButton(
              style: ButtonStyle(
                  minimumSize: const MaterialStatePropertyAll(Size(200, 60)),
                  maximumSize: const MaterialStatePropertyAll(Size(500, 100)),
                  shadowColor: MaterialStatePropertyAll(MyColors().goldBorder),
                  backgroundColor: const MaterialStatePropertyAll(
                      Color.fromARGB(255, 2, 26, 63)),
                  elevation: const MaterialStatePropertyAll(30),
                  shape: const MaterialStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30))))),
              onPressed: () {
                initialBottomStatusAtom.value == BottomStatus.NEW_GAME
                    ? initialBottomStatusAtom.setValue(BottomStatus.GAME_NAME)
                    : saveNewGame();
              },
              child: initialBottomStatusAtom.value == BottomStatus.NEW_GAME
                  ? const Text('Novo Jogo',
                      style: TextStyle(color: Colors.white))
                  : SingleChildScrollView(
                      child: Column(
                        children: [
                          const Text('Escolha o nome do jogo',
                              style: TextStyle(color: Colors.white)),
                          TextFormField(
                            autofocus: true,
                            controller: controller,
                            textInputAction: TextInputAction.send,
                            cursorColor: Colors.white,
                            maxLength: 30,
                            keyboardType: TextInputType.text,
                            style: const TextStyle(color: Colors.white),
                            onFieldSubmitted: (value) => saveNewGame(),
                          ),
                          TextButton(
                              onPressed: () => saveNewGame(),
                              child: const Text('Salvar',
                                  style: TextStyle(color: Colors.white))),
                        ],
                      ),
                    ),
            ),
          ),
        ),
        Expanded(
          flex: 7,
          child: Container(
            alignment: Alignment.topCenter,
            padding: const EdgeInsets.fromLTRB(15, 0, 15, 30),
            constraints: const BoxConstraints(
                minHeight: 50, maxHeight: 80, minWidth: 200, maxWidth: 500),
            child: Card(
              borderOnForeground: true,
              elevation: 30,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30))),
              child: FractionallySizedBox(
                  heightFactor: 0.9,
                  widthFactor: 0.7,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('Carregar Jogo',
                              style: TextStyle(fontSize: 25)),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.4,
                          width: MediaQuery.of(context).size.width * 0.7,
                          child: ListView.builder(
                              itemCount: stringGameNamesAtom.value.isEmpty
                                  ? 1
                                  : stringGameNamesAtom.value.length,
                              itemBuilder: (BuildContext cnt, int index) {
                                return stringGameNamesAtom.value.isEmpty
                                    ? const Center(child: Text(''))
                                    : Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          TextButton(
                                              onPressed: () {
                                                selectedLoadGameAtom.setValue(
                                                    stringGameNamesAtom
                                                        .value[index]);
                                                if (statusAtom.value ==
                                                    Status.ERROR) {
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                          snackErrorsAtom
                                                              .value);
                                                }
                                              },
                                              child: Text(stringGameNamesAtom
                                                  .value[index])),
                                          IconButton(
                                              icon: const Icon(Icons
                                                  .delete_forever_outlined),
                                              onPressed: () {
                                                showAlertDeleteGame(
                                                    context: context,
                                                    gameName:
                                                        stringGameNamesAtom
                                                            .value[index],
                                                    confirm: () {
                                                      deleteGameAction.setValue(
                                                          stringGameNamesAtom
                                                              .value[index]);
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    cancel: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                    });
                                              }),
                                        ],
                                      );
                              }),
                        ),
                      ],
                    ),
                  )),
            ),
          ),
        ),
      ],
    );
  }
}
