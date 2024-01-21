import 'package:flutter/material.dart';

showAlertDeleteGame(
    {required BuildContext context,
    required String gameName,
    required confirm,
    required cancel}) {
  Widget cancelButton = TextButton(
    onPressed: cancel,
    child: const Text("Cancel"),
  );
  Widget yesButton = TextButton(
    onPressed: confirm,
    child: const Text("Sim"),
  );

  AlertDialog alert = AlertDialog(
    title: const Text("Cuidado!"),
    content: Text("Deletar o jogo $gameName?"),
    actions: [
      cancelButton,
      yesButton,
    ],
  );

  showDialog(
    context: context,
    useSafeArea: true,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
