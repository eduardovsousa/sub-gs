import 'package:flutter/material.dart';
import '../models/mock.dart';

class BuscaExercicioScreen extends StatelessWidget {
  const BuscaExercicioScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Exercícios'),
      ),
      body: ListView.builder(
        itemCount: exerciciosDisponiveis.length,
        itemBuilder: (context, index) {
          final exercicio = exerciciosDisponiveis[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: ListTile(
                leading: const Icon(Icons.health_and_safety_sharp),
                title: Text('Categoria: ${exercicio.categoria}'),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Exercício 1: ${exercicio.exercicio1.nome}'),
                    Text('Exercício 2: ${exercicio.exercicio2.nome}'),
                    Text('Exercício 3: ${exercicio.exercicio3.nome}'),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
