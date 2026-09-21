import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/quiz_screen.dart';
import 'screens/result_screen.dart';

const Color kSpaceBlack = Color(0xFF000000);
const Color kSpaceNavy = Color(0xFF0B1021);
const Color kGalacticPurple = Color(0xFF8A2BE2);
const Color kNeonCyan = Color(0xFF00FFFF);

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const AstrolabicaApp());
}

class AstrolabicaApp extends StatelessWidget {
  const AstrolabicaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Astrolábica: Quiz do Cosmos',
      theme: ThemeData(
        brightness: Brightness.dark,
        useMaterial3: true,
        scaffoldBackgroundColor: kSpaceBlack,
        colorScheme: const ColorScheme.dark(
          primary: kGalacticPurple,
          secondary: kNeonCyan,
          surface: kSpaceNavy,
        ),
        fontFamily: 'Roboto',
      ),
      home: const AstrolabicaRoot(),
    );
  }
}

class AstrolabicaRoot extends StatefulWidget {
  const AstrolabicaRoot({super.key});

  @override
  State<AstrolabicaRoot> createState() => _AstrolabicaRootState();
}

class _AstrolabicaRootState extends State<AstrolabicaRoot> {
  _AppPage _page = _AppPage.home;
  int _finalScore = 0;

  void _startMission() {
    setState(() {
      _page = _AppPage.quiz;
      _finalScore = 0;
    });
  }

  void _finishMission(int score) {
    setState(() {
      _finalScore = score;
      _page = _AppPage.result;
    });
  }

  void _returnToBase() {
    setState(() {
      _page = _AppPage.home;
      _finalScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    switch (_page) {
      case _AppPage.home:
        return HomeScreen(onStart: _startMission);
      case _AppPage.quiz:
        return QuizScreen(onFinished: _finishMission);
      case _AppPage.result:
        return ResultScreen(
          score: _finalScore,
          total: 5,
          onReturnHome: _returnToBase,
        );
    }
  }
}

enum _AppPage { home, quiz, result }
