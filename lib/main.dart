import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'theme/backgroundImagePage.dart';
import 'theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackgroundImagePage(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Mental Health - Cuide da sua saúde mental',
        theme: ThemeData(
            scaffoldBackgroundColor: Colors.transparent, appBarTheme: theme),
        home: const BackgroundImagePage(
          child: HomeScreen(),
        ),
        routes: {
          '/home': (context) => const LoginScreen(),
        },
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mental Health'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 150),
            const Text(
              'Bem-vindo ao Mental Health! \nCuide da sua saúde mental',
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                );
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                    const Color.fromRGBO(255, 50, 99, 1)),
              ),
              child: const Text(
                'Ir para o Login',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
