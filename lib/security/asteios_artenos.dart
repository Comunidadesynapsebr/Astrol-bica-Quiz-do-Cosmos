import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

/// Local release integrity gate for AstroQuiz.
///
/// This is intentionally client-only. It detects unexpected build/runtime
/// configuration changes, but cannot provide server-grade trust because the
/// verifier itself ships inside the APK.
abstract final class Artenos {
  static const String appVersion = '8.1.0';
  static const int buildNumber = 9;
  static const String packageId = 'com.astroquiz.game';
  static const String releaseMarker = 'ASTROQUIZ-8.1-RELEASE-9';

  static bool verify() {
    if (!kReleaseMode) return true;
    return appVersion == '8.1.0' &&
        buildNumber == 9 &&
        packageId == 'com.astroquiz.game' &&
        releaseMarker == 'ASTROQUIZ-8.1-RELEASE-9';
  }

  static Future<bool> enforce() async {
    final trusted = verify();
    if (!trusted) {
      await SystemChannels.platform.invokeMethod<void>('SystemNavigator.pop');
    }
    return trusted;
  }
}

/// Fixed-value gate used by gameplay/economy code.
/// Values outside the compiled release contract are rejected locally.
abstract final class Asteios {
  static const int startingCoins = 100;
  static const int maxExtraSeconds = 8;
  static const int maxBonusLives = 2;
  static const int maxDailyReward = 3;
  static const int rewardCoins = 30;

  static bool validCoins(int value) => value >= 0 && value <= 999999;
  static bool validExtraSeconds(int value) =>
      value >= 0 && value <= maxExtraSeconds && value % 2 == 0;
  static bool validBonusLives(int value) =>
      value >= 0 && value <= maxBonusLives;
  static bool validReward(int value) => value == rewardCoins;
  static bool validDailyRewardCount(int value) =>
      value >= 0 && value <= maxDailyReward;
}
