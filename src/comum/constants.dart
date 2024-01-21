// ignore_for_file: constant_identifier_names

enum FinalPosition {
  OURO(
      path: 'assets/images/ouro.jpg',
      descricao: 'CAMPEÃO',
      recado: 'PARABÉNS!'),
  PRATA(
      path: 'assets/images/prata.jpg',
      descricao: '2º LUGAR',
      recado: 'PARABÉNS!'),
  BRONZE(
      path: 'assets/images/bronze.png',
      descricao: '3º LUGAR',
      recado: 'PARABÉNS!'),
  MERITO(
      path: 'assets/images/merito.jpg',
      descricao: 'NOVAMENTE! ',
      recado: 'TENTE'),
  MORTE(
      path: 'assets/images/morte.jpg',
      descricao: 'VOCÊ MORREU',
      recado: 'QUE PENA ,');

  final String path;
  final String descricao;
  final String recado;

  const FinalPosition(
      {required this.path, required this.descricao, required this.recado});
}
