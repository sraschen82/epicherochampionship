import 'package:hackathon23/src/models/game_model.dart';

class AuthUserModel {
  final String email;
  final String password;
  List<GameModel> savedGames = [];

  AuthUserModel({required this.email, required this.password});
}
