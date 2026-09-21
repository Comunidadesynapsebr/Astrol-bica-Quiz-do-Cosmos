import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../data/cosmic_game.dart';
import '../widgets/space_background.dart';

class VisualGameScreen extends StatefulWidget{
  final int extraSeconds,bonusLives;
  final bool vibrationEnabled,showTimer,animationsEnabled;
  final ValueChanged<int> onCoinsEarned;
  final ValueChanged<GameSummary> onFinished;
  const VisualGameScreen({
    super.key,required this.extraSeconds,required this.bonusLives,
    required this.vibrationEnabled,required this.showTimer,required this.animationsEnabled,
    required this.onCoinsEarned,required this.onFinished,
  });
  @override State<VisualGameScreen> createState()=>_VisualGameScreenState();
}

class _VisualGameScreenState extends State<VisualGameScreen> with SingleTickerProviderStateMixin{
  static const int baseSeconds=10;
  late final List<CosmicChallenge> rounds;
  late int lives,seconds;
  int current=0,score=0,earned=0;
  CosmicType? selected;
  bool locked=false;
  Timer? clock,next;
  late final AnimationController pulse;

  CosmicChallenge get question=>rounds[current];
  int get roundTime=>baseSeconds+widget.extraSeconds;

  @override void initState(){
    super.initState();
    rounds=shuffledChallenges();
    lives=3+widget.bonusLives;
    seconds=roundTime;
    pulse=AnimationController(vsync:this,duration:const Duration(milliseconds:700),lowerBound:.97,upperBound:1.03);
    if(widget.animationsEnabled)pulse.repeat(reverse:true);
    _startClock();
  }

  void _startClock(){
    clock?.cancel();
    clock=Timer.periodic(const Duration(seconds:1),(_){
      if(!mounted||locked)return;
      if(seconds<=1){
        setState(()=>seconds=0);
        _loseLife();
      }else{
        setState(()=>seconds--);
      }
    });
  }

  void _loseLife(){
    if(locked)return;
    clock?.cancel();
    setState((){locked=true;selected=null;lives--;});
    if(widget.vibrationEnabled)HapticFeedback.heavyImpact();
    _nextRound();
  }

  void _answer(CosmicType type){
    if(locked)return;
    clock?.cancel();
    final correct=type==question.answer;
    final reward=correct?(seconds>=roundTime~/2?20:15):0;
    setState((){
      locked=true;
      selected=type;
      if(correct){score++;earned+=reward;}else{lives--;}
    });
    if(widget.vibrationEnabled){
      if(correct){HapticFeedback.lightImpact();}else{HapticFeedback.heavyImpact();}
    }
    if(correct)widget.onCoinsEarned(reward);
    _nextRound();
  }

  void _nextRound(){
    next?.cancel();
    next=Timer(const Duration(milliseconds:700),(){
      if(!mounted)return;
      if(lives<=0||current==rounds.length-1){
        widget.onFinished(GameSummary(score:score,total:rounds.length,coinsEarned:earned,answered:current+1));
        return;
      }
      setState((){
        current++;
        seconds=roundTime;
        selected=null;
        locked=false;
      });
      _startClock();
    });
  }

  @override void dispose(){clock?.cancel();next?.cancel();pulse.dispose();super.dispose();}

  @override Widget build(BuildContext context){
    final progress=(current+1)/rounds.length;
    final timerProgress=seconds/roundTime;
    return Scaffold(
      body:SpaceBackground(
        child:SafeArea(
          child:Padding(
            padding:const EdgeInsets.fromLTRB(18,15,18,16),
            child:Column(children:[
              Row(children:[
                const Icon(Icons.radar_rounded,color:Color(0xFF00FFFF)),
                const SizedBox(width:8),
                Text((current+1).toString()+'/'+rounds.length.toString(),style:const TextStyle(color:Colors.white,fontWeight:FontWeight.w800)),
                const Spacer(),
                _Pill(Icons.favorite_rounded,'$lives'),
                const SizedBox(width:7),
                if(widget.showTimer)_Pill(Icons.timer_outlined,'$seconds'),
              ]),
              const SizedBox(height:10),
              ClipRRect(
                borderRadius:BorderRadius.circular(99),
                child:LinearProgressIndicator(
                  value:progress,minHeight:7,backgroundColor:Colors.white12,
                  valueColor:const AlwaysStoppedAnimation(Color(0xFF8A2BE2)),
                ),
              ),
              if(widget.showTimer)...[
                const SizedBox(height:10),
                ClipRRect(
                  borderRadius:BorderRadius.circular(99),
                  child:LinearProgressIndicator(
                    value:timerProgress,minHeight:4,backgroundColor:Colors.white10,
                    valueColor:AlwaysStoppedAnimation(seconds<=3?const Color(0xFFFF5364):const Color(0xFF00FFFF)),
                  ),
                ),
              ],
              const SizedBox(height:14),
              Expanded(
                child:SingleChildScrollView(
                  child:Column(children:[
                    ScaleTransition(
                      scale:widget.animationsEnabled?pulse:const AlwaysStoppedAnimation<double>(1),
                      child:_ImageCard(url:question.imageUrl,round:current+1),
                    ),
                    const SizedBox(height:14),
                    const Text('ISSO É',style:TextStyle(color:Color(0xFF00FFFF),fontSize:11,letterSpacing:2.4,fontWeight:FontWeight.w900)),
                    const SizedBox(height:10),
                    for(final type in CosmicType.values)
                      Padding(
                        padding:const EdgeInsets.only(bottom:8),
                        child:_AnswerButton(
                          label:type.label,icon:_icon(type),color:_buttonColor(type),
                          enabled:!locked,selected:selected==type,
                          correct:locked&&type==question.answer,onTap:()=>_answer(type),
                        ),
                      ),
                    if(locked)
                      Text(
                        selected==null?'Tempo esgotado • -1 vida':selected==question.answer?'✓ Correto!':'✕ Incorreto • -1 vida',
                        style:TextStyle(
                          color:selected==question.answer?Colors.greenAccent:Colors.redAccent,
                          fontWeight:FontWeight.w900,
                        ),
                      ),
                  ]),
                ),
              ),
              const SizedBox(height:5),
              Text('Estrelas da missão: $earned',style:const TextStyle(color:Colors.white38,fontSize:12,fontWeight:FontWeight.w700)),
            ]),
          ),
        ),
      ),
    );
  }

  Color _buttonColor(CosmicType type){
    if(!locked)return const Color(0xFF0B1021);
    if(type==question.answer)return const Color(0xFF168A4A);
    if(type==selected)return const Color(0xFFB32635);
    return const Color(0xFF0B1021);
  }

  IconData _icon(CosmicType type){
    switch(type){
      case CosmicType.galaxia:return Icons.blur_on_rounded;
      case CosmicType.buracoNegro:return Icons.circle;
      case CosmicType.planeta:return Icons.public_rounded;
      case CosmicType.quasar:return Icons.bolt_rounded;
    }
  }
}

class _Pill extends StatelessWidget{
  final IconData icon;final String text;
  const _Pill(this.icon,this.text);
  @override Widget build(BuildContext context)=>Container(
    padding:const EdgeInsets.symmetric(horizontal:9,vertical:6),
    decoration:BoxDecoration(color:const Color(0xFF0B1021),borderRadius:BorderRadius.circular(99),border:Border.all(color:Colors.white12)),
    child:Row(children:[Icon(icon,color:const Color(0xFF00FFFF),size:15),const SizedBox(width:4),Text(text,style:const TextStyle(color:Colors.white,fontWeight:FontWeight.w800))]),
  );
}

class _ImageCard extends StatelessWidget{
  final String url;final int round;
  const _ImageCard({required this.url,required this.round});
  @override Widget build(BuildContext context)=>Container(
    width:double.infinity,height:285,clipBehavior:Clip.antiAlias,
    decoration:BoxDecoration(color:const Color(0xFF050713),borderRadius:BorderRadius.circular(22),border:Border.all(color:const Color(0xFF8A2BE2))),
    child:Stack(fit:StackFit.expand,children:[
      Image.network(
        url,fit:BoxFit.cover,cacheWidth:720,filterQuality:FilterQuality.low,
        loadingBuilder:(context,child,progress)=>progress==null?child:const Center(child:CircularProgressIndicator(strokeWidth:2,color:Color(0xFF00FFFF))),
        errorBuilder:(_,__,___)=>const Center(child:Icon(Icons.image_not_supported_outlined,size:48,color:Colors.white24)),
      ),
      Positioned(
        left:10,top:10,
        child:DecoratedBox(
          decoration:BoxDecoration(color:Colors.black87,borderRadius:BorderRadius.circular(9)),
          child:Padding(
            padding:const EdgeInsets.symmetric(horizontal:9,vertical:5),
            child:Text('SINAL $round',style:const TextStyle(color:Color(0xFF00FFFF),fontSize:9,fontWeight:FontWeight.w900,letterSpacing:1.2)),
          ),
        ),
      ),
    ]),
  );
}

class _AnswerButton extends StatelessWidget{
  final String label;final IconData icon;final Color color;
  final bool enabled,selected,correct;final VoidCallback onTap;
  const _AnswerButton({required this.label,required this.icon,required this.color,required this.enabled,required this.selected,required this.correct,required this.onTap});

  @override Widget build(BuildContext context){
    final border=correct?Colors.greenAccent:selected?Colors.redAccent:const Color(0xFF8A2BE2);
    return SizedBox(
      width:double.infinity,height:52,
      child:AnimatedContainer(
        duration:const Duration(milliseconds:150),
        decoration:BoxDecoration(color:color,borderRadius:BorderRadius.circular(15),border:Border.all(color:border)),
        child:Material(
          color:Colors.transparent,
          child:InkWell(
            onTap:enabled?onTap:null,borderRadius:BorderRadius.circular(15),
            child:Row(children:[
              const SizedBox(width:15),
              Icon(icon,color:correct||selected?Colors.white:border,size:20),
              const SizedBox(width:11),
              Expanded(child:Text(label,style:const TextStyle(color:Colors.white,fontSize:14.5,fontWeight:FontWeight.w800))),
              if(correct)const Padding(padding:EdgeInsets.only(right:13),child:Icon(Icons.check_circle,color:Colors.white,size:20)),
              if(selected&&!correct)const Padding(padding:EdgeInsets.only(right:13),child:Icon(Icons.cancel,color:Colors.white,size:20)),
            ]),
          ),
        ),
      ),
    );
  }
}
