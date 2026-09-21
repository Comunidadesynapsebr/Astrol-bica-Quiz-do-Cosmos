class QuizQuestion {
  final int id;
  final String pergunta;
  final List<String> opcoes;
  final int respostaCorreta;

  const QuizQuestion({
    required this.id,
    required this.pergunta,
    required this.opcoes,
    required this.respostaCorreta,
  });

  bool isCorrect(int selectedIndex) => selectedIndex == respostaCorreta;
}
