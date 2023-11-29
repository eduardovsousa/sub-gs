// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import '../models/mock.dart';
import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController userController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final FocusNode userFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();
  bool userHasFocus = false;
  bool passwordHasFocus = false;

  @override
  void initState() {
    super.initState();

    userFocusNode.addListener(() {
      setState(() {
        userHasFocus = userFocusNode.hasFocus;
      });
    });

    passwordFocusNode.addListener(() {
      setState(() {
        passwordHasFocus = passwordFocusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    userController.dispose();
    passwordController.dispose();
    userFocusNode.dispose();
    passwordFocusNode.dispose();
    super.dispose();
  }

  void _handleLogin(BuildContext context) {
    final user = userController.text.trim();
    final password = passwordController.text.trim();

    if (user == UserMock.user && password == UserMock.password) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Usuário ou senha incorretos. Tente novamente.'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 80),
              const Text(
                'Faça login na sua conta',
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: userController,
                focusNode: userFocusNode,
                decoration: InputDecoration(
                  labelText: 'User',
                  icon: Icon(
                    Icons.person_rounded,
                    color: userHasFocus
                        ? const Color.fromRGBO(255, 50, 99, 1)
                        : Colors.grey,
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: userHasFocus
                          ? const Color.fromRGBO(255, 50, 99, 1)
                          : Colors.grey,
                    ),
                  ),
                  labelStyle: TextStyle(
                    color: userHasFocus
                        ? const Color.fromRGBO(255, 50, 99, 1)
                        : Colors.grey,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: passwordController,
                focusNode: passwordFocusNode,
                decoration: InputDecoration(
                  labelText: 'Senha',
                  icon: Icon(
                    Icons.lock,
                    color: passwordHasFocus
                        ? const Color.fromRGBO(255, 50, 99, 1)
                        : Colors.grey,
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: passwordHasFocus
                          ? const Color.fromRGBO(255, 50, 99, 1)
                          : Colors.grey,
                    ),
                  ),
                  labelStyle: TextStyle(
                    color: passwordHasFocus
                        ? const Color.fromRGBO(255, 50, 99, 1)
                        : Colors.grey,
                  ),
                ),
                obscureText: true,
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: 150,
                child: ElevatedButton(
                  onPressed: () {
                    _handleLogin(context);
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        const Color.fromRGBO(255, 50, 99, 1)),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Entrar',
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(width: 4),
                      Icon(Icons.login, color: Colors.white),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
