// ignore_for_file: constant_identifier_names

enum AttackTypes {
  ATAQUE_SIMPLES(descricao: "Golpear", attackNumber: 1),
  ATAQUE_FISICO(descricao: "Enforcar", attackNumber: 2),
  ATAQUE_FURTIVO(descricao: "Atacar pelas Costas", attackNumber: 3),
  ATAQUE_A_DISTANCIA(descricao: "Atacar à Distância", attackNumber: 4),
  ATAQUE_MAGICO(descricao: "Usar Magia", attackNumber: 5),
  ATAQUE_VENENOSO(descricao: "Atacar com Poção", attackNumber: 6),
  NENHUM(descricao: 'Nenhum', attackNumber: 0);

  final String descricao;
  final int attackNumber;

  const AttackTypes({required this.descricao, required this.attackNumber});
}

enum AttackDamage {
  ATAQUE_SIMPLES(descricao: "Ataque Simples", dano: 1),
  ATAQUE_ESPECIAL_1(descricao: "Ataque Especial 1", dano: 2),
  ATAQUE_ESPECIAL_2(descricao: "Ataque Especial 2", dano: 3);

  final String descricao;
  final int dano;

  const AttackDamage({required this.descricao, required this.dano});
}
