import '../models/quiz_question.dart';

/// Banco de perguntas mock do Astrolábica.
/// respostaCorreta é o índice da alternativa correta, começando em 0.
const List<QuizQuestion> quizQuestions = [
  QuizQuestion(
    id: 1,
    pergunta: 'Qual planeta possui o maior período de rotação sideral do Sistema Solar?',
    opcoes: [
      'Marte',
      'Vênus',
      'Mercúrio',
      'Netuno',
    ],
    respostaCorreta: 1,
  ),
  QuizQuestion(
    id: 2,
    pergunta: 'Qual é a principal causa das estações do ano na Terra?',
    opcoes: [
      'A distância da Terra ao Sol varia muito durante o ano',
      'A inclinação do eixo de rotação da Terra',
      'A velocidade da Terra muda drasticamente em cada estação',
      'A atividade das manchas solares',
    ],
    respostaCorreta: 1,
  ),
  QuizQuestion(
    id: 3,
    pergunta: 'O que descreve melhor o limite de Roche?',
    opcoes: [
      'A distância máxima em que um planeta consegue reter uma atmosfera',
      'A região onde a luz não consegue escapar de um buraco negro',
      'A distância na qual forças de maré podem despedaçar um corpo em órbita',
      'A distância média entre dois planetas em ressonância orbital',
    ],
    respostaCorreta: 2,
  ),
  QuizQuestion(
    id: 4,
    pergunta: 'Na classificação espectral tradicional, quais estrelas são, em geral, as mais quentes?',
    opcoes: [
      'Estrelas do tipo M',
      'Estrelas do tipo G',
      'Estrelas do tipo F',
      'Estrelas do tipo O',
    ],
    respostaCorreta: 3,
  ),
  QuizQuestion(
    id: 5,
    pergunta: 'O que é um pulsar?',
    opcoes: [
      'Um planeta que pulsa por causa de atividade vulcânica',
      'Uma estrela de nêutrons em rotação que pode emitir feixes de radiação regularmente',
      'Um tipo de galáxia com brilho variável',
      'Um cometa que muda de tamanho ao passar perto do Sol',
    ],
    respostaCorreta: 1,
  ),
];
