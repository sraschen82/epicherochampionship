import 'package:hackathon23/src/game_informations/attack_types.dart';
import 'package:hackathon23/src/game_informations/breeds.dart';
import 'package:hackathon23/src/game_informations/warrior_classes.dart';
import 'package:hackathon23/src/models/personagem_model.dart';

gameData() {
  Personagem legolas = Personagem(
    imagemPath: 'assets/images/legolas.jpg',
    nome: 'Legolas',
    raca: Breeds.HUMANO,
    classe: Classe.ARQUEIRO,
    attackPower: 8,
    defencePower: 2,
    atualHP: 500,
    haveLife: true,
    nivel: 1,
    ataques: {
      AttackDamage.ATAQUE_SIMPLES: AttackTypes.ATAQUE_SIMPLES,
      AttackDamage.ATAQUE_ESPECIAL_1: AttackTypes.ATAQUE_A_DISTANCIA,
      AttackDamage.ATAQUE_ESPECIAL_2: AttackTypes.ATAQUE_FURTIVO,
    },
  );

  Personagem aquiles = Personagem(
    imagemPath: 'assets/images/aquiles.jpg',
    nome: 'Aquiles',
    raca: Breeds.SEMI_DEUS,
    classe: Classe.GUERREIRO,
    attackPower: 6,
    defencePower: 4,
    atualHP: 500,
    haveLife: true,
    nivel: 1,
    ataques: {
      AttackDamage.ATAQUE_SIMPLES: AttackTypes.ATAQUE_SIMPLES,
      AttackDamage.ATAQUE_ESPECIAL_1: AttackTypes.ATAQUE_FURTIVO,
      AttackDamage.ATAQUE_ESPECIAL_2: AttackTypes.ATAQUE_A_DISTANCIA,
    },
  );

  Personagem golias = Personagem(
    imagemPath: 'assets/images/golias.jpg',
    nome: 'Golias',
    raca: Breeds.HUMANO,
    classe: Classe.GIGANTE,
    attackPower: 2,
    defencePower: 8,
    atualHP: 500,
    haveLife: true,
    nivel: 1,
    ataques: {
      AttackDamage.ATAQUE_SIMPLES: AttackTypes.ATAQUE_SIMPLES,
      AttackDamage.ATAQUE_ESPECIAL_1: AttackTypes.ATAQUE_FISICO,
      AttackDamage.ATAQUE_ESPECIAL_2: AttackTypes.ATAQUE_A_DISTANCIA,
    },
  );

  Personagem harry = Personagem(
    imagemPath: 'assets/images/harrypotter.jpg',
    nome: 'Harry Potter',
    raca: Breeds.HUMANO,
    classe: Classe.MAGO,
    attackPower: 7,
    defencePower: 3,
    atualHP: 500,
    haveLife: true,
    nivel: 1,
    ataques: {
      AttackDamage.ATAQUE_SIMPLES: AttackTypes.ATAQUE_SIMPLES,
      AttackDamage.ATAQUE_ESPECIAL_1: AttackTypes.ATAQUE_MAGICO,
      AttackDamage.ATAQUE_ESPECIAL_2: AttackTypes.ATAQUE_VENENOSO,
    },
  );

  Personagem naruto = Personagem(
    imagemPath: 'assets/images/naruto.jpg',
    nome: 'Naruto',
    raca: Breeds.ANIME,
    classe: Classe.GUERREIRO,
    attackPower: 7,
    defencePower: 3,
    atualHP: 500,
    haveLife: true,
    nivel: 1,
    ataques: {
      AttackDamage.ATAQUE_SIMPLES: AttackTypes.ATAQUE_SIMPLES,
      AttackDamage.ATAQUE_ESPECIAL_1: AttackTypes.ATAQUE_FISICO,
      AttackDamage.ATAQUE_ESPECIAL_2: AttackTypes.ATAQUE_A_DISTANCIA,
    },
  );

  Personagem bumblebee = Personagem(
    imagemPath: 'assets/images/bumblebee.jpg',
    nome: 'Bumblebee',
    raca: Breeds.ROBO,
    classe: Classe.GIGANTE,
    attackPower: 5,
    defencePower: 5,
    atualHP: 500,
    haveLife: true,
    nivel: 1,
    ataques: {
      AttackDamage.ATAQUE_SIMPLES: AttackTypes.ATAQUE_SIMPLES,
      AttackDamage.ATAQUE_ESPECIAL_1: AttackTypes.ATAQUE_FISICO,
      AttackDamage.ATAQUE_ESPECIAL_2: AttackTypes.ATAQUE_FURTIVO,
    },
  );

  Personagem pikachu = Personagem(
    imagemPath: 'assets/images/pikachu.jpg',
    nome: 'Pikachu',
    raca: Breeds.ANIME,
    classe: Classe.GUERREIRO,
    attackPower: 9,
    defencePower: 1,
    atualHP: 500,
    haveLife: true,
    nivel: 1,
    ataques: {
      AttackDamage.ATAQUE_SIMPLES: AttackTypes.ATAQUE_SIMPLES,
      AttackDamage.ATAQUE_ESPECIAL_1: AttackTypes.ATAQUE_FURTIVO,
      AttackDamage.ATAQUE_ESPECIAL_2: AttackTypes.ATAQUE_A_DISTANCIA,
    },
  );

  Personagem goku = Personagem(
    imagemPath: 'assets/images/goku.jpg',
    nome: 'Goku',
    raca: Breeds.ANIME,
    classe: Classe.GUERREIRO,
    attackPower: 5,
    defencePower: 5,
    atualHP: 500,
    haveLife: true,
    nivel: 1,
    ataques: {
      AttackDamage.ATAQUE_SIMPLES: AttackTypes.ATAQUE_SIMPLES,
      AttackDamage.ATAQUE_ESPECIAL_1: AttackTypes.ATAQUE_FISICO,
      AttackDamage.ATAQUE_ESPECIAL_2: AttackTypes.ATAQUE_A_DISTANCIA,
    },
  );

  Personagem batman = Personagem(
    imagemPath: 'assets/images/batman.jpg',
    nome: 'Batman',
    raca: Breeds.HUMANO,
    classe: Classe.GUERREIRO,
    attackPower: 5,
    defencePower: 5,
    atualHP: 500,
    haveLife: true,
    nivel: 1,
    ataques: {
      AttackDamage.ATAQUE_SIMPLES: AttackTypes.ATAQUE_SIMPLES,
      AttackDamage.ATAQUE_ESPECIAL_1: AttackTypes.ATAQUE_FISICO,
      AttackDamage.ATAQUE_ESPECIAL_2: AttackTypes.ATAQUE_FURTIVO,
    },
  );

  Personagem spiderman = Personagem(
    imagemPath: 'assets/images/spiderman.jpg',
    nome: 'Spiderman',
    raca: Breeds.HUMANO,
    classe: Classe.GUERREIRO,
    attackPower: 3,
    defencePower: 7,
    atualHP: 500,
    haveLife: true,
    nivel: 1,
    ataques: {
      AttackDamage.ATAQUE_SIMPLES: AttackTypes.ATAQUE_SIMPLES,
      AttackDamage.ATAQUE_ESPECIAL_1: AttackTypes.ATAQUE_A_DISTANCIA,
      AttackDamage.ATAQUE_ESPECIAL_2: AttackTypes.ATAQUE_FURTIVO,
    },
  );

  Personagem sparrow = Personagem(
    imagemPath: 'assets/images/jack.jpg',
    nome: 'Jack Sparrow',
    raca: Breeds.HUMANO,
    classe: Classe.PIRATA,
    attackPower: 1,
    defencePower: 9,
    atualHP: 500,
    haveLife: true,
    nivel: 1,
    ataques: {
      AttackDamage.ATAQUE_SIMPLES: AttackTypes.ATAQUE_SIMPLES,
      AttackDamage.ATAQUE_ESPECIAL_1: AttackTypes.ATAQUE_A_DISTANCIA,
      AttackDamage.ATAQUE_ESPECIAL_2: AttackTypes.ATAQUE_FURTIVO,
    },
  );

  Personagem rambo = Personagem(
    imagemPath: 'assets/images/rambo.jpg',
    nome: 'Rambo',
    raca: Breeds.HUMANO,
    classe: Classe.GUERREIRO,
    attackPower: 8,
    defencePower: 2,
    atualHP: 500,
    haveLife: true,
    nivel: 1,
    ataques: {
      AttackDamage.ATAQUE_SIMPLES: AttackTypes.ATAQUE_SIMPLES,
      AttackDamage.ATAQUE_ESPECIAL_1: AttackTypes.ATAQUE_A_DISTANCIA,
      AttackDamage.ATAQUE_ESPECIAL_2: AttackTypes.ATAQUE_FISICO,
    },
  );

  Personagem wolverine = Personagem(
    imagemPath: 'assets/images/wolverine.jpg',
    nome: 'Wolverine',
    raca: Breeds.HUMANO,
    classe: Classe.GUERREIRO,
    attackPower: 5,
    defencePower: 5,
    atualHP: 500,
    haveLife: true,
    nivel: 1,
    ataques: {
      AttackDamage.ATAQUE_SIMPLES: AttackTypes.ATAQUE_SIMPLES,
      AttackDamage.ATAQUE_ESPECIAL_1: AttackTypes.ATAQUE_FISICO,
      AttackDamage.ATAQUE_ESPECIAL_2: AttackTypes.ATAQUE_FURTIVO,
    },
  );

  Personagem voldemort = Personagem(
    imagemPath: 'assets/images/voldemort.jpg',
    nome: 'Lord Voldemort',
    raca: Breeds.HUMANO,
    classe: Classe.GUERREIRO,
    attackPower: 7,
    defencePower: 3,
    atualHP: 500,
    haveLife: true,
    nivel: 1,
    ataques: {
      AttackDamage.ATAQUE_SIMPLES: AttackTypes.ATAQUE_SIMPLES,
      AttackDamage.ATAQUE_ESPECIAL_1: AttackTypes.ATAQUE_VENENOSO,
      AttackDamage.ATAQUE_ESPECIAL_2: AttackTypes.ATAQUE_MAGICO,
    },
  );

  Personagem medusa = Personagem(
    imagemPath: 'assets/images/medusa.jpg',
    nome: 'Medusa',
    raca: Breeds.DEMONIO,
    classe: Classe.MITOLOGIA,
    attackPower: 9,
    defencePower: 1,
    atualHP: 500,
    haveLife: true,
    nivel: 1,
    ataques: {
      AttackDamage.ATAQUE_SIMPLES: AttackTypes.ATAQUE_SIMPLES,
      AttackDamage.ATAQUE_ESPECIAL_1: AttackTypes.ATAQUE_VENENOSO,
      AttackDamage.ATAQUE_ESPECIAL_2: AttackTypes.ATAQUE_A_DISTANCIA,
    },
  );

  Personagem mulherMaravilha = Personagem(
    imagemPath: 'assets/images/maravilha.jpg',
    nome: 'Mulher Maravilha',
    raca: Breeds.HUMANO,
    classe: Classe.GUERREIRO,
    attackPower: 5,
    defencePower: 5,
    atualHP: 500,
    haveLife: true,
    nivel: 1,
    ataques: {
      AttackDamage.ATAQUE_SIMPLES: AttackTypes.ATAQUE_SIMPLES,
      AttackDamage.ATAQUE_ESPECIAL_1: AttackTypes.ATAQUE_FURTIVO,
      AttackDamage.ATAQUE_ESPECIAL_2: AttackTypes.ATAQUE_A_DISTANCIA,
    },
  );

  Personagem sonic = Personagem(
    imagemPath: 'assets/images/sonic.jpg',
    nome: 'Sonic',
    raca: Breeds.ANIME,
    classe: Classe.SEM_CLASSE,
    attackPower: 2,
    defencePower: 8,
    atualHP: 500,
    haveLife: true,
    nivel: 1,
    ataques: {
      AttackDamage.ATAQUE_SIMPLES: AttackTypes.ATAQUE_SIMPLES,
      AttackDamage.ATAQUE_ESPECIAL_1: AttackTypes.ATAQUE_FISICO,
      AttackDamage.ATAQUE_ESPECIAL_2: AttackTypes.ATAQUE_FURTIVO,
    },
  );

  Personagem magneto = Personagem(
    imagemPath: 'assets/images/magneto.jpg',
    nome: 'Magneto',
    raca: Breeds.FILME,
    classe: Classe.GUERREIRO,
    attackPower: 7,
    defencePower: 3,
    atualHP: 500,
    haveLife: true,
    nivel: 1,
    ataques: {
      AttackDamage.ATAQUE_SIMPLES: AttackTypes.ATAQUE_SIMPLES,
      AttackDamage.ATAQUE_ESPECIAL_1: AttackTypes.ATAQUE_FURTIVO,
      AttackDamage.ATAQUE_ESPECIAL_2: AttackTypes.ATAQUE_A_DISTANCIA,
    },
  );

  Personagem athena = Personagem(
    imagemPath: 'assets/images/athena.jpg',
    nome: 'Deusa Athena',
    raca: Breeds.DEUS,
    classe: Classe.MITOLOGIA,
    attackPower: 2,
    defencePower: 8,
    atualHP: 500,
    haveLife: true,
    nivel: 1,
    ataques: {
      AttackDamage.ATAQUE_SIMPLES: AttackTypes.ATAQUE_SIMPLES,
      AttackDamage.ATAQUE_ESPECIAL_1: AttackTypes.ATAQUE_FURTIVO,
      AttackDamage.ATAQUE_ESPECIAL_2: AttackTypes.ATAQUE_A_DISTANCIA,
    },
  );

  Personagem laraCroft = Personagem(
    imagemPath: 'assets/images/lara.png',
    nome: 'Lara Croft',
    raca: Breeds.HUMANO,
    classe: Classe.GUERREIRO,
    attackPower: 7,
    defencePower: 3,
    atualHP: 500,
    haveLife: true,
    nivel: 1,
    ataques: {
      AttackDamage.ATAQUE_SIMPLES: AttackTypes.ATAQUE_SIMPLES,
      AttackDamage.ATAQUE_ESPECIAL_1: AttackTypes.ATAQUE_FURTIVO,
      AttackDamage.ATAQUE_ESPECIAL_2: AttackTypes.ATAQUE_A_DISTANCIA,
    },
  );

  List<Personagem> personagensDoJogo = [
    aquiles,
    golias,
    harry,
    legolas,
    naruto,
    bumblebee,
    pikachu,
    goku,
    batman,
    spiderman,
    sparrow,
    rambo,
    wolverine,
    voldemort,
    medusa,
    mulherMaravilha,
    sonic,
    magneto,
    athena,
    laraCroft,
  ];
  personagensDoJogo.sort((a, b) => a.nome.compareTo(b.nome));
  return personagensDoJogo;
}
