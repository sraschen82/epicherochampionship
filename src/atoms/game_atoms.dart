import 'package:asp/asp.dart';
import 'package:hackathon23/src/comum/constants.dart';
import 'package:hackathon23/src/comum/states.dart';
import 'package:hackathon23/src/game_informations/attack_types.dart';
import 'package:hackathon23/src/game_informations/defences.dart';
import 'package:hackathon23/src/models/personagem_model.dart';
import 'package:hackathon23/src/services/game_data.dart';

//---------------------Atoms ---------------------------------

//Single Atoms
final myPositionAtom = Atom<int>(1);
final medalAtom = Atom<FinalPosition>(FinalPosition.MORTE);
final xpAtom = Atom<int>(1);

//Lists
final personagensListAtom = Atom<List<Personagem>>(gameData());
final classificationListAtom = Atom<List<Personagem>>([]);
final personagensHpAtualizadosListAtom = Atom<List<Personagem>>([]);
final adversariosListAtom = Atom<List<Personagem>>([]);
final adversariosEnfrentadosListAtom = Atom<List<Personagem>>([]);
final deadOponentsListAtom = Atom<List<Personagem>>([]);

//Figth oponents
final personagemEscolhidoAtom = Atom<Personagem>(PersonagemVazio());
final figthOponentAtom = Atom<Personagem>(PersonagemVazio());

//Figth States
final figthStatesAtom = Atom<FigthStates>(FigthStates.ATAQUE);

//Figth Page Elements
final roundsAtom = Atom<FigthRounds>(FigthRounds.ROUND_1);
final campanhaAtom = Atom<int>(0);

//Attack / Defence
final attackTypeAtom = Atom<AttackTypes>(AttackTypes.NENHUM);
final defenderTypeAtom = Atom<Defences>(Defences.SEM_DEFESA);
final danoIniciallAtom = Atom<int>(0);
final danoFinalAtom = Atom<int>(0);
final danoCausadoAtom = Atom<int>(0);
final danoRecebidoAtom = Atom<int>(0);
//final randomDemageListAtom = Atom<List<int>>([]);

//-------------------Actions --------------------------------
final personagemSettingsAction = Atom.action();
final danoAction = Atom<int>(0);
final attackButtonAction = Atom<int>(0);
final defenceButtonAction = Atom<Defences>(Defences.SEM_DEFESA);
final updateSettingsAttackAction = Atom.action();
final updateSettingsDefenceAction = Atom.action();
//final randomDemageAction = Atom.action();
final newGameAction = Atom<int>(0);
final classificationButtonAction = Atom.action();
