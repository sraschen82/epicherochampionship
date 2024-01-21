// ignore_for_file: constant_identifier_names

enum AuthState {
  INICIAL,
  LOADING,
  SUCESS,
  ERROR,
}

enum AuthChengePage {
  LOGIN(naView: 'LOGIN'),
  CADASTRAR(naView: 'CADASTRO');

  final String naView;

  const AuthChengePage({required this.naView});
}

enum BottomStatus {
  NEW_GAME,
  GAME_NAME;
}

enum Status {
  INICIAL,
  LOADING,
  SUCESS,
  ERROR;
}

enum GameStates {
  INITIAL,
  SELECT_HERO,
  SELEC_OPONENT,
  FIGHT,
  RESULTS,
  CLASSIFICATION,
  LOADING,
  FINAL_POSITION,
  ERROR;
}

enum FigthRounds {
  ROUND_1(descricao: 'Round 1'),
  ROUND_2(descricao: 'Round 2'),
  ROUND_3(descricao: 'Round 3');

  final String descricao;

  const FigthRounds({
    required this.descricao,
  });
}

enum FigthStates {
  ATAQUE,
  DEFESA,
  COMPARATIVO_ATAQUE,
  COMPARATIVO_DEFESA,
  LOADING;
}
