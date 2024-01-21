import 'package:asp/asp.dart';
import 'package:flutter/material.dart';
import 'package:hackathon23/src/comum/states.dart';
import 'package:hackathon23/src/widgets/snacks.dart';

//Atoms
final statusAtom = Atom<Status>(Status.INICIAL);
final gameStates = Atom<GameStates>(GameStates.INITIAL);
final initialBottomStatusAtom = Atom<BottomStatus>(BottomStatus.NEW_GAME);
final savedGameAtom = Atom<String>('');

final snackErrorsAtom = Atom<SnackBar>(errorSnackBar('', ''));
final snackSaveGameAtom = Atom<SnackBar>(saveSnackBar(''));



//Actions
