import 'package:flutter/material.dart';
import '../widgets/space_background.dart';

class SettingsScreen extends StatelessWidget{
  final bool vibrationEnabled,showTimer,animationsEnabled;
  final ValueChanged<bool> onVibrationChanged,onTimerChanged,onAnimationsChanged;
  final VoidCallback onReset,onBack;
  const SettingsScreen({super.key,required this.vibrationEnabled,required this.showTimer,required this.animationsEnabled,required this.onVibrationChanged,required this.onTimerChanged,required this.onAnimationsChanged,required this.onReset,required this.onBack});

  @override Widget build(BuildContext context)=>Scaffold(
    body:SpaceBackground(
      child:SafeArea(
        child:SingleChildScrollView(
          padding:const EdgeInsets.fromLTRB(20,18,20,28),
          child:Column(children:[
            Row(children:[IconButton(onPressed:onBack,icon:const Icon(Icons.arrow_back_rounded)),const Text('Configurações',style:TextStyle(color:Colors.white,fontSize:24,fontWeight:FontWeight.w900))]),
            const SizedBox(height:12),
            _Group(children:[
              SwitchListTile.adaptive(
                value:showTimer,onChanged:onTimerChanged,activeThumbColor:const Color(0xFF00FFFF),
                title:const Text('Mostrar cronômetro',style:TextStyle(color:Colors.white)),
                subtitle:const Text('O tempo continua valendo mesmo oculto.',style:TextStyle(color:Colors.white38)),
              ),
              SwitchListTile.adaptive(
                value:vibrationEnabled,onChanged:onVibrationChanged,activeThumbColor:const Color(0xFF00FFFF),
                title:const Text('Vibração',style:TextStyle(color:Colors.white)),
                subtitle:const Text('Feedback tátil nas respostas.',style:TextStyle(color:Colors.white38)),
              ),
              SwitchListTile.adaptive(
                value:animationsEnabled,onChanged:onAnimationsChanged,activeThumbColor:const Color(0xFF00FFFF),
                title:const Text('Animações',style:TextStyle(color:Colors.white)),
                subtitle:const Text('Desative para aliviar aparelhos mais fracos.',style:TextStyle(color:Colors.white38)),
              ),
            ]),
            const SizedBox(height:14),
            _Group(children:[
              ListTile(
                leading:const Icon(Icons.restart_alt_rounded,color:Color(0xFFFF6174)),
                title:const Text('Resetar progresso',style:TextStyle(color:Colors.white)),
                subtitle:const Text('100 estrelas e nenhum upgrade.',style:TextStyle(color:Colors.white38)),
                onTap:()=>_askReset(context),
              ),
            ]),
            const SizedBox(height:18),
            const Text('ASTROLÁBICA • V2.0',style:TextStyle(color:Colors.white24,fontSize:10,letterSpacing:2)),
          ]),
        ),
      ),
    ),
  );

  Future<void> _askReset(BuildContext context)async{
    final yes=await showDialog<bool>(
      context:context,
      builder:(_)=>AlertDialog(
        backgroundColor:const Color(0xFF0B1021),
        title:const Text('Resetar progresso?',style:TextStyle(color:Colors.white)),
        content:const Text('Suas estrelas e upgrades serão zerados.',style:TextStyle(color:Colors.white70)),
        actions:[
          TextButton(onPressed:()=>Navigator.pop(context,false),child:const Text('Cancelar')),
          FilledButton(onPressed:()=>Navigator.pop(context,true),child:const Text('Resetar')),
        ],
      ),
    );
    if(yes==true)onReset();
  }
}

class _Group extends StatelessWidget{
  final List<Widget> children;
  const _Group({required this.children});
  @override Widget build(BuildContext context)=>Container(
    decoration:BoxDecoration(color:const Color(0xFF0B1021),borderRadius:BorderRadius.circular(20),border:Border.all(color:Colors.white10)),
    child:Column(children:children),
  );
}
