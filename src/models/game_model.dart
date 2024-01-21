import 'package:hackathon23/src/models/personagem_model.dart';

class GameModel {
  final String gameName;
  final Personagem myHero;
  final List<Personagem> opponentsList;
  final List<Personagem> deadOpponentsList;
  final List<Personagem> adversariosEnfrentadosList;

  GameModel(
      {required this.gameName,
      required this.myHero,
      required this.opponentsList,
      required this.adversariosEnfrentadosList,
      required this.deadOpponentsList});

  List<Map<String, dynamic>> toFirestore(List<Personagem> personagens) {
    List<Map<String, dynamic>> list = [];
    for (var personagem in personagens) {
      list.add(personagem.toFirestore());
    }
    return list;
  }
}
