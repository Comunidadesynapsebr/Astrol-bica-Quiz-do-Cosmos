import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/loading_screen.dart';
import 'screens/result_screen.dart';
import 'screens/settings_screen.dart';
import 'screens/shop_screen.dart';
import 'screens/visual_game_screen.dart';

const Color kSpaceBlack=Color(0xFF000000);
const Color kSpaceNavy=Color(0xFF0B1021);
const Color kGalacticPurple=Color(0xFF8A2BE2);
const Color kNeonCyan=Color(0xFF00FFFF);

void main(){
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const AstrolabicaApp());
}

class AstrolabicaApp extends StatelessWidget{
  const AstrolabicaApp({super.key});
  @override Widget build(BuildContext context)=>MaterialApp(
    debugShowCheckedModeBanner:false,
    title:'Astrolábica: Quiz do Cosmos',
    theme:ThemeData(
      useMaterial3:true,brightness:Brightness.dark,scaffoldBackgroundColor:kSpaceBlack,
      colorScheme:const ColorScheme.dark(primary:kGalacticPurple,secondary:kNeonCyan,surface:kSpaceNavy),
      fontFamily:'Roboto',
    ),
    home:const AstrolabicaRoot(),
  );
}

enum _Page{loading,home,game,shop,settings,result}

class AstrolabicaRoot extends StatefulWidget{
  const AstrolabicaRoot({super.key});
  @override State<AstrolabicaRoot> createState()=>_AstrolabicaRootState();
}

class _AstrolabicaRootState extends State<AstrolabicaRoot>{
  _Page page=_Page.loading;
  int coins=100,extraSeconds=0,bonusLives=0;
  bool vibration=true,showTimer=true,animations=true;
  GameSummary? lastGame;

  void home()=>setState(()=>page=_Page.home);
  void play()=>setState(()=>page=_Page.game);
  void shop()=>setState(()=>page=_Page.shop);
  void settings()=>setState(()=>page=_Page.settings);
  void earn(int value)=>setState(()=>coins+=value);

  void buyTime(){
    final level=extraSeconds~/2;
    final cost=60+(level*35);
    if(level>=4||coins<cost)return;
    setState((){
      coins-=cost;
      extraSeconds+=2;
    });
  }

  void buyLife(){
    final cost=100+(bonusLives*50);
    if(bonusLives>=2||coins<cost)return;
    setState((){
      coins-=cost;
      bonusLives++;
    });
  }

  void finish(GameSummary value)=>setState((){
    lastGame=value;
    page=_Page.result;
  });

  void reset(){
    setState((){
      coins=100;
      extraSeconds=0;
      bonusLives=0;
      page=_Page.home;
    });
  }

  @override Widget build(BuildContext context){
    switch(page){
      case _Page.loading:return LoadingScreen(onReady:home);
      case _Page.home:return HomeScreen(onPlay:play,onShop:shop,onSettings:settings,coins:coins,extraSeconds:extraSeconds,bonusLives:bonusLives);
      case _Page.game:return VisualGameScreen(extraSeconds:extraSeconds,bonusLives:bonusLives,vibrationEnabled:vibration,showTimer:showTimer,animationsEnabled:animations,onCoinsEarned:earn,onFinished:finish);
      case _Page.shop:return ShopScreen(coins:coins,extraSeconds:extraSeconds,bonusLives:bonusLives,onBack:home,onBuyTime:buyTime,onBuyLife:buyLife);
      case _Page.settings:return SettingsScreen(vibrationEnabled:vibration,showTimer:showTimer,animationsEnabled:animations,onVibrationChanged:(v)=>setState(()=>vibration=v),onTimerChanged:(v)=>setState(()=>showTimer=v),onAnimationsChanged:(v)=>setState(()=>animations=v),onReset:reset,onBack:home);
      case _Page.result:
        final r=lastGame!;
        return ResultScreen(score:r.score,total:r.total,coinsEarned:r.coinsEarned,answered:r.answered,onReplay:play,onHome:home);
    }
  }
}
