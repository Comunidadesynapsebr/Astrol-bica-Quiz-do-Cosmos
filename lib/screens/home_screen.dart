import 'package:flutter/material.dart';
import '../widgets/space_background.dart';

class HomeScreen extends StatefulWidget {
  final VoidCallback onStart;
  const HomeScreen({super.key, required this.onStart});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _pulseController;
  late final Animation<double> _pulse;

  @override
  void initState() {
    super.initState();
    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1300),
    )..repeat(reverse: true);
    _pulse = Tween<double>(begin: .96, end: 1.04).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _pulseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: SpaceBackground(
          child: SafeArea(
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(28),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.public, size: 86, color: Color(0xFF00FFFF)),
                    const SizedBox(height: 28),
                    ShaderMask(
                      shaderCallback: (bounds) => const LinearGradient(
                        colors: [Color(0xFF00FFFF), Color(0xFF8A2BE2)],
                      ).createShader(bounds),
                      child: const Text(
                        'Astrolábica',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 48,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 1.5,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Quiz do Cosmos',
                      style: TextStyle(
                        color: Color(0xFFB8C7FF),
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 3,
                      ),
                    ),
                    const SizedBox(height: 34),
                    Container(
                      constraints: const BoxConstraints(maxWidth: 520),
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: const Color(0xFF0B1021).withValues(alpha: .88),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: const Color(0xFF8A2BE2).withValues(alpha: .45),
                        ),
                      ),
                      child: const Text(
                        'Cinco perguntas para testar seus conhecimentos sobre estrelas, planetas e fenômenos do universo.',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white70, fontSize: 16, height: 1.5),
                      ),
                    ),
                    const SizedBox(height: 38),
                    ScaleTransition(
                      scale: _pulse,
                      child: SizedBox(
                        width: double.infinity,
                        height: 62,
                        child: ElevatedButton.icon(
                          onPressed: widget.onStart,
                          icon: const Icon(Icons.rocket_launch),
                          label: const Text('Iniciar Missão'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF8A2BE2),
                            foregroundColor: Colors.white,
                            elevation: 12,
                            shadowColor: const Color(0xFF8A2BE2),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18),
                            ),
                            textStyle: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'NÍVEL INTERMEDIÁRIO  •  5 QUESTÕES',
                      style: TextStyle(
                        color: Colors.white38,
                        fontSize: 11,
                        letterSpacing: 1.8,
                        fontWeight: FontWeight.w600,
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
