import 'package:flutter/material.dart';

class AgradecimentoScreen extends StatelessWidget {
  const AgradecimentoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agradecimento'),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 150),
            const Text(
              'Obrigado por utilizar o nosso app!',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            const Text(
              'Esperamos que você tenha aproveitado este momento.',
              style: TextStyle(fontSize: 18),
            ),
            const Text(
              'Em breve, enviaremos um e-mail com todas as instruções do exercício!',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromRGBO(255, 50, 99, 1),
              ),
              child: const Text(
                'Voltar a Home',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
