import 'dart:math';

enum CosmicType { galaxia, buracoNegro, planeta, quasar }

extension CosmicTypeLabel on CosmicType {
  String get label {
    switch (this) {
      case CosmicType.galaxia:
        return 'Galáxia';
      case CosmicType.buracoNegro:
        return 'Buraco negro';
      case CosmicType.planeta:
        return 'Planeta';
      case CosmicType.quasar:
        return 'Quasar';
    }
  }
}

class CosmicChallenge {
  final String imageUrl;
  final CosmicType answer;

  const CosmicChallenge({
    required this.imageUrl,
    required this.answer,
  });
}

const imageBase =
    'https://raw.githubusercontent.com/Comunidadesynapsebr/Astrol-bica-Quiz-do-Cosmos/main/';

const List<CosmicChallenge> challenges = [
  CosmicChallenge(
    imageUrl: '${imageBase}1789997881286.png',
    answer: CosmicType.galaxia,
  ),
  CosmicChallenge(
    imageUrl: '${imageBase}1789997941367.png',
    answer: CosmicType.buracoNegro,
  ),
  CosmicChallenge(
    imageUrl: '${imageBase}1789997996142.png',
    answer: CosmicType.planeta,
  ),
  CosmicChallenge(
    imageUrl: '${imageBase}1789998060730.png',
    answer: CosmicType.quasar,
  ),
  CosmicChallenge(
    imageUrl: '${imageBase}1789998133047.png',
    answer: CosmicType.galaxia,
  ),
  CosmicChallenge(
    imageUrl: '${imageBase}1789998161409.png',
    answer: CosmicType.planeta,
  ),
];

List<CosmicChallenge> shuffledChallenges() {
  final list = List<CosmicChallenge>.from(challenges);
  list.shuffle(Random());
  return list;
}

class GameSummary {
  final int score;
  final int total;
  final int coinsEarned;
  final int answered;

  const GameSummary({
    required this.score,
    required this.total,
    required this.coinsEarned,
    required this.answered,
  });
}
