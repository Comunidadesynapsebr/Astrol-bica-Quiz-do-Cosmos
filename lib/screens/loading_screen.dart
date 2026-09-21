import 'dart:async';
import 'package:flutter/material.dart';
import '../data/cosmic_game.dart';
import '../widgets/space_background.dart';

class LoadingScreen extends StatefulWidget{
  final VoidCallback onReady;
  const LoadingScreen({super.key,required this.onReady});
  @override State<LoadingScreen> createState()=>_LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> with SingleTickerProviderStateMixin{
  late final AnimationController _pulse;
  Timer? _timer;
  int _progress=0;
  bool _finished=false;

  @override void initState(){
    super.initState();
    _pulse=AnimationController(vsync:this,duration:const Duration(milliseconds:850),lowerBound:.95,upperBound:1.05)..repeat(reverse:true);
    _timer=Timer.periodic(const Duration(milliseconds:30),(timer){
      if(!mounted||_finished)return;
      setState(()=>_progress=(_progress+2).clamp(0,100));
      if(_progress>=100){
        _finished=true;
        timer.cancel();
        widget.onReady();
      }
    });
    _warmUp();
  }

  Future<void> _warmUp()async{
    try{await precacheImage(NetworkImage(challenges.first.imageUrl),context);}catch(_){}
  }

  @override void dispose(){_timer?.cancel();_pulse.dispose();super.dispose();}

  @override Widget build(BuildContext context){
    final label=_progress<35?'Inicializando observatório...':_progress<70?'Calibrando sensores...':'Carregando sinais visuais...';
    return Scaffold(
      body:SpaceBackground(
        child:SafeArea(
          child:Center(
            child:Padding(
              padding:const EdgeInsets.all(28),
              child:Column(
                mainAxisAlignment:MainAxisAlignment.center,
                children:[
                  ScaleTransition(scale:_pulse,child:const Icon(Icons.travel_explore_rounded,size:92,color:Color(0xFF00FFFF))),
                  const SizedBox(height:26),
                  const Text('ASTROLÁBICA',style:TextStyle(color:Colors.white,fontSize:34,fontWeight:FontWeight.w900,letterSpacing:5)),
                  const SizedBox(height:10),
                  Text(label,style:const TextStyle(color:Color(0xFFB8C7FF),fontSize:14)),
                  const SizedBox(height:28),
                  ClipRRect(
                    borderRadius:BorderRadius.circular(99),
                    child:LinearProgressIndicator(
                      value:_progress/100,minHeight:9,backgroundColor:Colors.white12,
                      valueColor:const AlwaysStoppedAnimation(Color(0xFF8A2BE2)),
                    ),
                  ),
                  const SizedBox(height:12),
                  Text('$_progress%',style:const TextStyle(color:Color(0xFF00FFFF),fontWeight:FontWeight.w800)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
