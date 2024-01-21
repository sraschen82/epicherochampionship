import 'package:asp/asp.dart';
import 'package:hackathon23/src/models/game_model.dart';
import 'package:hackathon23/src/models/personagem_model.dart';

//Atom -----------------
final firebaseNewGameAtom = Atom<GameModel>(GameModel(
    gameName: '',
    myHero: PersonagemVazio(),
    opponentsList: [],
    adversariosEnfrentadosList: [],
    deadOpponentsList: []));

final stringGameNamesAtom = Atom<List<String>>([]);
final selectedLoadGameAtom = Atom<String>('');
//Action ---------------

final addNewGameToFirebaseAction = Atom.action();
final fetchGameListAction = Atom.action();
final saveGameAction = Atom.action();
final deleteGameAction = Atom<String>('');
