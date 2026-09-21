import 'package:flutter/material.dart';
import '../widgets/space_background.dart';

class ResultScreen extends StatelessWidget{
  final int score,total,coinsEarned,answered;
  final VoidCallback onReplay,onHome;
  const ResultScreen({super.key,required this.score,required this.total,required this.coinsEarned,required this.answered,required this.onReplay,required this.onHome});

  @override Widget build(BuildContext context){
    final percent=((score/total)*100).round();
    final title=score==total?'Mestre da Galáxia':score>=4?'Navegador Cósmico':score>=3?'Explorador Espacial':'Astronauta Perdido';
    return Scaffold(
      body:SpaceBackground(
        child:SafeArea(
          child:Center(
            child:SingleChildScrollView(
              padding:const EdgeInsets.all(24),
              child:Column(children:[
                const Icon(Icons.emoji_events_rounded,size:82,color:Color(0xFF00FFFF)),
                const SizedBox(height:15),
                const Text('MISSÃO ENCERRADA',style:TextStyle(color:Color(0xFF00FFFF),fontSize:11,letterSpacing:2.5,fontWeight:FontWeight.w900)),
                const SizedBox(height:9),
                Text(title,textAlign:TextAlign.center,style:const TextStyle(color:Colors.white,fontSize:31,fontWeight:FontWeight.w900)),
                const SizedBox(height:18),
                Container(
                  width:double.infinity,padding:const EdgeInsets.all(24),
                  decoration:BoxDecoration(color:const Color(0xFF0B1021),borderRadius:BorderRadius.circular(24),border:Border.all(color:const Color(0xFF8A2BE2))),
                  child:Column(children:[
                    Text(score.toString()+'/'+total.toString(),style:const TextStyle(color:Colors.white,fontSize:52,fontWeight:FontWeight.w900)),
                    Text('$percent% de acerto',style:const TextStyle(color:Color(0xFFB8C7FF),fontWeight:FontWeight.w700)),
                    const SizedBox(height:20),
                    _Row(Icons.stars_rounded,'Estrelas ganhas','+$coinsEarned'),
                    const SizedBox(height:10),
                    _Row(Icons.radar_rounded,'Sinais processados',answered.toString()+'/'+total.toString()),
                  ]),
                ),
                const SizedBox(height:22),
                SizedBox(
                  width:double.infinity,height:56,
                  child:ElevatedButton.icon(
                    onPressed:onReplay,
                    icon:const Icon(Icons.replay_rounded),
                    label:const Text('Jogar novamente'),
                    style:ElevatedButton.styleFrom(
                      backgroundColor:const Color(0xFF8A2BE2),foregroundColor:Colors.white,
                      shape:RoundedRectangleBorder(borderRadius:BorderRadius.circular(16)),
                      textStyle:const TextStyle(fontSize:16,fontWeight:FontWeight.w800),
                    ),
                  ),
                ),
                TextButton.icon(onPressed:onHome,icon:const Icon(Icons.home_rounded),label:const Text('Voltar ao menu')),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}

class _Row extends StatelessWidget{
  final IconData icon;final String label,value;
  const _Row(this.icon,this.label,this.value);
  @override Widget build(BuildContext context)=>Row(children:[Icon(icon,color:const Color(0xFF00FFFF),size:20),const SizedBox(width:10),Expanded(child:Text(label,style:const TextStyle(color:Colors.white54,fontSize:13))),Text(value,style:const TextStyle(color:Colors.white,fontWeight:FontWeight.w800))]);
}
