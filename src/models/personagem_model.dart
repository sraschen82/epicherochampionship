import 'package:hackathon23/src/game_informations/attack_types.dart';
import 'package:hackathon23/src/game_informations/attributes.dart';
import 'package:hackathon23/src/game_informations/breeds.dart';
import 'package:hackathon23/src/game_informations/warrior_classes.dart';
import 'package:hackathon23/src/services/game_data.dart';

class Personagem {
  final String imagemPath;
  final String nome;
  final Breeds raca;
  final Classe classe;
  final int attackPower;
  int atualHP;
  bool haveLife;
  final int defencePower;

  int nivel;
  final List<Attributes>? atributos = [];
  final Map<AttackDamage, AttackTypes> ataques;

  Personagem({
    required this.imagemPath,
    required this.nome,
    required this.raca,
    required this.classe,
    required this.attackPower,
    required this.atualHP,
    required this.haveLife,
    required this.defencePower,
    required this.nivel,
    required this.ataques,
  });

  Map<String, dynamic> toFirestore() {
    return {
      'nome': nome,
      'atualHP': atualHP,
      'haveLife': haveLife,
    };
  }

  factory Personagem.fromFB(Map<String, dynamic> fbData) {
    String nomeFb = fbData['nome'];
    List<Personagem> list = gameData();
    Personagem personagemInicial =
        list.firstWhere((element) => element.nome == nomeFb);

    Personagem newPersonagem = Personagem(
      imagemPath: personagemInicial.imagemPath,
      nome: fbData['nome'],
      raca: personagemInicial.raca,
      classe: personagemInicial.classe,
      attackPower: personagemInicial.attackPower,
      atualHP: fbData['atualHP'],
      haveLife: fbData['haveLife'],
      defencePower: personagemInicial.defencePower,
      nivel: personagemInicial.nivel,
      ataques: personagemInicial.ataques,
    );

    return newPersonagem;
  }
}

class PersonagemVazio extends Personagem {
  PersonagemVazio()
      : super(
          imagemPath: '',
          nome: '',
          raca: Breeds.NENHUMA,
          classe: Classe.SEM_CLASSE,
          attackPower: 0,
          defencePower: 0,
          atualHP: 0,
          haveLife: true,
          nivel: 0,
          ataques: {},
        );
}
