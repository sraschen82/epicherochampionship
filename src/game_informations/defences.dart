// ignore_for_file: constant_identifier_names

enum Defences {
  DEFESA_SIMPLES(descricao: 'Proteger-se com as mãos', defenceNumber: 1),
  DEFESA_FISICA(descricao: 'Afastar Oponente', defenceNumber: 2),
  DEFESA_DE_FUGA(descricao: 'Protejer as Costas', defenceNumber: 3),
  DEFESA_ESQUIVA(descricao: 'Esquivar-se', defenceNumber: 4),
  DEFESA_MAGICA(descricao: 'Desviar Magia', defenceNumber: 5),
  DEFESA_COM_ANTIDOTOS(descricao: 'Tomar Antídoto', defenceNumber: 6),
  SEM_DEFESA(descricao: 'Sem defesa', defenceNumber: 0);

  final String descricao;
  final int defenceNumber;
  const Defences({required this.descricao, required this.defenceNumber});
}
