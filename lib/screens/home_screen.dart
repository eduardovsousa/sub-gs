// ignore_for_file: unused_field, library_private_types_in_public_api

import 'package:flutter/material.dart';
import '../models/mock.dart';
import 'busca_exercicios_screen.dart';
import 'resultado_pesquisa_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Exercicios> _exercicioFiltradas = [];
  final TextEditingController categoriaController = TextEditingController();
  final TextEditingController nivelEmocoesController = TextEditingController();
  final TextEditingController horarioController = TextEditingController();

  final String _horarioSelecionado = 'Quando isso aconteceu?';
  final List<String> _horarios = ['Manhã', 'Tarde', 'Noite'];

  List<String> _listaDeEmocoes = [];
  List<String> _nivelDeEmocao = [];

  bool _mostrarEmocoes = false;
  bool _mostrarNivelEmocoes = false;
  bool _mostrarHorarios = false;

  @override
  void initState() {
    super.initState();
    categoriaController.addListener(_filtrarExercicios);
    nivelEmocoesController.addListener(_filtrarExercicios);
    _listaDeEmocoes = ListaDeEmocoes.emocoes;
    _nivelDeEmocao = NivelDeEmocao.nivel;
  }

  void _filtrarExercicios() {
    final categoriaQuery = categoriaController.value;
    final nivelEmocoesQuery = nivelEmocoesController.value;

    _listaDeEmocoes = ListaDeEmocoes.emocoes
        .where((endereco) =>
            endereco.toLowerCase().contains(categoriaQuery as Pattern))
        .toList();

    _nivelDeEmocao = NivelDeEmocao.nivel
        .where((endereco) =>
            endereco.toLowerCase().contains(nivelEmocoesQuery as Pattern))
        .toList();
  }

  void _selecionarCategoriaEmocao(String endereco) {
    categoriaController.text = endereco;
    setState(() {
      _mostrarEmocoes = false;
    });
  }

  void _selecionarNivelEmocao(String endereco) {
    nivelEmocoesController.text = endereco;
    setState(() {
      _mostrarNivelEmocoes = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mental Health'),
      ),
      drawer: Drawer(
        shadowColor: Colors.white,
        backgroundColor: const Color.fromRGBO(255, 50, 99, 0.8),
        child: ListView(
          children: [
            ListTile(
              title: const Text("Cuidando de você"),
              textColor: Colors.white,
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (contex) => const BuscaExercicioScreen()));
              },
            )
          ],
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              const Text(
                'Como você está hoje?\nLembre-se de registrar suas emoções!',
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              TextField(
                controller: categoriaController,
                decoration: InputDecoration(
                  labelText: 'Como você está se sentindo?',
                  prefixIcon: Icon(
                    Icons.add_reaction_rounded,
                    color: _mostrarEmocoes
                        ? const Color.fromRGBO(255, 50, 99, 1)
                        : Colors.grey,
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromRGBO(255, 50, 99, 1),
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: _mostrarEmocoes
                          ? const Color.fromRGBO(255, 50, 99, 1)
                          : Colors.grey,
                    ),
                  ),
                  labelStyle: TextStyle(
                    color: _mostrarEmocoes
                        ? const Color.fromRGBO(255, 50, 99, 1)
                        : Colors.grey,
                  ),
                ),
                onTap: () {
                  setState(() {
                    _mostrarEmocoes = true;
                  });
                },
                onChanged: (value) {
                  setState(() {
                    _mostrarEmocoes = value.isNotEmpty;
                  });
                },
              ),
              Visibility(
                visible: _mostrarEmocoes,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Text(
                      'Escolha uma categoria',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(
                      height: 100,
                      child: ListView.builder(
                        itemCount: _listaDeEmocoes.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ListTile(
                            title: Text(_listaDeEmocoes[index]),
                            onTap: () {
                              _selecionarCategoriaEmocao(
                                  _listaDeEmocoes[index]);
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: nivelEmocoesController,
                decoration: InputDecoration(
                  labelText: 'Qual a intensidade do sentimento?',
                  prefixIcon: Icon(
                    Icons.query_stats_outlined,
                    color: _mostrarNivelEmocoes
                        ? const Color.fromRGBO(255, 50, 99, 1)
                        : Colors.grey,
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromRGBO(255, 50, 99, 1),
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: _mostrarNivelEmocoes
                          ? const Color.fromRGBO(255, 50, 99, 1)
                          : Colors.grey,
                    ),
                  ),
                  labelStyle: TextStyle(
                    color: _mostrarNivelEmocoes
                        ? const Color.fromRGBO(255, 50, 99, 1)
                        : Colors.grey,
                  ),
                ),
                onTap: () {
                  setState(() {
                    _mostrarNivelEmocoes = true;
                  });
                },
                onChanged: (value) {
                  setState(() {
                    _mostrarNivelEmocoes = value.isNotEmpty;
                  });
                },
              ),
              Visibility(
                visible: _mostrarNivelEmocoes,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Text(
                      'Escolha um valor de 1 a 10:',
                      style: TextStyle(fontSize: 16),
                    ),
                    Wrap(
                      spacing: 8.0,
                      children: List.generate(10, (index) {
                        final valor = index + 1;
                        return ElevatedButton(
                          onPressed: () {
                            _selecionarNivelEmocao(valor.toString());
                          },
                          child: Text('$valor'),
                        );
                      }),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller:
                    horarioController,
                decoration: InputDecoration(
                  labelText: 'Quando isso aconteceu?',
                  prefixIcon: Icon(
                    Icons.access_time,
                    color: _mostrarHorarios
                        ? const Color.fromRGBO(255, 50, 99, 1)
                        : Colors.grey,
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromRGBO(255, 50, 99, 1),
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: _mostrarHorarios
                          ? const Color.fromRGBO(255, 50, 99, 1)
                          : Colors.grey,
                    ),
                  ),
                  labelStyle: TextStyle(
                    color: _mostrarHorarios
                        ? const Color.fromRGBO(255, 50, 99, 1)
                        : Colors.grey,
                  ),
                ),
                onTap: () {
                  setState(() {
                    _mostrarHorarios = true;
                  });
                },
              ),
              Visibility(
                visible: _mostrarHorarios,
                child: Wrap(
                  spacing: 8.0,
                  children: _horarios.map((horario) {
                    return ElevatedButton(
                      onPressed: () {
                        setState(() {
                          horarioController.text =
                              horario; 
                          _mostrarHorarios = false;
                        });
                      },
                      child: Text(horario),
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const BuscaExercicioScreen(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(255, 50, 99, 1),
                    ),
                    child: const Text(
                      'Consultar exercícios disponíveis',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      final categoria = categoriaController.text;
                      final nivel = nivelEmocoesController.text;
                      final horario = horarioController.text;

                      if (categoria.isEmpty || nivel.isEmpty || horario.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                                'Preencha todos os campos para maior precisão!'),
                            backgroundColor: Colors.red,
                          ),
                        );
                      } else {
                        List<Exercicios> exerciciosFiltrados = [];
                        if (categoria == 'Agitação') {
                          exerciciosFiltrados = exerciciosDisponiveis
                              .where((exercicio) =>
                                  exercicio.categoria == 'Agitação')
                              .toList();
                        } else if (categoria == 'Alegria') {
                          exerciciosFiltrados = exerciciosDisponiveis
                              .where((exercicio) =>
                                  exercicio.categoria == 'Alegria')
                              .toList();
                        } else if (categoria == 'Ansiedade') {
                          exerciciosFiltrados = exerciciosDisponiveis
                              .where((exercicio) =>
                                  exercicio.categoria == 'Ansiedade')
                              .toList();
                        } else if (categoria == 'Chato') {
                          exerciciosFiltrados = exerciciosDisponiveis
                              .where(
                                  (exercicio) => exercicio.categoria == 'Chato')
                              .toList();
                        } else if (categoria == 'Descansado') {
                          exerciciosFiltrados = exerciciosDisponiveis
                              .where((exercicio) =>
                                  exercicio.categoria == 'Descansado')
                              .toList();
                        } else if (categoria == 'Indeciso') {
                          exerciciosFiltrados = exerciciosDisponiveis
                              .where((exercicio) =>
                                  exercicio.categoria == 'Indeciso')
                              .toList();
                        } else if (categoria == 'Medo') {
                          exerciciosFiltrados = exerciciosDisponiveis
                              .where(
                                  (exercicio) => exercicio.categoria == 'Medo')
                              .toList();
                        } else {
                          exerciciosFiltrados = exerciciosDisponiveis
                              .where((exercicio) =>
                                  exercicio.categoria == 'Receio')
                              .toList();
                        }

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ResultadoPesquisaScreen(
                              categoria: categoriaController.text,
                              exerciciosCompativeis: exerciciosFiltrados,
                              nivel: nivelEmocoesController.text,
                              horario: horarioController.text,
                            ),
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(255, 50, 99, 1),
                    ),
                    child: const Text(
                      'Pesquisar',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
