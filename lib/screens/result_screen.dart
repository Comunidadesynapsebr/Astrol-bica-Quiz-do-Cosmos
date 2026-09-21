import 'package:flutter/material.dart';
import '../widgets/space_background.dart';

class ResultScreen extends StatelessWidget {
  final int score;
  final int total;
  final int coinsEarned;
  final int answered;
  final VoidCallback onReplay;
  final VoidCallback onHome;

  const ResultScreen({
    super.key,
    required this.score,
    required this.total,
    required this.coinsEarned,
    required this.answered,
    required this.onReplay,
    required this.onHome,
  });

  @override
  Widget build(BuildContext context) {
    final percent = ((score / total) * 100).round();
    final title = score == total
        ? 'Mestre da Galáxia'
        : score >= 4
            ? 'Navegador Cósmico'
            : score >= 3
                ? 'Explorador Espacial'
                : 'Astronauta Perdido';

    return Scaffold(
      body: SpaceBackground(
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  const Icon(
                    Icons.emoji_events_rounded,
                    size: 82,
                    color: Color(0xFF00FFFF),
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    'MISSÃO ENCERRADA',
                    style: TextStyle(
                      color: Color(0xFF00FFFF),
                      fontSize: 11,
                      letterSpacing: 2.5,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(height: 9),
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 31,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(height: 18),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: const Color(0xFF0B1021),
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(
                        color: const Color(0xFF8A2BE2),
                      ),
                    ),
                    child: Column(
                      children: [
                        Text(
                          '${score}/${total}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 52,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        Text(
                          '${percent}% de acerto',
                          style: const TextStyle(
                            color: Color(0xFFB8C7FF),
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 20),
                        _ResultRow(
                          icon: Icons.stars_rounded,
                          label: 'Estrelas ganhas',
                          value: '+${coinsEarned}',
                        ),
                        const SizedBox(height: 10),
                        _ResultRow(
                          icon: Icons.radar_rounded,
                          label: 'Sinais processados',
                          value: '${answered}/${total}',
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 22),
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton.icon(
                      onPressed: onReplay,
                      icon: const Icon(Icons.replay_rounded),
                      label: const Text('Jogar novamente'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF8A2BE2),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        textStyle: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ),
                  TextButton.icon(
                    onPressed: onHome,
                    icon: const Icon(Icons.home_rounded),
                    label: const Text('Voltar ao menu'),
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

class _ResultRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _ResultRow({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 2),
        Icon(
          icon,
          color: const Color(0xFF00FFFF),
          size: 20,
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            label,
            style: const TextStyle(
              color: Colors.white54,
              fontSize: 13,
            ),
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w800,
          ),
        ),
      ],
    );
  }
}
