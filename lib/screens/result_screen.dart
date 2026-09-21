import 'package:flutter/material.dart';
import '../widgets/space_background.dart';

class ResultScreen extends StatelessWidget {
  final int score;
  final int total;
  final VoidCallback onReturnHome;

  const ResultScreen({
    super.key,
    required this.score,
    required this.total,
    required this.onReturnHome,
  });

  String get message {
    final percentage = score / total;
    if (percentage == 1) return 'Mestre da Galáxia';
    if (percentage >= .8) return 'Comandante Interestelar';
    if (percentage >= .6) return 'Explorador Orbital';
    if (percentage >= .4) return 'Cadete Cósmico';
    return 'Astronauta Perdido';
  }

  String get detail {
    final percentage = score / total;
    if (percentage == 1) return 'Precisão máxima. O universo não tem muitos segredos para você.';
    if (percentage >= .8) return 'Excelente missão. Sua nave está pronta para a próxima exploração.';
    if (percentage >= .6) return 'Boa viagem pelo cosmos. Mais algumas missões e você chegará longe.';
    if (percentage >= .4) return 'A missão revelou pontos para estudar. Recarregue os sistemas e tente novamente.';
    return 'Os sensores ainda estão se ajustando. Volte à base e faça uma nova missão.';
  }

  @override
  Widget build(BuildContext context) {
    final percentage = ((score / total) * 100).round();

    return Scaffold(
      body: SpaceBackground(
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.emoji_events, size: 92, color: Color(0xFF00FFFF)),
                  const SizedBox(height: 24),
                  const Text(
                    'MISSÃO CONCLUÍDA',
                    style: TextStyle(
                      color: Color(0xFF00FFFF),
                      fontSize: 12,
                      letterSpacing: 3,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 10),
                  ShaderMask(
                    shaderCallback: (bounds) => const LinearGradient(
                      colors: [Color(0xFF00FFFF), Color(0xFF8A2BE2)],
                    ).createShader(bounds),
                    child: Text(
                      message,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    width: double.infinity,
                    constraints: const BoxConstraints(maxWidth: 520),
                    padding: const EdgeInsets.all(28),
                    decoration: BoxDecoration(
                      color: const Color(0xFF0B1021),
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(color: const Color(0xFF8A2BE2)),
                    ),
                    child: Column(
                      children: [
                        Text(
                          '$score/$total',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 54,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          '$percentage% de acerto',
                          style: const TextStyle(
                            color: Color(0xFFB8C7FF),
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          detail,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 15,
                            height: 1.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 28),
                  SizedBox(
                    width: double.infinity,
                    height: 58,
                    child: ElevatedButton.icon(
                      onPressed: onReturnHome,
                      icon: const Icon(Icons.home_rounded),
                      label: const Text('Retornar à Base'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF8A2BE2),
                        foregroundColor: Colors.white,
                        elevation: 10,
                        shadowColor: const Color(0xFF8A2BE2),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        textStyle: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
