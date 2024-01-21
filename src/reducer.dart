import 'dart:async';
import 'dart:math';
import 'package:asp/asp.dart';

import 'package:hackathon23/src/atoms/auth_atoms.dart';
import 'package:hackathon23/src/atoms/firebase_atoms.dart';
import 'package:hackathon23/src/atoms/game_atoms.dart';
import 'package:hackathon23/src/atoms/page_atoms.dart';
import 'package:hackathon23/src/comum/constants.dart';
import 'package:hackathon23/src/comum/states.dart';
import 'package:hackathon23/src/game_informations/calculate_demage.dart';
import 'package:hackathon23/src/game_informations/defences.dart';
import 'package:hackathon23/src/models/game_model.dart';
import 'package:hackathon23/src/models/new_user_model.dart';
import 'package:hackathon23/src/models/personagem_model.dart';
import 'package:hackathon23/src/services/auth_services.dart';
import 'package:hackathon23/src/services/firebase_services.dart';
import 'package:hackathon23/src/services/game_data.dart';
import 'package:hackathon23/src/widgets/snacks.dart';

class AppReducer extends Reducer {
  final FirebaseServices firebaseServices;
  final AuthServices authservices;

  AppReducer(this.firebaseServices, this.authservices) {
    //Auth
    on(() => [authUserCreateAction], _createAuthNewUser);
    on(() => [loggedUserAtom], _loginFb);
    on(() => [exitAppAction], _exitApp);

    //Firebase Actions
    on(() => [addNewGameToFirebaseAction], _addNewGameToFirebase);
    on(() => [fetchGameListAction], _fetchGames);
    on(() => [selectedLoadGameAtom], _loadSelectedGame);
    on(() => [saveGameAction], _saveGame);
    on(() => [deleteGameAction], _deleteGame);

    //gameAction
    on(() => [updateSettingsAttackAction], _updateAttackSettings);
    on(() => [updateSettingsDefenceAction], _updateDefenceSettings);
    on(() => [attackButtonAction], _attackSettings);
    on(() => [defenceButtonAction], _defenceSettings);

    on(() => [newGameAction], _newGameActions);
    on(() => [classificationButtonAction], _classificationButton);
  }

//Auth metods --------------------
  _createAuthNewUser() async {
    statusAtom.setValue(Status.LOADING);
    try {
      authservices.createUserFBAuth(authUserCreateAction.value);

      statusAtom.setValue(Status.SUCESS);
    } catch (e) {
      errorAtom.setValue(e.toString());
      statusAtom.setValue(Status.ERROR);
    }
  }

  _loginFb() async {
    authStatusAtom.setValue(AuthState.LOADING);

    try {
      await authservices.loginFB(loggedUserAtom.value);
      authStatusAtom.value == AuthState.SUCESS;
    } catch (e) {
      authStatusAtom.setValue(AuthState.ERROR);
      errorAtom.setValue(e.toString());
    }
    authStatusAtom.value == AuthState.SUCESS
        ? {
            fetchGameListAction(),
            userIsLogAtom.setValue(true),
          }
        : userIsLogAtom.setValue(false);
  }

  _exitApp() {
    firebaseNewGameAtom.setValue(GameModel(
        gameName: '',
        myHero: PersonagemVazio(),
        opponentsList: [],
        adversariosEnfrentadosList: [],
        deadOpponentsList: []));

    stringGameNamesAtom.setValue([]);
    selectedLoadGameAtom.setValue('');
    authUserCreateAction.setValue(AuthUserModel(email: '', password: ''));
    userIsLogAtom.setValue(false);
    gameStates.setValue(GameStates.INITIAL);
  }

// Firebase Actions ---------------

  _addNewGameToFirebase() async {
    final Map<String, dynamic> data = {
      'xp': xpAtom.value,
      'hero': firebaseNewGameAtom.value.myHero.toFirestore(),
      'opponents': firebaseNewGameAtom.value
          .toFirestore(firebaseNewGameAtom.value.opponentsList),
      'faced': firebaseNewGameAtom.value
          .toFirestore(firebaseNewGameAtom.value.adversariosEnfrentadosList),
      'dead': firebaseNewGameAtom.value
          .toFirestore(firebaseNewGameAtom.value.deadOpponentsList)
    };

    await firebaseServices.db
        .collection(loggedUserAtom.value.email)
        .doc(firebaseNewGameAtom.value.gameName)
        .set(data);
  }

  _fetchGames() async {
    List<String> gameNames = [];
    try {
      final gameRef = await firebaseServices.db
          .collection(loggedUserAtom.value.email)
          .get();
      for (var doc in gameRef.docs) {
        String id = doc.id;
        gameNames.add(id);
      }

      stringGameNamesAtom.setValue(gameNames);
      statusAtom.setValue(Status.SUCESS);
    } catch (e) {
      statusAtom.setValue(Status.ERROR);
      snackErrorsAtom
          .setValue(errorSnackBar('Erro ao carregar: ', e.toString()));
    }
  }

  _loadSelectedGame() async {
    statusAtom.setValue(Status.LOADING);
    try {
      final loadedGameRef = await firebaseServices.db
          .collection(loggedUserAtom.value.email)
          .doc(selectedLoadGameAtom.value)
          .get();

      int xpData = loadedGameRef.data()?['xp'];
      if (xpData.sign == 1) {
        xpAtom.setValue(xpData.toInt());
      }

      Map<String, dynamic> heroData = loadedGameRef.data()?['hero'];
      if (heroData.isNotEmpty) {
        Personagem myHero = Personagem.fromFB(heroData);
        personagemEscolhidoAtom.setValue(myHero);
      }

      List<dynamic> opponentsData = loadedGameRef.data()?['opponents'];
      List<Personagem> adversarios = [];
      for (var element in opponentsData) {
        Personagem personagem = Personagem.fromFB(element);
        adversarios.add(personagem);
      }
      adversarios.sort((a, b) => a.nome.compareTo(b.nome));
      adversariosListAtom.setValue(adversarios);

      List<dynamic> enfrentadosData = loadedGameRef.data()?['faced'];
      List<Personagem> adversariosEnfrentados = [];
      for (var element in enfrentadosData) {
        Personagem personagem = Personagem.fromFB(element);
        adversariosEnfrentados.add(personagem);
      }
      adversariosEnfrentadosListAtom.setValue(adversariosEnfrentados);

      List<dynamic> deadsData = loadedGameRef.data()?['dead'];
      List<Personagem> deadsOpponents = [];
      for (var element in deadsData) {
        Personagem personagem = Personagem.fromFB(element);
        deadsOpponents.add(personagem);
      }
      deadOponentsListAtom.setValue(deadsOpponents);

      List<Personagem> completList = [];
      completList.add(personagemEscolhidoAtom.value);
      completList.addAll(adversariosListAtom.value);
      completList.addAll(adversariosEnfrentadosListAtom.value);
      completList.addAll(deadOponentsListAtom.value);
      personagensHpAtualizadosListAtom.setValue(completList);
      campanhaAtom.setValue(adversariosEnfrentadosListAtom.value.length);
      statusAtom.setValue(Status.SUCESS);
      gameStates.setValue(GameStates.SELEC_OPONENT);
    } catch (e) {
      statusAtom.setValue(Status.ERROR);
      snackErrorsAtom
          .setValue(errorSnackBar('Erro ao carregar: ', e.toString()));
    }
  }

  _saveGame() async {
    statusAtom.setValue(Status.INICIAL);
    GameModel saveGame = GameModel(
        gameName: loggedUserAtom.value.email,
        myHero: personagemEscolhidoAtom.value,
        opponentsList: adversariosListAtom.value,
        adversariosEnfrentadosList: adversariosEnfrentadosListAtom.value,
        deadOpponentsList: deadOponentsListAtom.value);

    final Map<String, dynamic> data = {
      'hero': personagemEscolhidoAtom.value.toFirestore(),
      'opponents': saveGame.toFirestore(saveGame.opponentsList),
      'faced': saveGame.toFirestore(saveGame.adversariosEnfrentadosList),
      'dead': saveGame.toFirestore(saveGame.deadOpponentsList),
      'xp': xpAtom.value,
    };

    try {
      await firebaseServices.db
          .collection(saveGame.gameName)
          .doc(selectedLoadGameAtom.value)
          .set(data);

      snackSaveGameAtom.setValue(saveSnackBar('Jogo Salvo'));
      statusAtom.setValue(Status.SUCESS);
    } catch (e) {
      snackErrorsAtom
          .setValue(errorSnackBar('Erro ao carregar: ', e.toString()));
      statusAtom.setValue(Status.ERROR);
    }
  }

  _deleteGame() async {
    gameStates.setValue(GameStates.LOADING);
    await firebaseServices.db
        .collection(loggedUserAtom.value.email)
        .doc(deleteGameAction.value)
        .delete();
    fetchGameListAction();
    gameStates.setValue(GameStates.INITIAL);
  }

  //Game metods -------------

  _newGameActions() async {
    personagensHpAtualizadosListAtom.setValue(personagensListAtom.value);
    personagemEscolhidoAtom
        .setValue(personagensListAtom.value[newGameAction.value]);

    List<Personagem> adversarios = gameData();
    adversarios
        .removeWhere((item) => item.nome == personagemEscolhidoAtom.value.nome);
    adversariosListAtom.setValue(adversarios);

    GameModel newGame = GameModel(
        gameName: savedGameAtom.value,
        myHero: personagemEscolhidoAtom.value,
        opponentsList: adversarios,
        adversariosEnfrentadosList: adversariosEnfrentadosListAtom.value,
        deadOpponentsList: deadOponentsListAtom.value);
    firebaseNewGameAtom.setValue(newGame);
    loggedUserAtom.value.savedGames.add(newGame);
    addNewGameToFirebaseAction();
    gameStates.setValue(GameStates.SELEC_OPONENT);
  }

  _updateAttackSettings() async {
    figthOponentAtom.value.atualHP -= danoFinalAtom.value;
    personagemEscolhidoAtom.value.atualHP += danoFinalAtom.value;
    figthOponentAtom.value.atualHP < 1
        ? {
            figthOponentAtom.value.atualHP = -adversariosListAtom.value.length,
            figthOponentAtom.value.haveLife = false,
            deadOponentsListAtom.value.add(figthOponentAtom.value),
            classificationListAtom.value
                .removeWhere((e) => e.nome == figthOponentAtom.value.nome),
            figthStatesAtom.setValue(FigthStates.LOADING),
            await Future.delayed(const Duration(seconds: 1)),
            figthStatesAtom.setValue(FigthStates.COMPARATIVO_ATAQUE),
            await Future.delayed(const Duration(seconds: 5)),
            figthStatesAtom.setValue(FigthStates.ATAQUE),
            avaliarRodada(FigthRounds.ROUND_3),
          }
        : () {};
    danoCausadoAtom.value += danoFinalAtom.value;
  }

  _updateDefenceSettings() async {
    personagemEscolhidoAtom.value.atualHP -= danoFinalAtom.value;

    xpAtom.setValue(xpAtom.value + 1);

    figthOponentAtom.value.atualHP += danoFinalAtom.value;
    personagemEscolhidoAtom.value.atualHP < 1
        ? {
            personagemEscolhidoAtom.value.atualHP =
                -adversariosListAtom.value.length,
            figthStatesAtom.setValue(FigthStates.LOADING),
            await Future.delayed(const Duration(seconds: 1)),
            figthStatesAtom.setValue(FigthStates.COMPARATIVO_DEFESA),
            await Future.delayed(const Duration(seconds: 5)),
            medalAtom.setValue(FinalPosition.MORTE),
            gameStates.setValue(GameStates.FINAL_POSITION),
          }
        : () {};

    danoRecebidoAtom.value += danoFinalAtom.value;
  }

  _attackSettings() async {
    int index = Random().nextInt(7);

    List<Defences> defesas = [
      Defences.DEFESA_SIMPLES,
      Defences.DEFESA_FISICA,
      Defences.DEFESA_DE_FUGA,
      Defences.DEFESA_ESQUIVA,
      Defences.DEFESA_MAGICA,
      Defences.DEFESA_COM_ANTIDOTOS
    ];

    defenderTypeAtom.setValue(defesas[index]);

    danoIniciallAtom.setValue(attackButtonAction.value);
    attackTypeAtom.setValue(personagemEscolhidoAtom.value.ataques.values
        .elementAt(attackButtonAction.value - 1));
    figthStatesAtom.setValue(FigthStates.COMPARATIVO_ATAQUE);

    danoFinalAtom.setValue(
      calculateDamage(
          danoIniciallAtom.value,
          attackTypeAtom.value,
          defenderTypeAtom.value,
          personagemEscolhidoAtom.value.attackPower,
          figthOponentAtom.value.defencePower,
          xpAtom.value),
    );
    updateSettingsAttackAction();
    figthStatesAtom.setValue(FigthStates.LOADING);
    await Future.delayed(const Duration(seconds: 1));
    figthStatesAtom.setValue(FigthStates.COMPARATIVO_ATAQUE);
    await Future.delayed(const Duration(seconds: 5));

    figthStatesAtom.setValue(FigthStates.DEFESA);
    danoFinalAtom.setValue(0);
  }

  _defenceSettings() async {
    int index = Random().nextInt(3);

    attackTypeAtom
        .setValue(figthOponentAtom.value.ataques.values.elementAt(index));

    danoIniciallAtom.setValue(attackTypeAtom.value.attackNumber);

    defenderTypeAtom.setValue(defenceButtonAction.value);
    figthStatesAtom.setValue(FigthStates.COMPARATIVO_DEFESA);

    danoFinalAtom.setValue(
      calculateDamage(
          danoIniciallAtom.value,
          attackTypeAtom.value,
          defenderTypeAtom.value,
          figthOponentAtom.value.attackPower,
          personagemEscolhidoAtom.value.defencePower,
          xpAtom.value),
    );
    updateSettingsDefenceAction();
    figthStatesAtom.setValue(FigthStates.LOADING);
    await Future.delayed(const Duration(seconds: 1));
    figthStatesAtom.setValue(FigthStates.COMPARATIVO_DEFESA);
    await Future.delayed(const Duration(seconds: 5));
    avaliarRodada(roundsAtom.value);
    figthStatesAtom.setValue(FigthStates.ATAQUE);
    danoFinalAtom.setValue(0);
  }

  avaliarRodada(FigthRounds rodada) async {
    if (rodada == FigthRounds.ROUND_1) {
      roundsAtom.setValue(FigthRounds.ROUND_2);
    }
    if (rodada == FigthRounds.ROUND_2) {
      roundsAtom.setValue(FigthRounds.ROUND_3);
    }
    if (rodada == FigthRounds.ROUND_3) {
      Future.delayed(const Duration(seconds: 2));
      roundsAtom.setValue(FigthRounds.ROUND_1);

      campanhaAtom.value += 1;
      gameStates.setValue(GameStates.RESULTS);
    }
  }

//Page Buttons -------------------

  _classificationButton() async {
    adversariosListAtom.value.clear();
    adversariosListAtom.value.addAll(personagensHpAtualizadosListAtom.value);
    adversariosListAtom.value.removeWhere(
        (element) => element.nome == personagemEscolhidoAtom.value.nome);
    adversariosListAtom.value.removeWhere(
        (element) => adversariosEnfrentadosListAtom.value.contains(element));
    campanhaAtom.setValue(campanhaAtom.value++);

    adversariosListAtom.value.isNotEmpty
        ? gameStates.setValue(GameStates.SELEC_OPONENT)
        : {
            switch (myPositionAtom.value) {
              1 => medalAtom.setValue(FinalPosition.OURO),
              2 => medalAtom.setValue(FinalPosition.PRATA),
              3 => medalAtom.setValue(FinalPosition.BRONZE),
              _ => medalAtom.setValue(FinalPosition.MERITO),
            },
            gameStates.setValue(GameStates.FINAL_POSITION)
          };
  }
}
