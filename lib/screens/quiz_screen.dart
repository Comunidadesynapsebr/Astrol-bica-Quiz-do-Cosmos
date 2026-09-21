import 'dart:async';
import 'package:flutter/material.dart';
import '../data/quiz_questions.dart';
import '../models/quiz_question.dart';
import '../widgets/space_background.dart';

class QuizScreen extends StatefulWidget {
  final ValueChanged<int> onFinished;
  const QuizScreen({super.key, required this.onFinished});
  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _currentQuestion = 0;
  int _score = 0;
  int? _selectedAnswer;
  bool _locked = false;
  Timer? _nextQuestionTimer;
  QuizQuestion get _question => quizQuestions[_currentQuestion];

  void _answer(int index) {
    if (_locked) return;
    final correct = _question.isCorrect(index);
    setState(() {
      _selectedAnswer = index;
      _locked = true;
      if (correct) _score++;
    });
    _nextQuestionTimer = Timer(const Duration(milliseconds: 1500), () {
      if (!mounted) return;
      if (_currentQuestion == quizQuestions.length - 1) {
        widget.onFinished(_score);
        return;
      }
      setState(() {
        _currentQuestion++;
        _selectedAnswer = null;
        _locked = false;
      });
    });
  }

  Color _optionColor(int index) {
    if (!_locked) return const Color(0xFF0B1021);
    if (index == _question.respostaCorreta) return const Color(0xFF168A4A);
    if (index == _selectedAnswer) return const Color(0xFFB32635);
    return const Color(0xFF0B1021);
  }

  Color _optionBorderColor(int index) {
    if (!_locked) return const Color(0xFF8A2BE2);
    if (index == _question.respostaCorreta) return Colors.greenAccent;
    if (index == _selectedAnswer) return Colors.redAccent;
    return Colors.white12;
  }

  @override
  void dispose() { _nextQuestionTimer?.cancel(); super.dispose(); }

  @override
  Widget build(BuildContext context) {
    final progress = (_currentQuestion + 1) / quizQuestions.length;
    return Scaffold(
      body: SpaceBackground(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 18, 20, 20),
            child: Column(
              children: [
                Row(children: [
                  const Icon(Icons.auto_awesome, color: Color(0xFF00FFFF)),
                  const SizedBox(width: 10),
                  const Expanded(child: Text('ASTROLÁBICA', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800, letterSpacing: 2))),
                  Text('Pergunta \${_currentQuestion + 1} de \${quizQuestions.length}', style: const TextStyle(color: Color(0xFFB8C7FF), fontWeight: FontWeight.w600)),
                ]),
                const SizedBox(height: 14),
                ClipRRect(
                  borderRadius: BorderRadius.circular(99),
                  child: LinearProgressIndicator(minHeight: 8, value: progress, backgroundColor: Colors.white12, valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF00FFFF))),
                ),
                const SizedBox(height: 28),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(children: [
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(22),
                        decoration: BoxDecoration(color: const Color(0xFF0B1021), borderRadius: BorderRadius.circular(22), border: Border.all(color: const Color(0xFF00FFFF))),
                        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                          const Text('TRANSMISSÃO RECEBIDA', style: TextStyle(color: Color(0xFF00FFFF), fontSize: 11, letterSpacing: 1.8, fontWeight: FontWeight.w700)),
                          const SizedBox(height: 14),
                          Text(_question.pergunta, style: const TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.w700, height: 1.25)),
                        ]),
                      ),
                      const SizedBox(height: 22),
                      ...List.generate(_question.opcoes.length, (index) => Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: _OptionButton(
                          index: index,
                          text: _question.opcoes[index],
                          enabled: !_locked,
                          backgroundColor: _optionColor(index),
                          borderColor: _optionBorderColor(index),
                          isSelected: index == _selectedAnswer,
                          isCorrect: index == _question.respostaCorreta,
                          onTap: () => _answer(index),
                        ),
                      )),
                      if (_locked) ...[
                        const SizedBox(height: 6),
                        Text(
                          _question.isCorrect(_selectedAnswer!) ? '✓ Resposta correta!' : '✕ Resposta incorreta',
                          style: TextStyle(color: _question.isCorrect(_selectedAnswer!) ? Colors.greenAccent : Colors.redAccent, fontSize: 15, fontWeight: FontWeight.w800),
                        ),
                        const SizedBox(height: 6),
                        const Text('Próxima pergunta em instantes...', style: TextStyle(color: Colors.white38, fontSize: 12)),
                      ],
                    ]),
                  ),
                ),
                const SizedBox(height: 8),
                Text('Pontuação: \${_score}', style: const TextStyle(color: Colors.white54, fontSize: 13, fontWeight: FontWeight.w600)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _OptionButton extends StatelessWidget {
  final int index;
  final String text;
  final bool enabled;
  final bool isSelected;
  final bool isCorrect;
  final Color backgroundColor;
  final Color borderColor;
  final VoidCallback onTap;

  const _OptionButton({
    required this.index, required this.text, required this.enabled,
    required this.isSelected, required this.isCorrect,
    required this.backgroundColor, required this.borderColor, required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final letter = String.fromCharCode(65 + index);
    return AnimatedContainer(
      duration: const Duration(milliseconds: 180),
      width: double.infinity,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: borderColor, width: 1.2),
        boxShadow: isSelected ? [BoxShadow(color: borderColor.withValues(alpha: .20), blurRadius: 16)] : null,
      ),
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          onTap: enabled ? onTap : null,
          borderRadius: BorderRadius.circular(16),
          splashColor: const Color(0xFF00FFFF),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Row(children: [
              Container(
                width: 38, height: 38, alignment: Alignment.center,
                decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.black26, border: Border.all(color: Colors.white24)),
                child: Text(letter, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w800)),
              ),
              const SizedBox(width: 14),
              Expanded(child: Text(text, style: const TextStyle(color: Colors.white, fontSize: 15.5, fontWeight: FontWeight.w600, height: 1.3))),
              if (isSelected) Icon(isCorrect ? Icons.check_circle : Icons.cancel, color: Colors.white),
            ]),
          ),
        ),
      ),
    );
  }
}
