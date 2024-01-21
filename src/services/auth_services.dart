import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:hackathon23/src/atoms/auth_atoms.dart';
import 'package:hackathon23/src/comum/states.dart';
import 'package:hackathon23/src/models/new_user_model.dart';

class AuthServices {
  final _authFB = FirebaseAuth.instance;

  void createUserFBAuth(AuthUserModel user) async {
    try {
      await _authFB.createUserWithEmailAndPassword(
          email: user.email, password: user.password);
      authStatusAtom.setValue(AuthState.SUCESS);
    } on FirebaseAuthException catch (e) {
      authStatusAtom.setValue(AuthState.ERROR);
      if (e.code == 'weak-password') {
        errorAtom.setValue(
            'A senha fornecida é muito fraca. Digite, ao menos, 6 caracteres.');
      } else if (e.code == 'email-already-in-use') {
        errorAtom.setValue('Esta conta já está cadastrada.');
        authStatusAtom.setValue(AuthState.ERROR);
      }
    } catch (e) {
      errorAtom.setValue(e.toString());
      authStatusAtom.setValue(AuthState.ERROR);
    }
  }

  Future loginFB(AuthUserModel user) async {
    try {
      await _authFB.signInWithEmailAndPassword(
          email: user.email, password: user.password);
      authStatusAtom.setValue(AuthState.SUCESS);
    } on FirebaseAuthException catch (e) {
      errorAtom.setValue('${e.code}: ${e.message}');
      authStatusAtom.setValue(AuthState.ERROR);
    } catch (e) {
      errorAtom.setValue('${e.toString()}: Erro inesperado.');
      authStatusAtom.setValue(AuthState.ERROR);
    }
  }
}
