import 'dart:math';

class UserMock {
  static const String user = 'user';
  static const String password = 'user';
}

class Exercicio {
  final String nome;
  final List<String> nivelDeEmocao;
  final String horario;

  Exercicio({
    required this.nome,
    required this.nivelDeEmocao,
    required this.horario,
  });
}

class Exercicios {
  final String categoria;
  final Exercicio exercicio1;
  final Exercicio exercicio2;
  final Exercicio exercicio3;

  Exercicios({
    required this.categoria,
    required this.exercicio1,
    required this.exercicio2,
    required this.exercicio3,
  });
}

class ListaDeEmocoes {
  static List<String> emocoes = [
    'Agitação',
    'Alegria',
    'Ansiedade',
    'Chato',
    'Descansado',
    'Indeciso',
    'Medo',
    'Receio',
    'Frustração',
    'Motivação',
    'Tristeza',
  ];
}

class NivelDeEmocao {
  static List<String> nivel = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
  ];
}

List<String> horarios = ['Manhã', 'Tarde', 'Noite'];

List<String> gerarNivelDeEmocao() {
  Random random = Random();
  Set<int> numerosSorteados = {};

  while (numerosSorteados.length < 4) {
    numerosSorteados.add(random.nextInt(10) + 1);
  }

  List<int> numerosOrdenados = numerosSorteados.toList()..sort();
  return numerosOrdenados.map((numero) => numero.toString()).toList();
}

List<Exercicios> exerciciosDisponiveis = [
  Exercicios(
    categoria: 'Agitação',
    exercicio1: Exercicio(
      nome: 'Respiração Profunda',
      nivelDeEmocao: gerarNivelDeEmocao(),
      horario: horarios[Random().nextInt(horarios.length)],
    ),
    exercicio2: Exercicio(
      nome: 'Exercício de Relaxamento Muscular',
      nivelDeEmocao: gerarNivelDeEmocao(),
      horario: horarios[Random().nextInt(horarios.length)],
    ),
    exercicio3: Exercicio(
      nome: 'Yoga para Equilíbrio',
      nivelDeEmocao: gerarNivelDeEmocao(),
      horario: horarios[Random().nextInt(horarios.length)],
    ),
  ),
  Exercicios(
    categoria: 'Alegria',
    exercicio1: Exercicio(
      nome: 'Prática de Gratidão',
      nivelDeEmocao: gerarNivelDeEmocao(),
      horario: horarios[Random().nextInt(horarios.length)],
    ),
    exercicio2: Exercicio(
      nome: 'Dança ou Movimento Livre',
      nivelDeEmocao: gerarNivelDeEmocao(),
      horario: horarios[Random().nextInt(horarios.length)],
    ),
    exercicio3: Exercicio(
      nome: 'Exercícios de Respiração para Aumentar a Alegria',
      nivelDeEmocao: gerarNivelDeEmocao(),
      horario: horarios[Random().nextInt(horarios.length)],
    ),
  ),
  Exercicios(
    categoria: 'Ansiedade',
    exercicio1: Exercicio(
      nome: 'Meditação Guiada',
      nivelDeEmocao: gerarNivelDeEmocao(),
      horario: horarios[Random().nextInt(horarios.length)],
    ),
    exercicio2: Exercicio(
      nome: 'Técnicas de Respiração para Redução de Ansiedade',
      nivelDeEmocao: gerarNivelDeEmocao(),
      horario: horarios[Random().nextInt(horarios.length)],
    ),
    exercicio3: Exercicio(
      nome: 'Yoga para Ansiedade',
      nivelDeEmocao: gerarNivelDeEmocao(),
      horario: horarios[Random().nextInt(horarios.length)],
    ),
  ),
  Exercicios(
    categoria: 'Chato',
    exercicio1: Exercicio(
      nome: 'Mindfulness para Aceitação',
      nivelDeEmocao: gerarNivelDeEmocao(),
      horario: horarios[Random().nextInt(horarios.length)],
    ),
    exercicio2: Exercicio(
      nome: 'Prática de Mudança de Perspectiva',
      nivelDeEmocao: gerarNivelDeEmocao(),
      horario: horarios[Random().nextInt(horarios.length)],
    ),
    exercicio3: Exercicio(
      nome: 'Respiração para Transformação do Tédio',
      nivelDeEmocao: gerarNivelDeEmocao(),
      horario: horarios[Random().nextInt(horarios.length)],
    ),
  ),
  Exercicios(
    categoria: 'Descansado',
    exercicio1: Exercicio(
      nome: 'Exercícios de Respiração para Relaxamento Noturno',
      nivelDeEmocao: gerarNivelDeEmocao(),
      horario: horarios[Random().nextInt(horarios.length)],
    ),
    exercicio2: Exercicio(
      nome: 'Meditação para um Sono Reparador',
      nivelDeEmocao: gerarNivelDeEmocao(),
      horario: horarios[Random().nextInt(horarios.length)],
    ),
    exercicio3: Exercicio(
      nome: 'Yoga para Relaxamento Noturno',
      nivelDeEmocao: gerarNivelDeEmocao(),
      horario: horarios[Random().nextInt(horarios.length)],
    ),
  ),
  Exercicios(
    categoria: 'Frustração',
    exercicio1: Exercicio(
      nome: 'Técnicas de Respiração para Redução da Frustração',
      nivelDeEmocao: gerarNivelDeEmocao(),
      horario: horarios[Random().nextInt(horarios.length)],
    ),
    exercicio2: Exercicio(
      nome: 'Mindfulness para Aceitação da Frustração',
      nivelDeEmocao: gerarNivelDeEmocao(),
      horario: horarios[Random().nextInt(horarios.length)],
    ),
    exercicio3: Exercicio(
      nome: 'Exercícios de Relaxamento para Transformar Frustração',
      nivelDeEmocao: gerarNivelDeEmocao(),
      horario: horarios[Random().nextInt(horarios.length)],
    ),
  ),
  Exercicios(
    categoria: 'Indeciso',
    exercicio1: Exercicio(
      nome: 'Exercício de Autoconhecimento',
      nivelDeEmocao: gerarNivelDeEmocao(),
      horario: horarios[Random().nextInt(horarios.length)],
    ),
    exercicio2: Exercicio(
      nome: 'Mindfulness para Tomada de Decisões',
      nivelDeEmocao: gerarNivelDeEmocao(),
      horario: horarios[Random().nextInt(horarios.length)],
    ),
    exercicio3: Exercicio(
      nome: 'Técnicas de Visualização para Clareza de Pensamento',
      nivelDeEmocao: gerarNivelDeEmocao(),
      horario: horarios[Random().nextInt(horarios.length)],
    ),
  ),
  Exercicios(
    categoria: 'Medo',
    exercicio1: Exercicio(
      nome: 'Exercícios de Respiração para Lidar com o Medo',
      nivelDeEmocao: gerarNivelDeEmocao(),
      horario: horarios[Random().nextInt(horarios.length)],
    ),
    exercicio2: Exercicio(
      nome: 'Técnicas de Visualização para Redução do Medo',
      nivelDeEmocao: gerarNivelDeEmocao(),
      horario: horarios[Random().nextInt(horarios.length)],
    ),
    exercicio3: Exercicio(
      nome: 'Mindfulness para Superar o Medo',
      nivelDeEmocao: gerarNivelDeEmocao(),
      horario: horarios[Random().nextInt(horarios.length)],
    ),
  ),
  Exercicios(
    categoria: 'Motivação',
    exercicio1: Exercicio(
      nome: 'Exercícios de Respiração para Aumento de Motivação',
      nivelDeEmocao: gerarNivelDeEmocao(),
      horario: horarios[Random().nextInt(horarios.length)],
    ),
    exercicio2: Exercicio(
      nome: 'Mindfulness para Foco e Determinação',
      nivelDeEmocao: gerarNivelDeEmocao(),
      horario: horarios[Random().nextInt(horarios.length)],
    ),
    exercicio3: Exercicio(
      nome: 'Yoga para Energização',
      nivelDeEmocao: gerarNivelDeEmocao(),
      horario: horarios[Random().nextInt(horarios.length)],
    ),
  ),
  Exercicios(
    categoria: 'Receio',
    exercicio1: Exercicio(
      nome: 'Prática de Resiliência',
      nivelDeEmocao: gerarNivelDeEmocao(),
      horario: horarios[Random().nextInt(horarios.length)],
    ),
    exercicio2: Exercicio(
      nome: 'Exercícios de Relaxamento para Reduzir o Receio',
      nivelDeEmocao: gerarNivelDeEmocao(),
      horario: horarios[Random().nextInt(horarios.length)],
    ),
    exercicio3: Exercicio(
      nome: 'Mindfulness para Equilíbrio Emocional',
      nivelDeEmocao: gerarNivelDeEmocao(),
      horario: horarios[Random().nextInt(horarios.length)],
    ),
  ),
  Exercicios(
    categoria: 'Tristeza',
    exercicio1: Exercicio(
      nome: 'Exercícios de Respiração para Lidar com a Tristeza',
      nivelDeEmocao: gerarNivelDeEmocao(),
      horario: horarios[Random().nextInt(horarios.length)],
    ),
    exercicio2: Exercicio(
      nome: 'Mindfulness para Superar a Tristeza',
      nivelDeEmocao: gerarNivelDeEmocao(),
      horario: horarios[Random().nextInt(horarios.length)],
    ),
    exercicio3: Exercicio(
      nome: 'Yoga para Elevação do Humor',
      nivelDeEmocao: gerarNivelDeEmocao(),
      horario: horarios[Random().nextInt(horarios.length)],
    ),
  ),
];