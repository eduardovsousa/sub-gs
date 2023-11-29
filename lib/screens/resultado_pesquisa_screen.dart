// ignore_for_file: library_private_types_in_public_api

import 'package:mental_health/screens/agradecimento_screen.dart';
import 'package:flutter/material.dart';
import '../models/mock.dart';

class ResultadoPesquisaScreen extends StatefulWidget {
  final String categoria;
  final List<Exercicios> exerciciosCompativeis;
  final String nivel;
  final String horario;

  const ResultadoPesquisaScreen({
    Key? key,
    required this.categoria,
    required this.exerciciosCompativeis,
    required this.nivel,
    required this.horario,
  }) : super(key: key);

  @override
  _ResultadoPesquisaScreenState createState() =>
      _ResultadoPesquisaScreenState();
}

class _ResultadoPesquisaScreenState extends State<ResultadoPesquisaScreen> {
  Set<int> selectedExercicio1 = {};
  Set<int> selectedExercicio2 = {};
  Set<int> selectedExercicio3 = {};
  bool showDialogBox = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercícios compatíveis:'),
      ),
      body: Column(
        children: [
          if (widget.exerciciosCompativeis.isEmpty)
            const Center(
              child: Text(
                'Não encontramos nenhum exercício \npara você no momento.\nTente novamente mais tarde.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24),
              ),
            )
          else
            Expanded(
              child: ListView.builder(
                itemCount: widget.exerciciosCompativeis.length,
                itemBuilder: (context, index) {
                  final exercicio = widget.exerciciosCompativeis[index];
                  return Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListTile(
                          title: Text(
                              'Resumo:\nEmoção: ${exercicio.categoria} - Horário do sentimento: ${widget.horario}\nNível de Emoção selecionado: ${widget.nivel}'),
                        ),
                        const SizedBox(height: 10),
                        ListTile(
                          leading: const Icon(Icons.directions_run),
                          title: Text(
                              '  Exercício 1: ${exercicio.exercicio1.nome}\n  Nível de emoção: ${exercicio.exercicio1.nivelDeEmocao}\n  Melhor horário para prática: ${exercicio.exercicio1.horario}'),
                          trailing: Checkbox(
                            value: selectedExercicio1.contains(index),
                            onChanged: (value) {
                              setState(() {
                                if (value == true) {
                                  selectedExercicio1.add(index);
                                } else {
                                  selectedExercicio1.remove(index);
                                }
                              });
                            },
                            activeColor: const Color.fromRGBO(255, 50, 99, 1),
                          ),
                        ),
                        ListTile(
                          leading: const Icon(Icons.directions_run),
                          title: Text(
                              '  Exercício 2: ${exercicio.exercicio2.nome}\n  Nível de emoção: ${exercicio.exercicio2.nivelDeEmocao}\n  Melhor horário para prática: ${exercicio.exercicio2.horario}'),
                          trailing: Checkbox(
                            value: selectedExercicio2.contains(index),
                            onChanged: (value) {
                              setState(() {
                                if (value == true) {
                                  selectedExercicio2.add(index);
                                } else {
                                  selectedExercicio2.remove(index);
                                }
                              });
                            },
                            activeColor: const Color.fromRGBO(255, 50, 99, 1),
                          ),
                        ),
                        ListTile(
                          leading: const Icon(Icons.directions_run),
                          title: Text(
                              '  Exercício 3: ${exercicio.exercicio3.nome}\n  Nível de emoção: ${exercicio.exercicio3.nivelDeEmocao}\n  Melhor horário para prática: ${exercicio.exercicio3.horario}'),
                          trailing: Checkbox(
                            value: selectedExercicio3.contains(index),
                            onChanged: (value) {
                              setState(() {
                                if (value == true) {
                                  selectedExercicio3.add(index);
                                } else {
                                  selectedExercicio3.remove(index);
                                }
                              });
                            },
                            activeColor: const Color.fromRGBO(255, 50, 99, 1),
                          ),
                        ),
                        const Divider(),
                      ],
                    ),
                  );
                },
              ),
            ),
          if ((selectedExercicio1.isNotEmpty ||
              selectedExercicio2.isNotEmpty ||
              selectedExercicio3.isNotEmpty))
            _buildConfirmationDialog(),
        ],
      ),
    );
  }

  Widget _buildConfirmationDialog() {
    return AlertDialog(
      content: const Text(
          'Ao clicar em "Sim", você está de acordo com a responsabilidade da execução do(s) exercício(s). Tenha cautela!'),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            setState(() {
              showDialogBox = false;
            });
          },
          child: const Text('Não'),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
            _agradecimentoPage();
          },
          child: const Text('Sim'),
        ),
      ],
    );
  }

  void _agradecimentoPage() {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => const AgradecimentoScreen()));
  }
}
