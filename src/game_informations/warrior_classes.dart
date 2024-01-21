// ignore_for_file: constant_identifier_names

enum Classe {
  ARQUEIRO(descricao: 'Arqueiro'),
  GUERREIRO(descricao: 'Guerreiro'),
  MAGO(descricao: 'Mago'),
  MONGE(descricao: 'Monge'),
  GIGANTE(descricao: 'Tanque'),
  TEMPLARIO(descricao: 'Templario'),
  SAMURAI(descricao: 'Samurai'),
  PIRATA(descricao: 'Pirata'),
  MITOLOGIA(descricao: 'Ser mitológico'),
  SEM_CLASSE(descricao: 'Sem Classe');

  final String descricao;
  const Classe({required this.descricao});
}
