import 'dart:async';
import 'package:asp/asp.dart';
import 'package:flutter/material.dart';
import 'package:hackathon23/src/atoms/auth_atoms.dart';
import 'package:hackathon23/src/atoms/firebase_atoms.dart';
import 'package:hackathon23/src/comum/my_colors.dart';
import 'package:hackathon23/src/comum/states.dart';
import 'package:hackathon23/src/models/new_user_model.dart';
import 'package:hackathon23/src/widgets/snacks.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    context.select(() => {authStatusAtom.value, errorAtom.value});

    final fazerLogin = context.select(() => authOptionsAtom.value);

    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    validarForm() async {
      if (authOptionsAtom.value == AuthChengePage.CADASTRAR) {
        final newUser = AuthUserModel(
            email: emailController.text, password: passwordController.text);
        authUserCreateAction.setValue(newUser);

        loggedUserAtom.setValue(newUser);
        await Future.delayed(const Duration(seconds: 2));

        authStatusAtom.value == AuthState.SUCESS
            ? {
                fetchGameListAction(),
                userIsLogAtom.setValue(true),
              }
            : userIsLogAtom.setValue(false);
        //---------
        emailController.text = '';
        passwordController.text = '';
        Timer(const Duration(seconds: 2), () {
          if (authStatusAtom.value == AuthState.ERROR) {
            ScaffoldMessenger.of(context).showSnackBar(
              errorSnackBar('Erro ao cadastrar.', errorAtom.value),
            );
          }
        });
      } else {
        final newUser = AuthUserModel(
            email: emailController.text, password: passwordController.text);
        loggedUserAtom.setValue(newUser);

        emailController.text = '';
        passwordController.text = '';
        Timer(const Duration(seconds: 2), () {
          if (authStatusAtom.value == AuthState.ERROR) {
            ScaffoldMessenger.of(context).showSnackBar(
              errorSnackBar('E-mail ou senha incorretos. ', errorAtom.value),
            );
          }
        });
      }
    }

    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: AppBar(
        title: Text(
          fazerLogin.naView,
          style: const TextStyle(
              fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        forceMaterialTransparency: true,
        elevation: 50,
        bottomOpacity: BorderSide.strokeAlignCenter,
        titleSpacing: 3,
        toolbarHeight: 50,
        actions: [
          TextButton(
              onPressed: () => authOptionsAtom.value == AuthChengePage.LOGIN
                  ? authOptionsAtom.setValue(AuthChengePage.CADASTRAR)
                  : authOptionsAtom.setValue(AuthChengePage.LOGIN),
              child: switch (fazerLogin) {
                AuthChengePage.LOGIN => const Center(
                      child: Text(
                    'Cadastre-se',
                    style: TextStyle(color: Colors.white),
                  )),
                AuthChengePage.CADASTRAR => const Center(
                      child: Text(
                    'Login',
                    style: TextStyle(color: Colors.white),
                  )),
              })
        ],
      ),
      body: SafeArea(
        maintainBottomViewPadding: true,
        child: Container(
          decoration: BoxDecoration(
            gradient: MyColors().gradientAuth(),
          ),
          alignment: Alignment.center,
          child: Card(
            elevation: 30,
            borderOnForeground: true,
            margin: const EdgeInsets.fromLTRB(30, 40, 30, 30),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Expanded(
                      flex: 20,
                      child: SizedBox(
                        height: 10,
                      )),
                  Expanded(
                    flex: 20,
                    child: TextFormField(
                      controller: emailController,
                      autofocus: true,
                      textInputAction: TextInputAction.next,
                      decoration: const InputDecoration(
                          alignLabelWithHint: true,
                          hoverColor: Colors.white,
                          errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red)),
                          contentPadding: EdgeInsets.all(30),
                          hintText: 'teste@fluttertest.com',
                          label: Text('E-mail'),
                          border: OutlineInputBorder(
                            gapPadding: BorderSide.strokeAlignOutside,
                            borderSide: BorderSide(color: Colors.blueAccent),
                            borderRadius: BorderRadius.all(
                              Radius.circular(30),
                            ),
                          ),
                          constraints: BoxConstraints(
                              minHeight: 10,
                              maxHeight: 50,
                              minWidth: 200,
                              maxWidth: 500)),
                      keyboardType: TextInputType.emailAddress,
                    ),
                  ),
                  Expanded(
                    flex: 20,
                    child: TextFormField(
                      controller: passwordController,
                      obscureText: true,
                      textInputAction: TextInputAction.done,
                      onFieldSubmitted: (value) => validarForm(),
                      decoration: const InputDecoration(
                          hoverColor: Colors.white,
                          errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red)),
                          contentPadding: EdgeInsets.all(30),
                          hintText: 'Your Password',
                          label: Text('Password'),
                          border: OutlineInputBorder(
                            gapPadding: BorderSide.strokeAlignOutside,
                            borderSide: BorderSide(color: Colors.blueAccent),
                            borderRadius: BorderRadius.all(
                              Radius.circular(30),
                            ),
                          ),
                          constraints: BoxConstraints(
                              minHeight: 10,
                              maxHeight: 50,
                              minWidth: 200,
                              maxWidth: 500)),
                      keyboardType: TextInputType.visiblePassword,
                      enableSuggestions: true,
                    ),
                  ),
                  Expanded(
                    flex: 20,
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: TextButton(
                          style: const ButtonStyle(
                              backgroundColor:
                                  MaterialStatePropertyAll(Colors.blueAccent),
                              elevation: MaterialStatePropertyAll(30),
                              minimumSize: MaterialStatePropertyAll(
                                Size(300, 10),
                              ),
                              maximumSize:
                                  MaterialStatePropertyAll(Size(400, 15)),
                              shape: MaterialStatePropertyAll(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(30))))),
                          onPressed: () async {
                            validarForm();
                          },
                          child: Text(fazerLogin.name)),
                    ),
                  ),
                  const Expanded(
                      flex: 20,
                      child: SizedBox(
                        height: 10,
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
