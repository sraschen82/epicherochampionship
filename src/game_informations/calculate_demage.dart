import 'package:hackathon23/src/game_informations/attack_types.dart';
import 'package:hackathon23/src/game_informations/defences.dart';

double calculateDefence(AttackTypes ataque, Defences defesa) {
  double defencePower = 0;
  ataque.attackNumber == defesa.defenceNumber
      ? defencePower = 1
      : defencePower = 0.2;
  return defencePower;
}

calculateDamage(int danoAtaque, AttackTypes tipoAtaque, Defences tipoDefesa,
    int attackPower, int defencePower, int xp) {
  int danoFinal = 0;
  double inAttackPower = 1 + attackPower / 10;
  double inDefencePower = 1 + defencePower / 10;
  double defesa = 1 - calculateDefence(tipoAtaque, tipoDefesa);
  danoFinal = (2 * danoAtaque * defesa * xp * (inAttackPower / inDefencePower) +
          1 -
          tipoDefesa.defenceNumber * 0.2)
      .round();

  return danoFinal;
}
