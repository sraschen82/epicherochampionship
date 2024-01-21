import 'package:asp/asp.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hackathon23/firebase_options.dart';
import 'package:hackathon23/src/atoms/auth_atoms.dart';
import 'package:hackathon23/src/pages/auth_page.dart';
import 'package:hackathon23/src/pages/game_page.dart';
import 'package:hackathon23/src/reducer.dart';
import 'package:hackathon23/src/services/auth_services.dart';
import 'package:hackathon23/src/services/firebase_services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final appReducer = AppReducer(FirebaseServices(), AuthServices());

  runApp(const RxRoot(child: Hachathon23()));
}

class Hachathon23 extends StatelessWidget {
  const Hachathon23({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    final isLogged = context.select(() => userIsLogAtom.value);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hackathon 2023',
      theme: ThemeData(
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          elevation: 80,
          backgroundColor: Color.fromARGB(255, 68, 81, 255),
        ),
        appBarTheme:
            const AppBarTheme(titleSpacing: 4, backgroundColor: Colors.black),
        colorScheme: const ColorScheme.light(background: Colors.blue),
        useMaterial3: true,
      ),
      home: isLogged ? const GamePage() : const AuthPage(),
    );
  }
}
