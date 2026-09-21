# Astrolábica: Quiz do Cosmos

Aplicativo Android em Flutter/Dart com quiz intermediário de astronomia.

## Estrutura

- lib/main.dart — entrada e gerenciamento das telas
- lib/models/quiz_question.dart — modelo das perguntas
- lib/data/quiz_questions.dart — banco mock com 5 perguntas
- lib/screens/home_screen.dart — tela inicial
- lib/screens/quiz_screen.dart — quiz e pontuação
- lib/screens/result_screen.dart — resultado final
- lib/widgets/space_background.dart — fundo espacial

## Rodar

flutter pub get
flutter run

## Gerar APK

flutter build apk --release

APK: build/app/outputs/flutter-apk/app-release.apk

O projeto não usa dependências externas além do Flutter.
