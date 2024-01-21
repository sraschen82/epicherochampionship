// ignore_for_file: constant_identifier_names

import 'package:hackathon23/src/game_informations/attributes.dart';

enum Breeds {
  HUMANO("Humano", Attributes.INTELIGENCIA),
  ELFO("Elfo", Attributes.DESTREZA),
  ANAO("Anão", Attributes.RESISTENCIA_FISICA),
  DRACONICO("Dracônico", Attributes.RESISTENCIA_MAGICA),
  ORC("Orc", Attributes.FORCA),
  GNOMO("Gnomo", Attributes.SORTE),
  HALFLING("Halfling", Attributes.VELOCIDADE),
  DEMONIO("Demônio", Attributes.MALDICAO),
  SEMI_DEUS("Semi-Deus", Attributes.FORCA),
  DEUS("Deus", Attributes.FORCA),
  ANIME('Anime', Attributes.RESISTENCIA_MAGICA),
  ROBO('Robô', Attributes.FORCA),
  FILME('Filme', Attributes.DESTREZA),
  NENHUMA('Nenhuma', Attributes.NEUTRO);

  final String descricaoRaca;
  final Attributes atributoAssociado;

  const Breeds(this.descricaoRaca, this.atributoAssociado);
}
