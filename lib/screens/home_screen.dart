import 'package:flutter/material.dart';
import '../widgets/space_background.dart';

class HomeScreen extends StatelessWidget{
  final VoidCallback onPlay,onShop,onSettings;
  final int coins,extraSeconds,bonusLives;
  const HomeScreen({super.key,required this.onPlay,required this.onShop,required this.onSettings,required this.coins,required this.extraSeconds,required this.bonusLives});

  @override Widget build(BuildContext context)=>Scaffold(
    body:SpaceBackground(
      child:SafeArea(
        child:SingleChildScrollView(
          padding:const EdgeInsets.fromLTRB(22,28,22,24),
          child:Column(children:[
            Row(children:[
              const Icon(Icons.auto_awesome,color:Color(0xFF00FFFF)),
              const SizedBox(width:9),
              const Expanded(child:Text('CENTRAL DE MISSÃO',style:TextStyle(color:Colors.white70,fontSize:11,fontWeight:FontWeight.w800,letterSpacing:2))),
              _Pill(coins.toString()),
            ]),
            const SizedBox(height:46),
            const Icon(Icons.public_rounded,size:80,color:Color(0xFF00FFFF)),
            const SizedBox(height:18),
            ShaderMask(
              shaderCallback:(b)=>const LinearGradient(colors:[Color(0xFF00FFFF),Color(0xFF8A2BE2)]).createShader(b),
              child:const Text('Astrolábica',style:TextStyle(color:Colors.white,fontSize:46,fontWeight:FontWeight.w900,letterSpacing:1.2)),
            ),
            const Text('Quiz do Cosmos',style:TextStyle(color:Color(0xFFB8C7FF),fontSize:18,letterSpacing:4,fontWeight:FontWeight.w500)),
            const SizedBox(height:14),
            const Text('Veja o sinal, pense rápido e descubra o que existe no cosmos.',textAlign:TextAlign.center,style:TextStyle(color:Colors.white60,fontSize:15,height:1.45)),
            const SizedBox(height:28),
            Row(children:[
              Expanded(child:_Stat(icon:Icons.timer_outlined,value:'+$extraSeconds s',label:'upgrade de tempo')),
              const SizedBox(width:10),
              Expanded(child:_Stat(icon:Icons.favorite_rounded,value:'+$bonusLives',label:'vidas extras')),
            ]),
            const SizedBox(height:20),
            _Menu(icon:Icons.rocket_launch_rounded,label:'Jogar',accent:const Color(0xFF8A2BE2),onTap:onPlay),
            const SizedBox(height:11),
            _Menu(icon:Icons.storefront_rounded,label:'Loja',accent:const Color(0xFF00FFFF),onTap:onShop),
            const SizedBox(height:11),
            _Menu(icon:Icons.settings_rounded,label:'Configurações',accent:Colors.white70,onTap:onSettings),
            const SizedBox(height:25),
            const Text('6 IMAGENS • 4 CATEGORIAS • 10s BASE • 3 VIDAS',textAlign:TextAlign.center,style:TextStyle(color:Colors.white30,fontSize:10,letterSpacing:1.3)),
          ]),
        ),
      ),
    ),
  );
}

class _Pill extends StatelessWidget{
  final String value;const _Pill(this.value);
  @override Widget build(BuildContext context)=>Container(
    padding:const EdgeInsets.symmetric(horizontal:11,vertical:7),
    decoration:BoxDecoration(color:const Color(0xFF0B1021),borderRadius:BorderRadius.circular(99),border:Border.all(color:const Color(0xFF8A2BE2))),
    child:Row(mainAxisSize:MainAxisSize.min,children:[const Icon(Icons.stars_rounded,size:15,color:Color(0xFF00FFFF)),const SizedBox(width:5),Text(value,style:const TextStyle(color:Colors.white,fontWeight:FontWeight.w800))]),
  );
}

class _Stat extends StatelessWidget{
  final IconData icon;final String value,label;
  const _Stat({required this.icon,required this.value,required this.label});
  @override Widget build(BuildContext context)=>Container(
    padding:const EdgeInsets.all(14),
    decoration:BoxDecoration(color:const Color(0xFF0B1021),borderRadius:BorderRadius.circular(17),border:Border.all(color:Colors.white12)),
    child:Row(children:[Icon(icon,color:const Color(0xFF00FFFF),size:21),const SizedBox(width:9),Expanded(child:Column(crossAxisAlignment:CrossAxisAlignment.start,children:[Text(value,style:const TextStyle(color:Colors.white,fontWeight:FontWeight.w900)),Text(label,style:const TextStyle(color:Colors.white38,fontSize:10))]))]),
  );
}

class _Menu extends StatelessWidget{
  final IconData icon;final String label;final Color accent;final VoidCallback onTap;
  const _Menu({required this.icon,required this.label,required this.accent,required this.onTap});
  @override Widget build(BuildContext context)=>SizedBox(
    width:double.infinity,height:62,
    child:DecoratedBox(
      decoration:BoxDecoration(color:const Color(0xFF0B1021),borderRadius:BorderRadius.circular(18),border:Border.all(color:accent.withValues(alpha:.65))),
      child:Material(
        color:Colors.transparent,
        child:InkWell(
          onTap:onTap,borderRadius:BorderRadius.circular(18),
          child:Padding(
            padding:const EdgeInsets.symmetric(horizontal:18),
            child:Row(children:[Icon(icon,color:accent),const SizedBox(width:14),Expanded(child:Text(label,style:const TextStyle(color:Colors.white,fontSize:17,fontWeight:FontWeight.w800))),const Icon(Icons.chevron_right_rounded,color:Colors.white38)]),
          ),
        ),
      ),
    ),
  );
}
