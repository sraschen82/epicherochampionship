// ignore_for_file: constant_identifier_names

enum Attributes {
  NEUTRO("Neutro"),
  FORCA("Força"),
  DEFESA("Defesa"),
  DESTREZA("Destreza"),
  INTELIGENCIA("Inteligência"),
  RESISTENCIA_FISICA("Resistência Física"),
  RESISTENCIA_MAGICA("Resistência Mágica"),
  SORTE("Sorte"),
  ESQUIVA("Esquiva"),
  CURA("Cura"),
  MALDICAO("Maldição"),
  VELOCIDADE("Velocidade"),
  REGENERACAO_MANA("Regeneração de mana");

  final String descricao;

  const Attributes(this.descricao);
}
