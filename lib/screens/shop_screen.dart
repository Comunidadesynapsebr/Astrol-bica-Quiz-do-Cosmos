import 'package:flutter/material.dart';
import '../widgets/space_background.dart';

class ShopScreen extends StatelessWidget{
  final int coins,extraSeconds,bonusLives;
  final VoidCallback onBack,onBuyTime,onBuyLife;
  const ShopScreen({super.key,required this.coins,required this.extraSeconds,required this.bonusLives,required this.onBack,required this.onBuyTime,required this.onBuyLife});

  @override Widget build(BuildContext context){
    final timeLevel=extraSeconds~/2;
    final timeCost=60+(timeLevel*35);
    final lifeCost=100+(bonusLives*50);
    final timeMax=timeLevel>=4;
    final lifeMax=bonusLives>=2;
    final timeDetail=timeMax?'Máximo: 18 segundos por rodada':'Atual: ;
    final lifeDetail=lifeMax?'Máximo: 5 vidas por missão':'Atual: ;

    return Scaffold(
      body:SpaceBackground(
        child:SafeArea(
          child:SingleChildScrollView(
            padding:const EdgeInsets.fromLTRB(20,18,20,28),
            child:Column(
              crossAxisAlignment:CrossAxisAlignment.start,
              children:[
                Row(children:[IconButton(onPressed:onBack,icon:const Icon(Icons.arrow_back_rounded)),const Text('Loja',style:TextStyle(color:Colors.white,fontSize:24,fontWeight:FontWeight.w900))]),
                const SizedBox(height:18),
                Container(
                  width:double.infinity,padding:const EdgeInsets.all(20),
                  decoration:BoxDecoration(
                    gradient:const LinearGradient(colors:[Color(0xFF0B1021),Color(0xFF180B31)]),
                    borderRadius:BorderRadius.circular(22),border:Border.all(color:Color(0xFF8A2BE2)),
                  ),
                  child:Row(children:[
                    const Icon(Icons.stars_rounded,color:Color(0xFF00FFFF),size:28),
                    const SizedBox(width:12),
                    const Expanded(child:Text('Estrelas',style:TextStyle(color:Colors.white70,fontSize:14))),
                    Text('$coins',style:const TextStyle(color:Colors.white,fontSize:28,fontWeight:FontWeight.w900)),
                  ]),
                ),
                const SizedBox(height:22),
                _Upgrade(
                  icon:Icons.timer_outlined,color:const Color(0xFF00FFFF),title:'Mais tempo',
                  detail:timeDetail,price:timeCost,enabled:!timeMax&&coins>=timeCost,onBuy:onBuyTime,
                  level:timeMax?'MÁXIMO':'NÍVEL ,
                ),
                const SizedBox(height:14),
                _Upgrade(
                  icon:Icons.favorite_rounded,color:const Color(0xFF8A2BE2),title:'Mais uma vida',
                  detail:lifeDetail,price:lifeCost,enabled:!lifeMax&&coins>=lifeCost,onBuy:onBuyLife,
                  level:lifeMax?'MÁXIMO':'NÍVEL ,
                ),
                const SizedBox(height:22),
                const Text('EQUILÍBRIO DA LOJA',style:TextStyle(color:Color(0xFF00FFFF),fontSize:10,fontWeight:FontWeight.w900,letterSpacing:2)),
                const SizedBox(height:8),
                const Text(
                  '10 segundos base, upgrades limitados e custos crescentes. Acertos rápidos rendem até 20 estrelas, mantendo a habilidade como principal vantagem.',
                  style:TextStyle(color:Colors.white54,fontSize:12,height:1.5),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Upgrade extends StatelessWidget{
  final IconData icon; final Color color; final String title,detail,level; final int price; final bool enabled; final VoidCallback onBuy;
  const _Upgrade({required this.icon,required this.color,required this.title,required this.detail,required this.level,required this.price,required this.enabled,required this.onBuy});

  @override Widget build(BuildContext context)=>Container(
    width:double.infinity,padding:const EdgeInsets.all(18),
    decoration:BoxDecoration(color:const Color(0xFF0B1021),borderRadius:BorderRadius.circular(20),border:Border.all(color:color.withValues(alpha:.45))),
    child:Column(crossAxisAlignment:CrossAxisAlignment.start,children:[
      Row(children:[
        Icon(icon,color:color,size:27),const SizedBox(width:12),
        Expanded(child:Text(title,style:const TextStyle(color:Colors.white,fontSize:17,fontWeight:FontWeight.w800))),
        Text(level,style:const TextStyle(color:Colors.white30,fontSize:10)),
      ]),
      const SizedBox(height:12),
      Text(detail,style:const TextStyle(color:Colors.white60,fontSize:13)),
      const SizedBox(height:16),
      SizedBox(
        width:double.infinity,height:48,
        child:ElevatedButton.icon(
          onPressed:enabled?onBuy:null,
          icon:const Icon(Icons.add_shopping_cart_rounded,size:19),
          label:Text(enabled?'Comprar • $price estrelas':'Estrelas insuficientes'),
          style:ElevatedButton.styleFrom(
            backgroundColor:color,foregroundColor:Colors.black,
            disabledBackgroundColor:Colors.white10,disabledForegroundColor:Colors.white24,
            shape:RoundedRectangleBorder(borderRadius:BorderRadius.circular(14)),
            textStyle:const TextStyle(fontWeight:FontWeight.w800),
          ),
        ),
      ),
    ]),
  );
}
+'{10+extraSeconds}s • Compra: +2s';
    final lifeDetail=lifeMax?'Máximo: 5 vidas por missão':'Atual: '+(3+bonusLives).toString()+' vidas • Compra: +1';

    return Scaffold(
      body:SpaceBackground(
        child:SafeArea(
          child:SingleChildScrollView(
            padding:const EdgeInsets.fromLTRB(20,18,20,28),
            child:Column(
              crossAxisAlignment:CrossAxisAlignment.start,
              children:[
                Row(children:[IconButton(onPressed:onBack,icon:const Icon(Icons.arrow_back_rounded)),const Text('Loja',style:TextStyle(color:Colors.white,fontSize:24,fontWeight:FontWeight.w900))]),
                const SizedBox(height:18),
                Container(
                  width:double.infinity,padding:const EdgeInsets.all(20),
                  decoration:BoxDecoration(
                    gradient:const LinearGradient(colors:[Color(0xFF0B1021),Color(0xFF180B31)]),
                    borderRadius:BorderRadius.circular(22),border:Border.all(color:Color(0xFF8A2BE2)),
                  ),
                  child:Row(children:[
                    const Icon(Icons.stars_rounded,color:Color(0xFF00FFFF),size:28),
                    const SizedBox(width:12),
                    const Expanded(child:Text('Estrelas',style:TextStyle(color:Colors.white70,fontSize:14))),
                    Text('$coins',style:const TextStyle(color:Colors.white,fontSize:28,fontWeight:FontWeight.w900)),
                  ]),
                ),
                const SizedBox(height:22),
                _Upgrade(
                  icon:Icons.timer_outlined,color:const Color(0xFF00FFFF),title:'Mais tempo',
                  detail:timeDetail,price:timeCost,enabled:!timeMax&&coins>=timeCost,onBuy:onBuyTime,
                  level:timeMax?'MÁXIMO':'NÍVEL '+timeLevel.toString()+'/4',
                ),
                const SizedBox(height:14),
                _Upgrade(
                  icon:Icons.favorite_rounded,color:const Color(0xFF8A2BE2),title:'Mais uma vida',
                  detail:lifeDetail,price:lifeCost,enabled:!lifeMax&&coins>=lifeCost,onBuy:onBuyLife,
                  level:lifeMax?'MÁXIMO':'NÍVEL '+bonusLives.toString()+'/2',
                ),
                const SizedBox(height:22),
                const Text('EQUILÍBRIO DA LOJA',style:TextStyle(color:Color(0xFF00FFFF),fontSize:10,fontWeight:FontWeight.w900,letterSpacing:2)),
                const SizedBox(height:8),
                const Text(
                  '10 segundos base, upgrades limitados e custos crescentes. Acertos rápidos rendem até 20 estrelas, mantendo a habilidade como principal vantagem.',
                  style:TextStyle(color:Colors.white54,fontSize:12,height:1.5),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Upgrade extends StatelessWidget{
  final IconData icon; final Color color; final String title,detail,level; final int price; final bool enabled; final VoidCallback onBuy;
  const _Upgrade({required this.icon,required this.color,required this.title,required this.detail,required this.level,required this.price,required this.enabled,required this.onBuy});

  @override Widget build(BuildContext context)=>Container(
    width:double.infinity,padding:const EdgeInsets.all(18),
    decoration:BoxDecoration(color:const Color(0xFF0B1021),borderRadius:BorderRadius.circular(20),border:Border.all(color:color.withValues(alpha:.45))),
    child:Column(crossAxisAlignment:CrossAxisAlignment.start,children:[
      Row(children:[
        Icon(icon,color:color,size:27),const SizedBox(width:12),
        Expanded(child:Text(title,style:const TextStyle(color:Colors.white,fontSize:17,fontWeight:FontWeight.w800))),
        Text(level,style:const TextStyle(color:Colors.white30,fontSize:10)),
      ]),
      const SizedBox(height:12),
      Text(detail,style:const TextStyle(color:Colors.white60,fontSize:13)),
      const SizedBox(height:16),
      SizedBox(
        width:double.infinity,height:48,
        child:ElevatedButton.icon(
          onPressed:enabled?onBuy:null,
          icon:const Icon(Icons.add_shopping_cart_rounded,size:19),
          label:Text(enabled?'Comprar • $price estrelas':'Estrelas insuficientes'),
          style:ElevatedButton.styleFrom(
            backgroundColor:color,foregroundColor:Colors.black,
            disabledBackgroundColor:Colors.white10,disabledForegroundColor:Colors.white24,
            shape:RoundedRectangleBorder(borderRadius:BorderRadius.circular(14)),
            textStyle:const TextStyle(fontWeight:FontWeight.w800),
          ),
        ),
      ),
    ]),
  );
}
+'{3+bonusLives} vidas • Compra: +1';

    return Scaffold(
      body:SpaceBackground(
        child:SafeArea(
          child:SingleChildScrollView(
            padding:const EdgeInsets.fromLTRB(20,18,20,28),
            child:Column(
              crossAxisAlignment:CrossAxisAlignment.start,
              children:[
                Row(children:[IconButton(onPressed:onBack,icon:const Icon(Icons.arrow_back_rounded)),const Text('Loja',style:TextStyle(color:Colors.white,fontSize:24,fontWeight:FontWeight.w900))]),
                const SizedBox(height:18),
                Container(
                  width:double.infinity,padding:const EdgeInsets.all(20),
                  decoration:BoxDecoration(
                    gradient:const LinearGradient(colors:[Color(0xFF0B1021),Color(0xFF180B31)]),
                    borderRadius:BorderRadius.circular(22),border:Border.all(color:Color(0xFF8A2BE2)),
                  ),
                  child:Row(children:[
                    const Icon(Icons.stars_rounded,color:Color(0xFF00FFFF),size:28),
                    const SizedBox(width:12),
                    const Expanded(child:Text('Estrelas',style:TextStyle(color:Colors.white70,fontSize:14))),
                    Text('$coins',style:const TextStyle(color:Colors.white,fontSize:28,fontWeight:FontWeight.w900)),
                  ]),
                ),
                const SizedBox(height:22),
                _Upgrade(
                  icon:Icons.timer_outlined,color:const Color(0xFF00FFFF),title:'Mais tempo',
                  detail:timeDetail,price:timeCost,enabled:!timeMax&&coins>=timeCost,onBuy:onBuyTime,
                  level:timeMax?'MÁXIMO':'NÍVEL '+timeLevel.toString()+'/4',
                ),
                const SizedBox(height:14),
                _Upgrade(
                  icon:Icons.favorite_rounded,color:const Color(0xFF8A2BE2),title:'Mais uma vida',
                  detail:lifeDetail,price:lifeCost,enabled:!lifeMax&&coins>=lifeCost,onBuy:onBuyLife,
                  level:lifeMax?'MÁXIMO':'NÍVEL '+bonusLives.toString()+'/2',
                ),
                const SizedBox(height:22),
                const Text('EQUILÍBRIO DA LOJA',style:TextStyle(color:Color(0xFF00FFFF),fontSize:10,fontWeight:FontWeight.w900,letterSpacing:2)),
                const SizedBox(height:8),
                const Text(
                  '10 segundos base, upgrades limitados e custos crescentes. Acertos rápidos rendem até 20 estrelas, mantendo a habilidade como principal vantagem.',
                  style:TextStyle(color:Colors.white54,fontSize:12,height:1.5),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Upgrade extends StatelessWidget{
  final IconData icon; final Color color; final String title,detail,level; final int price; final bool enabled; final VoidCallback onBuy;
  const _Upgrade({required this.icon,required this.color,required this.title,required this.detail,required this.level,required this.price,required this.enabled,required this.onBuy});

  @override Widget build(BuildContext context)=>Container(
    width:double.infinity,padding:const EdgeInsets.all(18),
    decoration:BoxDecoration(color:const Color(0xFF0B1021),borderRadius:BorderRadius.circular(20),border:Border.all(color:color.withValues(alpha:.45))),
    child:Column(crossAxisAlignment:CrossAxisAlignment.start,children:[
      Row(children:[
        Icon(icon,color:color,size:27),const SizedBox(width:12),
        Expanded(child:Text(title,style:const TextStyle(color:Colors.white,fontSize:17,fontWeight:FontWeight.w800))),
        Text(level,style:const TextStyle(color:Colors.white30,fontSize:10)),
      ]),
      const SizedBox(height:12),
      Text(detail,style:const TextStyle(color:Colors.white60,fontSize:13)),
      const SizedBox(height:16),
      SizedBox(
        width:double.infinity,height:48,
        child:ElevatedButton.icon(
          onPressed:enabled?onBuy:null,
          icon:const Icon(Icons.add_shopping_cart_rounded,size:19),
          label:Text(enabled?'Comprar • $price estrelas':'Estrelas insuficientes'),
          style:ElevatedButton.styleFrom(
            backgroundColor:color,foregroundColor:Colors.black,
            disabledBackgroundColor:Colors.white10,disabledForegroundColor:Colors.white24,
            shape:RoundedRectangleBorder(borderRadius:BorderRadius.circular(14)),
            textStyle:const TextStyle(fontWeight:FontWeight.w800),
          ),
        ),
      ),
    ]),
  );
}
+'{10+extraSeconds}s • Compra: +2s';
    final lifeDetail=lifeMax?'Máximo: 5 vidas por missão':'Atual: '+(3+bonusLives).toString()+' vidas • Compra: +1';

    return Scaffold(
      body:SpaceBackground(
        child:SafeArea(
          child:SingleChildScrollView(
            padding:const EdgeInsets.fromLTRB(20,18,20,28),
            child:Column(
              crossAxisAlignment:CrossAxisAlignment.start,
              children:[
                Row(children:[IconButton(onPressed:onBack,icon:const Icon(Icons.arrow_back_rounded)),const Text('Loja',style:TextStyle(color:Colors.white,fontSize:24,fontWeight:FontWeight.w900))]),
                const SizedBox(height:18),
                Container(
                  width:double.infinity,padding:const EdgeInsets.all(20),
                  decoration:BoxDecoration(
                    gradient:const LinearGradient(colors:[Color(0xFF0B1021),Color(0xFF180B31)]),
                    borderRadius:BorderRadius.circular(22),border:Border.all(color:Color(0xFF8A2BE2)),
                  ),
                  child:Row(children:[
                    const Icon(Icons.stars_rounded,color:Color(0xFF00FFFF),size:28),
                    const SizedBox(width:12),
                    const Expanded(child:Text('Estrelas',style:TextStyle(color:Colors.white70,fontSize:14))),
                    Text('$coins',style:const TextStyle(color:Colors.white,fontSize:28,fontWeight:FontWeight.w900)),
                  ]),
                ),
                const SizedBox(height:22),
                _Upgrade(
                  icon:Icons.timer_outlined,color:const Color(0xFF00FFFF),title:'Mais tempo',
                  detail:timeDetail,price:timeCost,enabled:!timeMax&&coins>=timeCost,onBuy:onBuyTime,
                  level:timeMax?'MÁXIMO':'NÍVEL '+timeLevel.toString()+'/4',
                ),
                const SizedBox(height:14),
                _Upgrade(
                  icon:Icons.favorite_rounded,color:const Color(0xFF8A2BE2),title:'Mais uma vida',
                  detail:lifeDetail,price:lifeCost,enabled:!lifeMax&&coins>=lifeCost,onBuy:onBuyLife,
                  level:lifeMax?'MÁXIMO':'NÍVEL '+bonusLives.toString()+'/2',
                ),
                const SizedBox(height:22),
                const Text('EQUILÍBRIO DA LOJA',style:TextStyle(color:Color(0xFF00FFFF),fontSize:10,fontWeight:FontWeight.w900,letterSpacing:2)),
                const SizedBox(height:8),
                const Text(
                  '10 segundos base, upgrades limitados e custos crescentes. Acertos rápidos rendem até 20 estrelas, mantendo a habilidade como principal vantagem.',
                  style:TextStyle(color:Colors.white54,fontSize:12,height:1.5),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Upgrade extends StatelessWidget{
  final IconData icon; final Color color; final String title,detail,level; final int price; final bool enabled; final VoidCallback onBuy;
  const _Upgrade({required this.icon,required this.color,required this.title,required this.detail,required this.level,required this.price,required this.enabled,required this.onBuy});

  @override Widget build(BuildContext context)=>Container(
    width:double.infinity,padding:const EdgeInsets.all(18),
    decoration:BoxDecoration(color:const Color(0xFF0B1021),borderRadius:BorderRadius.circular(20),border:Border.all(color:color.withValues(alpha:.45))),
    child:Column(crossAxisAlignment:CrossAxisAlignment.start,children:[
      Row(children:[
        Icon(icon,color:color,size:27),const SizedBox(width:12),
        Expanded(child:Text(title,style:const TextStyle(color:Colors.white,fontSize:17,fontWeight:FontWeight.w800))),
        Text(level,style:const TextStyle(color:Colors.white30,fontSize:10)),
      ]),
      const SizedBox(height:12),
      Text(detail,style:const TextStyle(color:Colors.white60,fontSize:13)),
      const SizedBox(height:16),
      SizedBox(
        width:double.infinity,height:48,
        child:ElevatedButton.icon(
          onPressed:enabled?onBuy:null,
          icon:const Icon(Icons.add_shopping_cart_rounded,size:19),
          label:Text(enabled?'Comprar • $price estrelas':'Estrelas insuficientes'),
          style:ElevatedButton.styleFrom(
            backgroundColor:color,foregroundColor:Colors.black,
            disabledBackgroundColor:Colors.white10,disabledForegroundColor:Colors.white24,
            shape:RoundedRectangleBorder(borderRadius:BorderRadius.circular(14)),
            textStyle:const TextStyle(fontWeight:FontWeight.w800),
          ),
        ),
      ),
    ]),
  );
}
+'{timeLevel}/4',
                ),
                const SizedBox(height:14),
                _Upgrade(
                  icon:Icons.favorite_rounded,color:const Color(0xFF8A2BE2),title:'Mais uma vida',
                  detail:lifeDetail,price:lifeCost,enabled:!lifeMax&&coins>=lifeCost,onBuy:onBuyLife,
                  level:lifeMax?'MÁXIMO':'NÍVEL '+bonusLives.toString()+'/2',
                ),
                const SizedBox(height:22),
                const Text('EQUILÍBRIO DA LOJA',style:TextStyle(color:Color(0xFF00FFFF),fontSize:10,fontWeight:FontWeight.w900,letterSpacing:2)),
                const SizedBox(height:8),
                const Text(
                  '10 segundos base, upgrades limitados e custos crescentes. Acertos rápidos rendem até 20 estrelas, mantendo a habilidade como principal vantagem.',
                  style:TextStyle(color:Colors.white54,fontSize:12,height:1.5),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Upgrade extends StatelessWidget{
  final IconData icon; final Color color; final String title,detail,level; final int price; final bool enabled; final VoidCallback onBuy;
  const _Upgrade({required this.icon,required this.color,required this.title,required this.detail,required this.level,required this.price,required this.enabled,required this.onBuy});

  @override Widget build(BuildContext context)=>Container(
    width:double.infinity,padding:const EdgeInsets.all(18),
    decoration:BoxDecoration(color:const Color(0xFF0B1021),borderRadius:BorderRadius.circular(20),border:Border.all(color:color.withValues(alpha:.45))),
    child:Column(crossAxisAlignment:CrossAxisAlignment.start,children:[
      Row(children:[
        Icon(icon,color:color,size:27),const SizedBox(width:12),
        Expanded(child:Text(title,style:const TextStyle(color:Colors.white,fontSize:17,fontWeight:FontWeight.w800))),
        Text(level,style:const TextStyle(color:Colors.white30,fontSize:10)),
      ]),
      const SizedBox(height:12),
      Text(detail,style:const TextStyle(color:Colors.white60,fontSize:13)),
      const SizedBox(height:16),
      SizedBox(
        width:double.infinity,height:48,
        child:ElevatedButton.icon(
          onPressed:enabled?onBuy:null,
          icon:const Icon(Icons.add_shopping_cart_rounded,size:19),
          label:Text(enabled?'Comprar • $price estrelas':'Estrelas insuficientes'),
          style:ElevatedButton.styleFrom(
            backgroundColor:color,foregroundColor:Colors.black,
            disabledBackgroundColor:Colors.white10,disabledForegroundColor:Colors.white24,
            shape:RoundedRectangleBorder(borderRadius:BorderRadius.circular(14)),
            textStyle:const TextStyle(fontWeight:FontWeight.w800),
          ),
        ),
      ),
    ]),
  );
}
+'{10+extraSeconds}s • Compra: +2s';
    final lifeDetail=lifeMax?'Máximo: 5 vidas por missão':'Atual: '+(3+bonusLives).toString()+' vidas • Compra: +1';

    return Scaffold(
      body:SpaceBackground(
        child:SafeArea(
          child:SingleChildScrollView(
            padding:const EdgeInsets.fromLTRB(20,18,20,28),
            child:Column(
              crossAxisAlignment:CrossAxisAlignment.start,
              children:[
                Row(children:[IconButton(onPressed:onBack,icon:const Icon(Icons.arrow_back_rounded)),const Text('Loja',style:TextStyle(color:Colors.white,fontSize:24,fontWeight:FontWeight.w900))]),
                const SizedBox(height:18),
                Container(
                  width:double.infinity,padding:const EdgeInsets.all(20),
                  decoration:BoxDecoration(
                    gradient:const LinearGradient(colors:[Color(0xFF0B1021),Color(0xFF180B31)]),
                    borderRadius:BorderRadius.circular(22),border:Border.all(color:Color(0xFF8A2BE2)),
                  ),
                  child:Row(children:[
                    const Icon(Icons.stars_rounded,color:Color(0xFF00FFFF),size:28),
                    const SizedBox(width:12),
                    const Expanded(child:Text('Estrelas',style:TextStyle(color:Colors.white70,fontSize:14))),
                    Text('$coins',style:const TextStyle(color:Colors.white,fontSize:28,fontWeight:FontWeight.w900)),
                  ]),
                ),
                const SizedBox(height:22),
                _Upgrade(
                  icon:Icons.timer_outlined,color:const Color(0xFF00FFFF),title:'Mais tempo',
                  detail:timeDetail,price:timeCost,enabled:!timeMax&&coins>=timeCost,onBuy:onBuyTime,
                  level:timeMax?'MÁXIMO':'NÍVEL '+timeLevel.toString()+'/4',
                ),
                const SizedBox(height:14),
                _Upgrade(
                  icon:Icons.favorite_rounded,color:const Color(0xFF8A2BE2),title:'Mais uma vida',
                  detail:lifeDetail,price:lifeCost,enabled:!lifeMax&&coins>=lifeCost,onBuy:onBuyLife,
                  level:lifeMax?'MÁXIMO':'NÍVEL '+bonusLives.toString()+'/2',
                ),
                const SizedBox(height:22),
                const Text('EQUILÍBRIO DA LOJA',style:TextStyle(color:Color(0xFF00FFFF),fontSize:10,fontWeight:FontWeight.w900,letterSpacing:2)),
                const SizedBox(height:8),
                const Text(
                  '10 segundos base, upgrades limitados e custos crescentes. Acertos rápidos rendem até 20 estrelas, mantendo a habilidade como principal vantagem.',
                  style:TextStyle(color:Colors.white54,fontSize:12,height:1.5),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Upgrade extends StatelessWidget{
  final IconData icon; final Color color; final String title,detail,level; final int price; final bool enabled; final VoidCallback onBuy;
  const _Upgrade({required this.icon,required this.color,required this.title,required this.detail,required this.level,required this.price,required this.enabled,required this.onBuy});

  @override Widget build(BuildContext context)=>Container(
    width:double.infinity,padding:const EdgeInsets.all(18),
    decoration:BoxDecoration(color:const Color(0xFF0B1021),borderRadius:BorderRadius.circular(20),border:Border.all(color:color.withValues(alpha:.45))),
    child:Column(crossAxisAlignment:CrossAxisAlignment.start,children:[
      Row(children:[
        Icon(icon,color:color,size:27),const SizedBox(width:12),
        Expanded(child:Text(title,style:const TextStyle(color:Colors.white,fontSize:17,fontWeight:FontWeight.w800))),
        Text(level,style:const TextStyle(color:Colors.white30,fontSize:10)),
      ]),
      const SizedBox(height:12),
      Text(detail,style:const TextStyle(color:Colors.white60,fontSize:13)),
      const SizedBox(height:16),
      SizedBox(
        width:double.infinity,height:48,
        child:ElevatedButton.icon(
          onPressed:enabled?onBuy:null,
          icon:const Icon(Icons.add_shopping_cart_rounded,size:19),
          label:Text(enabled?'Comprar • $price estrelas':'Estrelas insuficientes'),
          style:ElevatedButton.styleFrom(
            backgroundColor:color,foregroundColor:Colors.black,
            disabledBackgroundColor:Colors.white10,disabledForegroundColor:Colors.white24,
            shape:RoundedRectangleBorder(borderRadius:BorderRadius.circular(14)),
            textStyle:const TextStyle(fontWeight:FontWeight.w800),
          ),
        ),
      ),
    ]),
  );
}
+'{3+bonusLives} vidas • Compra: +1';

    return Scaffold(
      body:SpaceBackground(
        child:SafeArea(
          child:SingleChildScrollView(
            padding:const EdgeInsets.fromLTRB(20,18,20,28),
            child:Column(
              crossAxisAlignment:CrossAxisAlignment.start,
              children:[
                Row(children:[IconButton(onPressed:onBack,icon:const Icon(Icons.arrow_back_rounded)),const Text('Loja',style:TextStyle(color:Colors.white,fontSize:24,fontWeight:FontWeight.w900))]),
                const SizedBox(height:18),
                Container(
                  width:double.infinity,padding:const EdgeInsets.all(20),
                  decoration:BoxDecoration(
                    gradient:const LinearGradient(colors:[Color(0xFF0B1021),Color(0xFF180B31)]),
                    borderRadius:BorderRadius.circular(22),border:Border.all(color:Color(0xFF8A2BE2)),
                  ),
                  child:Row(children:[
                    const Icon(Icons.stars_rounded,color:Color(0xFF00FFFF),size:28),
                    const SizedBox(width:12),
                    const Expanded(child:Text('Estrelas',style:TextStyle(color:Colors.white70,fontSize:14))),
                    Text('$coins',style:const TextStyle(color:Colors.white,fontSize:28,fontWeight:FontWeight.w900)),
                  ]),
                ),
                const SizedBox(height:22),
                _Upgrade(
                  icon:Icons.timer_outlined,color:const Color(0xFF00FFFF),title:'Mais tempo',
                  detail:timeDetail,price:timeCost,enabled:!timeMax&&coins>=timeCost,onBuy:onBuyTime,
                  level:timeMax?'MÁXIMO':'NÍVEL '+timeLevel.toString()+'/4',
                ),
                const SizedBox(height:14),
                _Upgrade(
                  icon:Icons.favorite_rounded,color:const Color(0xFF8A2BE2),title:'Mais uma vida',
                  detail:lifeDetail,price:lifeCost,enabled:!lifeMax&&coins>=lifeCost,onBuy:onBuyLife,
                  level:lifeMax?'MÁXIMO':'NÍVEL '+bonusLives.toString()+'/2',
                ),
                const SizedBox(height:22),
                const Text('EQUILÍBRIO DA LOJA',style:TextStyle(color:Color(0xFF00FFFF),fontSize:10,fontWeight:FontWeight.w900,letterSpacing:2)),
                const SizedBox(height:8),
                const Text(
                  '10 segundos base, upgrades limitados e custos crescentes. Acertos rápidos rendem até 20 estrelas, mantendo a habilidade como principal vantagem.',
                  style:TextStyle(color:Colors.white54,fontSize:12,height:1.5),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Upgrade extends StatelessWidget{
  final IconData icon; final Color color; final String title,detail,level; final int price; final bool enabled; final VoidCallback onBuy;
  const _Upgrade({required this.icon,required this.color,required this.title,required this.detail,required this.level,required this.price,required this.enabled,required this.onBuy});

  @override Widget build(BuildContext context)=>Container(
    width:double.infinity,padding:const EdgeInsets.all(18),
    decoration:BoxDecoration(color:const Color(0xFF0B1021),borderRadius:BorderRadius.circular(20),border:Border.all(color:color.withValues(alpha:.45))),
    child:Column(crossAxisAlignment:CrossAxisAlignment.start,children:[
      Row(children:[
        Icon(icon,color:color,size:27),const SizedBox(width:12),
        Expanded(child:Text(title,style:const TextStyle(color:Colors.white,fontSize:17,fontWeight:FontWeight.w800))),
        Text(level,style:const TextStyle(color:Colors.white30,fontSize:10)),
      ]),
      const SizedBox(height:12),
      Text(detail,style:const TextStyle(color:Colors.white60,fontSize:13)),
      const SizedBox(height:16),
      SizedBox(
        width:double.infinity,height:48,
        child:ElevatedButton.icon(
          onPressed:enabled?onBuy:null,
          icon:const Icon(Icons.add_shopping_cart_rounded,size:19),
          label:Text(enabled?'Comprar • $price estrelas':'Estrelas insuficientes'),
          style:ElevatedButton.styleFrom(
            backgroundColor:color,foregroundColor:Colors.black,
            disabledBackgroundColor:Colors.white10,disabledForegroundColor:Colors.white24,
            shape:RoundedRectangleBorder(borderRadius:BorderRadius.circular(14)),
            textStyle:const TextStyle(fontWeight:FontWeight.w800),
          ),
        ),
      ),
    ]),
  );
}
+'{10+extraSeconds}s • Compra: +2s';
    final lifeDetail=lifeMax?'Máximo: 5 vidas por missão':'Atual: '+(3+bonusLives).toString()+' vidas • Compra: +1';

    return Scaffold(
      body:SpaceBackground(
        child:SafeArea(
          child:SingleChildScrollView(
            padding:const EdgeInsets.fromLTRB(20,18,20,28),
            child:Column(
              crossAxisAlignment:CrossAxisAlignment.start,
              children:[
                Row(children:[IconButton(onPressed:onBack,icon:const Icon(Icons.arrow_back_rounded)),const Text('Loja',style:TextStyle(color:Colors.white,fontSize:24,fontWeight:FontWeight.w900))]),
                const SizedBox(height:18),
                Container(
                  width:double.infinity,padding:const EdgeInsets.all(20),
                  decoration:BoxDecoration(
                    gradient:const LinearGradient(colors:[Color(0xFF0B1021),Color(0xFF180B31)]),
                    borderRadius:BorderRadius.circular(22),border:Border.all(color:Color(0xFF8A2BE2)),
                  ),
                  child:Row(children:[
                    const Icon(Icons.stars_rounded,color:Color(0xFF00FFFF),size:28),
                    const SizedBox(width:12),
                    const Expanded(child:Text('Estrelas',style:TextStyle(color:Colors.white70,fontSize:14))),
                    Text('$coins',style:const TextStyle(color:Colors.white,fontSize:28,fontWeight:FontWeight.w900)),
                  ]),
                ),
                const SizedBox(height:22),
                _Upgrade(
                  icon:Icons.timer_outlined,color:const Color(0xFF00FFFF),title:'Mais tempo',
                  detail:timeDetail,price:timeCost,enabled:!timeMax&&coins>=timeCost,onBuy:onBuyTime,
                  level:timeMax?'MÁXIMO':'NÍVEL '+timeLevel.toString()+'/4',
                ),
                const SizedBox(height:14),
                _Upgrade(
                  icon:Icons.favorite_rounded,color:const Color(0xFF8A2BE2),title:'Mais uma vida',
                  detail:lifeDetail,price:lifeCost,enabled:!lifeMax&&coins>=lifeCost,onBuy:onBuyLife,
                  level:lifeMax?'MÁXIMO':'NÍVEL '+bonusLives.toString()+'/2',
                ),
                const SizedBox(height:22),
                const Text('EQUILÍBRIO DA LOJA',style:TextStyle(color:Color(0xFF00FFFF),fontSize:10,fontWeight:FontWeight.w900,letterSpacing:2)),
                const SizedBox(height:8),
                const Text(
                  '10 segundos base, upgrades limitados e custos crescentes. Acertos rápidos rendem até 20 estrelas, mantendo a habilidade como principal vantagem.',
                  style:TextStyle(color:Colors.white54,fontSize:12,height:1.5),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Upgrade extends StatelessWidget{
  final IconData icon; final Color color; final String title,detail,level; final int price; final bool enabled; final VoidCallback onBuy;
  const _Upgrade({required this.icon,required this.color,required this.title,required this.detail,required this.level,required this.price,required this.enabled,required this.onBuy});

  @override Widget build(BuildContext context)=>Container(
    width:double.infinity,padding:const EdgeInsets.all(18),
    decoration:BoxDecoration(color:const Color(0xFF0B1021),borderRadius:BorderRadius.circular(20),border:Border.all(color:color.withValues(alpha:.45))),
    child:Column(crossAxisAlignment:CrossAxisAlignment.start,children:[
      Row(children:[
        Icon(icon,color:color,size:27),const SizedBox(width:12),
        Expanded(child:Text(title,style:const TextStyle(color:Colors.white,fontSize:17,fontWeight:FontWeight.w800))),
        Text(level,style:const TextStyle(color:Colors.white30,fontSize:10)),
      ]),
      const SizedBox(height:12),
      Text(detail,style:const TextStyle(color:Colors.white60,fontSize:13)),
      const SizedBox(height:16),
      SizedBox(
        width:double.infinity,height:48,
        child:ElevatedButton.icon(
          onPressed:enabled?onBuy:null,
          icon:const Icon(Icons.add_shopping_cart_rounded,size:19),
          label:Text(enabled?'Comprar • $price estrelas':'Estrelas insuficientes'),
          style:ElevatedButton.styleFrom(
            backgroundColor:color,foregroundColor:Colors.black,
            disabledBackgroundColor:Colors.white10,disabledForegroundColor:Colors.white24,
            shape:RoundedRectangleBorder(borderRadius:BorderRadius.circular(14)),
            textStyle:const TextStyle(fontWeight:FontWeight.w800),
          ),
        ),
      ),
    ]),
  );
}
+'{bonusLives}/2',
                ),
                const SizedBox(height:22),
                const Text('EQUILÍBRIO DA LOJA',style:TextStyle(color:Color(0xFF00FFFF),fontSize:10,fontWeight:FontWeight.w900,letterSpacing:2)),
                const SizedBox(height:8),
                const Text(
                  '10 segundos base, upgrades limitados e custos crescentes. Acertos rápidos rendem até 20 estrelas, mantendo a habilidade como principal vantagem.',
                  style:TextStyle(color:Colors.white54,fontSize:12,height:1.5),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Upgrade extends StatelessWidget{
  final IconData icon; final Color color; final String title,detail,level; final int price; final bool enabled; final VoidCallback onBuy;
  const _Upgrade({required this.icon,required this.color,required this.title,required this.detail,required this.level,required this.price,required this.enabled,required this.onBuy});

  @override Widget build(BuildContext context)=>Container(
    width:double.infinity,padding:const EdgeInsets.all(18),
    decoration:BoxDecoration(color:const Color(0xFF0B1021),borderRadius:BorderRadius.circular(20),border:Border.all(color:color.withValues(alpha:.45))),
    child:Column(crossAxisAlignment:CrossAxisAlignment.start,children:[
      Row(children:[
        Icon(icon,color:color,size:27),const SizedBox(width:12),
        Expanded(child:Text(title,style:const TextStyle(color:Colors.white,fontSize:17,fontWeight:FontWeight.w800))),
        Text(level,style:const TextStyle(color:Colors.white30,fontSize:10)),
      ]),
      const SizedBox(height:12),
      Text(detail,style:const TextStyle(color:Colors.white60,fontSize:13)),
      const SizedBox(height:16),
      SizedBox(
        width:double.infinity,height:48,
        child:ElevatedButton.icon(
          onPressed:enabled?onBuy:null,
          icon:const Icon(Icons.add_shopping_cart_rounded,size:19),
          label:Text(enabled?'Comprar • $price estrelas':'Estrelas insuficientes'),
          style:ElevatedButton.styleFrom(
            backgroundColor:color,foregroundColor:Colors.black,
            disabledBackgroundColor:Colors.white10,disabledForegroundColor:Colors.white24,
            shape:RoundedRectangleBorder(borderRadius:BorderRadius.circular(14)),
            textStyle:const TextStyle(fontWeight:FontWeight.w800),
          ),
        ),
      ),
    ]),
  );
}
+'{10+extraSeconds}s • Compra: +2s';
    final lifeDetail=lifeMax?'Máximo: 5 vidas por missão':'Atual: '+(3+bonusLives).toString()+' vidas • Compra: +1';

    return Scaffold(
      body:SpaceBackground(
        child:SafeArea(
          child:SingleChildScrollView(
            padding:const EdgeInsets.fromLTRB(20,18,20,28),
            child:Column(
              crossAxisAlignment:CrossAxisAlignment.start,
              children:[
                Row(children:[IconButton(onPressed:onBack,icon:const Icon(Icons.arrow_back_rounded)),const Text('Loja',style:TextStyle(color:Colors.white,fontSize:24,fontWeight:FontWeight.w900))]),
                const SizedBox(height:18),
                Container(
                  width:double.infinity,padding:const EdgeInsets.all(20),
                  decoration:BoxDecoration(
                    gradient:const LinearGradient(colors:[Color(0xFF0B1021),Color(0xFF180B31)]),
                    borderRadius:BorderRadius.circular(22),border:Border.all(color:Color(0xFF8A2BE2)),
                  ),
                  child:Row(children:[
                    const Icon(Icons.stars_rounded,color:Color(0xFF00FFFF),size:28),
                    const SizedBox(width:12),
                    const Expanded(child:Text('Estrelas',style:TextStyle(color:Colors.white70,fontSize:14))),
                    Text('$coins',style:const TextStyle(color:Colors.white,fontSize:28,fontWeight:FontWeight.w900)),
                  ]),
                ),
                const SizedBox(height:22),
                _Upgrade(
                  icon:Icons.timer_outlined,color:const Color(0xFF00FFFF),title:'Mais tempo',
                  detail:timeDetail,price:timeCost,enabled:!timeMax&&coins>=timeCost,onBuy:onBuyTime,
                  level:timeMax?'MÁXIMO':'NÍVEL '+timeLevel.toString()+'/4',
                ),
                const SizedBox(height:14),
                _Upgrade(
                  icon:Icons.favorite_rounded,color:const Color(0xFF8A2BE2),title:'Mais uma vida',
                  detail:lifeDetail,price:lifeCost,enabled:!lifeMax&&coins>=lifeCost,onBuy:onBuyLife,
                  level:lifeMax?'MÁXIMO':'NÍVEL '+bonusLives.toString()+'/2',
                ),
                const SizedBox(height:22),
                const Text('EQUILÍBRIO DA LOJA',style:TextStyle(color:Color(0xFF00FFFF),fontSize:10,fontWeight:FontWeight.w900,letterSpacing:2)),
                const SizedBox(height:8),
                const Text(
                  '10 segundos base, upgrades limitados e custos crescentes. Acertos rápidos rendem até 20 estrelas, mantendo a habilidade como principal vantagem.',
                  style:TextStyle(color:Colors.white54,fontSize:12,height:1.5),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Upgrade extends StatelessWidget{
  final IconData icon; final Color color; final String title,detail,level; final int price; final bool enabled; final VoidCallback onBuy;
  const _Upgrade({required this.icon,required this.color,required this.title,required this.detail,required this.level,required this.price,required this.enabled,required this.onBuy});

  @override Widget build(BuildContext context)=>Container(
    width:double.infinity,padding:const EdgeInsets.all(18),
    decoration:BoxDecoration(color:const Color(0xFF0B1021),borderRadius:BorderRadius.circular(20),border:Border.all(color:color.withValues(alpha:.45))),
    child:Column(crossAxisAlignment:CrossAxisAlignment.start,children:[
      Row(children:[
        Icon(icon,color:color,size:27),const SizedBox(width:12),
        Expanded(child:Text(title,style:const TextStyle(color:Colors.white,fontSize:17,fontWeight:FontWeight.w800))),
        Text(level,style:const TextStyle(color:Colors.white30,fontSize:10)),
      ]),
      const SizedBox(height:12),
      Text(detail,style:const TextStyle(color:Colors.white60,fontSize:13)),
      const SizedBox(height:16),
      SizedBox(
        width:double.infinity,height:48,
        child:ElevatedButton.icon(
          onPressed:enabled?onBuy:null,
          icon:const Icon(Icons.add_shopping_cart_rounded,size:19),
          label:Text(enabled?'Comprar • $price estrelas':'Estrelas insuficientes'),
          style:ElevatedButton.styleFrom(
            backgroundColor:color,foregroundColor:Colors.black,
            disabledBackgroundColor:Colors.white10,disabledForegroundColor:Colors.white24,
            shape:RoundedRectangleBorder(borderRadius:BorderRadius.circular(14)),
            textStyle:const TextStyle(fontWeight:FontWeight.w800),
          ),
        ),
      ),
    ]),
  );
}
+'{3+bonusLives} vidas • Compra: +1';

    return Scaffold(
      body:SpaceBackground(
        child:SafeArea(
          child:SingleChildScrollView(
            padding:const EdgeInsets.fromLTRB(20,18,20,28),
            child:Column(
              crossAxisAlignment:CrossAxisAlignment.start,
              children:[
                Row(children:[IconButton(onPressed:onBack,icon:const Icon(Icons.arrow_back_rounded)),const Text('Loja',style:TextStyle(color:Colors.white,fontSize:24,fontWeight:FontWeight.w900))]),
                const SizedBox(height:18),
                Container(
                  width:double.infinity,padding:const EdgeInsets.all(20),
                  decoration:BoxDecoration(
                    gradient:const LinearGradient(colors:[Color(0xFF0B1021),Color(0xFF180B31)]),
                    borderRadius:BorderRadius.circular(22),border:Border.all(color:Color(0xFF8A2BE2)),
                  ),
                  child:Row(children:[
                    const Icon(Icons.stars_rounded,color:Color(0xFF00FFFF),size:28),
                    const SizedBox(width:12),
                    const Expanded(child:Text('Estrelas',style:TextStyle(color:Colors.white70,fontSize:14))),
                    Text('$coins',style:const TextStyle(color:Colors.white,fontSize:28,fontWeight:FontWeight.w900)),
                  ]),
                ),
                const SizedBox(height:22),
                _Upgrade(
                  icon:Icons.timer_outlined,color:const Color(0xFF00FFFF),title:'Mais tempo',
                  detail:timeDetail,price:timeCost,enabled:!timeMax&&coins>=timeCost,onBuy:onBuyTime,
                  level:timeMax?'MÁXIMO':'NÍVEL '+timeLevel.toString()+'/4',
                ),
                const SizedBox(height:14),
                _Upgrade(
                  icon:Icons.favorite_rounded,color:const Color(0xFF8A2BE2),title:'Mais uma vida',
                  detail:lifeDetail,price:lifeCost,enabled:!lifeMax&&coins>=lifeCost,onBuy:onBuyLife,
                  level:lifeMax?'MÁXIMO':'NÍVEL '+bonusLives.toString()+'/2',
                ),
                const SizedBox(height:22),
                const Text('EQUILÍBRIO DA LOJA',style:TextStyle(color:Color(0xFF00FFFF),fontSize:10,fontWeight:FontWeight.w900,letterSpacing:2)),
                const SizedBox(height:8),
                const Text(
                  '10 segundos base, upgrades limitados e custos crescentes. Acertos rápidos rendem até 20 estrelas, mantendo a habilidade como principal vantagem.',
                  style:TextStyle(color:Colors.white54,fontSize:12,height:1.5),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Upgrade extends StatelessWidget{
  final IconData icon; final Color color; final String title,detail,level; final int price; final bool enabled; final VoidCallback onBuy;
  const _Upgrade({required this.icon,required this.color,required this.title,required this.detail,required this.level,required this.price,required this.enabled,required this.onBuy});

  @override Widget build(BuildContext context)=>Container(
    width:double.infinity,padding:const EdgeInsets.all(18),
    decoration:BoxDecoration(color:const Color(0xFF0B1021),borderRadius:BorderRadius.circular(20),border:Border.all(color:color.withValues(alpha:.45))),
    child:Column(crossAxisAlignment:CrossAxisAlignment.start,children:[
      Row(children:[
        Icon(icon,color:color,size:27),const SizedBox(width:12),
        Expanded(child:Text(title,style:const TextStyle(color:Colors.white,fontSize:17,fontWeight:FontWeight.w800))),
        Text(level,style:const TextStyle(color:Colors.white30,fontSize:10)),
      ]),
      const SizedBox(height:12),
      Text(detail,style:const TextStyle(color:Colors.white60,fontSize:13)),
      const SizedBox(height:16),
      SizedBox(
        width:double.infinity,height:48,
        child:ElevatedButton.icon(
          onPressed:enabled?onBuy:null,
          icon:const Icon(Icons.add_shopping_cart_rounded,size:19),
          label:Text(enabled?'Comprar • $price estrelas':'Estrelas insuficientes'),
          style:ElevatedButton.styleFrom(
            backgroundColor:color,foregroundColor:Colors.black,
            disabledBackgroundColor:Colors.white10,disabledForegroundColor:Colors.white24,
            shape:RoundedRectangleBorder(borderRadius:BorderRadius.circular(14)),
            textStyle:const TextStyle(fontWeight:FontWeight.w800),
          ),
        ),
      ),
    ]),
  );
}
+'{10+extraSeconds}s • Compra: +2s';
    final lifeDetail=lifeMax?'Máximo: 5 vidas por missão':'Atual: '+(3+bonusLives).toString()+' vidas • Compra: +1';

    return Scaffold(
      body:SpaceBackground(
        child:SafeArea(
          child:SingleChildScrollView(
            padding:const EdgeInsets.fromLTRB(20,18,20,28),
            child:Column(
              crossAxisAlignment:CrossAxisAlignment.start,
              children:[
                Row(children:[IconButton(onPressed:onBack,icon:const Icon(Icons.arrow_back_rounded)),const Text('Loja',style:TextStyle(color:Colors.white,fontSize:24,fontWeight:FontWeight.w900))]),
                const SizedBox(height:18),
                Container(
                  width:double.infinity,padding:const EdgeInsets.all(20),
                  decoration:BoxDecoration(
                    gradient:const LinearGradient(colors:[Color(0xFF0B1021),Color(0xFF180B31)]),
                    borderRadius:BorderRadius.circular(22),border:Border.all(color:Color(0xFF8A2BE2)),
                  ),
                  child:Row(children:[
                    const Icon(Icons.stars_rounded,color:Color(0xFF00FFFF),size:28),
                    const SizedBox(width:12),
                    const Expanded(child:Text('Estrelas',style:TextStyle(color:Colors.white70,fontSize:14))),
                    Text('$coins',style:const TextStyle(color:Colors.white,fontSize:28,fontWeight:FontWeight.w900)),
                  ]),
                ),
                const SizedBox(height:22),
                _Upgrade(
                  icon:Icons.timer_outlined,color:const Color(0xFF00FFFF),title:'Mais tempo',
                  detail:timeDetail,price:timeCost,enabled:!timeMax&&coins>=timeCost,onBuy:onBuyTime,
                  level:timeMax?'MÁXIMO':'NÍVEL '+timeLevel.toString()+'/4',
                ),
                const SizedBox(height:14),
                _Upgrade(
                  icon:Icons.favorite_rounded,color:const Color(0xFF8A2BE2),title:'Mais uma vida',
                  detail:lifeDetail,price:lifeCost,enabled:!lifeMax&&coins>=lifeCost,onBuy:onBuyLife,
                  level:lifeMax?'MÁXIMO':'NÍVEL '+bonusLives.toString()+'/2',
                ),
                const SizedBox(height:22),
                const Text('EQUILÍBRIO DA LOJA',style:TextStyle(color:Color(0xFF00FFFF),fontSize:10,fontWeight:FontWeight.w900,letterSpacing:2)),
                const SizedBox(height:8),
                const Text(
                  '10 segundos base, upgrades limitados e custos crescentes. Acertos rápidos rendem até 20 estrelas, mantendo a habilidade como principal vantagem.',
                  style:TextStyle(color:Colors.white54,fontSize:12,height:1.5),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Upgrade extends StatelessWidget{
  final IconData icon; final Color color; final String title,detail,level; final int price; final bool enabled; final VoidCallback onBuy;
  const _Upgrade({required this.icon,required this.color,required this.title,required this.detail,required this.level,required this.price,required this.enabled,required this.onBuy});

  @override Widget build(BuildContext context)=>Container(
    width:double.infinity,padding:const EdgeInsets.all(18),
    decoration:BoxDecoration(color:const Color(0xFF0B1021),borderRadius:BorderRadius.circular(20),border:Border.all(color:color.withValues(alpha:.45))),
    child:Column(crossAxisAlignment:CrossAxisAlignment.start,children:[
      Row(children:[
        Icon(icon,color:color,size:27),const SizedBox(width:12),
        Expanded(child:Text(title,style:const TextStyle(color:Colors.white,fontSize:17,fontWeight:FontWeight.w800))),
        Text(level,style:const TextStyle(color:Colors.white30,fontSize:10)),
      ]),
      const SizedBox(height:12),
      Text(detail,style:const TextStyle(color:Colors.white60,fontSize:13)),
      const SizedBox(height:16),
      SizedBox(
        width:double.infinity,height:48,
        child:ElevatedButton.icon(
          onPressed:enabled?onBuy:null,
          icon:const Icon(Icons.add_shopping_cart_rounded,size:19),
          label:Text(enabled?'Comprar • $price estrelas':'Estrelas insuficientes'),
          style:ElevatedButton.styleFrom(
            backgroundColor:color,foregroundColor:Colors.black,
            disabledBackgroundColor:Colors.white10,disabledForegroundColor:Colors.white24,
            shape:RoundedRectangleBorder(borderRadius:BorderRadius.circular(14)),
            textStyle:const TextStyle(fontWeight:FontWeight.w800),
          ),
        ),
      ),
    ]),
  );
}
+'{timeLevel}/4',
                ),
                const SizedBox(height:14),
                _Upgrade(
                  icon:Icons.favorite_rounded,color:const Color(0xFF8A2BE2),title:'Mais uma vida',
                  detail:lifeDetail,price:lifeCost,enabled:!lifeMax&&coins>=lifeCost,onBuy:onBuyLife,
                  level:lifeMax?'MÁXIMO':'NÍVEL '+bonusLives.toString()+'/2',
                ),
                const SizedBox(height:22),
                const Text('EQUILÍBRIO DA LOJA',style:TextStyle(color:Color(0xFF00FFFF),fontSize:10,fontWeight:FontWeight.w900,letterSpacing:2)),
                const SizedBox(height:8),
                const Text(
                  '10 segundos base, upgrades limitados e custos crescentes. Acertos rápidos rendem até 20 estrelas, mantendo a habilidade como principal vantagem.',
                  style:TextStyle(color:Colors.white54,fontSize:12,height:1.5),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Upgrade extends StatelessWidget{
  final IconData icon; final Color color; final String title,detail,level; final int price; final bool enabled; final VoidCallback onBuy;
  const _Upgrade({required this.icon,required this.color,required this.title,required this.detail,required this.level,required this.price,required this.enabled,required this.onBuy});

  @override Widget build(BuildContext context)=>Container(
    width:double.infinity,padding:const EdgeInsets.all(18),
    decoration:BoxDecoration(color:const Color(0xFF0B1021),borderRadius:BorderRadius.circular(20),border:Border.all(color:color.withValues(alpha:.45))),
    child:Column(crossAxisAlignment:CrossAxisAlignment.start,children:[
      Row(children:[
        Icon(icon,color:color,size:27),const SizedBox(width:12),
        Expanded(child:Text(title,style:const TextStyle(color:Colors.white,fontSize:17,fontWeight:FontWeight.w800))),
        Text(level,style:const TextStyle(color:Colors.white30,fontSize:10)),
      ]),
      const SizedBox(height:12),
      Text(detail,style:const TextStyle(color:Colors.white60,fontSize:13)),
      const SizedBox(height:16),
      SizedBox(
        width:double.infinity,height:48,
        child:ElevatedButton.icon(
          onPressed:enabled?onBuy:null,
          icon:const Icon(Icons.add_shopping_cart_rounded,size:19),
          label:Text(enabled?'Comprar • $price estrelas':'Estrelas insuficientes'),
          style:ElevatedButton.styleFrom(
            backgroundColor:color,foregroundColor:Colors.black,
            disabledBackgroundColor:Colors.white10,disabledForegroundColor:Colors.white24,
            shape:RoundedRectangleBorder(borderRadius:BorderRadius.circular(14)),
            textStyle:const TextStyle(fontWeight:FontWeight.w800),
          ),
        ),
      ),
    ]),
  );
}
+'{10+extraSeconds}s • Compra: +2s';
    final lifeDetail=lifeMax?'Máximo: 5 vidas por missão':'Atual: '+(3+bonusLives).toString()+' vidas • Compra: +1';

    return Scaffold(
      body:SpaceBackground(
        child:SafeArea(
          child:SingleChildScrollView(
            padding:const EdgeInsets.fromLTRB(20,18,20,28),
            child:Column(
              crossAxisAlignment:CrossAxisAlignment.start,
              children:[
                Row(children:[IconButton(onPressed:onBack,icon:const Icon(Icons.arrow_back_rounded)),const Text('Loja',style:TextStyle(color:Colors.white,fontSize:24,fontWeight:FontWeight.w900))]),
                const SizedBox(height:18),
                Container(
                  width:double.infinity,padding:const EdgeInsets.all(20),
                  decoration:BoxDecoration(
                    gradient:const LinearGradient(colors:[Color(0xFF0B1021),Color(0xFF180B31)]),
                    borderRadius:BorderRadius.circular(22),border:Border.all(color:Color(0xFF8A2BE2)),
                  ),
                  child:Row(children:[
                    const Icon(Icons.stars_rounded,color:Color(0xFF00FFFF),size:28),
                    const SizedBox(width:12),
                    const Expanded(child:Text('Estrelas',style:TextStyle(color:Colors.white70,fontSize:14))),
                    Text('$coins',style:const TextStyle(color:Colors.white,fontSize:28,fontWeight:FontWeight.w900)),
                  ]),
                ),
                const SizedBox(height:22),
                _Upgrade(
                  icon:Icons.timer_outlined,color:const Color(0xFF00FFFF),title:'Mais tempo',
                  detail:timeDetail,price:timeCost,enabled:!timeMax&&coins>=timeCost,onBuy:onBuyTime,
                  level:timeMax?'MÁXIMO':'NÍVEL '+timeLevel.toString()+'/4',
                ),
                const SizedBox(height:14),
                _Upgrade(
                  icon:Icons.favorite_rounded,color:const Color(0xFF8A2BE2),title:'Mais uma vida',
                  detail:lifeDetail,price:lifeCost,enabled:!lifeMax&&coins>=lifeCost,onBuy:onBuyLife,
                  level:lifeMax?'MÁXIMO':'NÍVEL '+bonusLives.toString()+'/2',
                ),
                const SizedBox(height:22),
                const Text('EQUILÍBRIO DA LOJA',style:TextStyle(color:Color(0xFF00FFFF),fontSize:10,fontWeight:FontWeight.w900,letterSpacing:2)),
                const SizedBox(height:8),
                const Text(
                  '10 segundos base, upgrades limitados e custos crescentes. Acertos rápidos rendem até 20 estrelas, mantendo a habilidade como principal vantagem.',
                  style:TextStyle(color:Colors.white54,fontSize:12,height:1.5),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Upgrade extends StatelessWidget{
  final IconData icon; final Color color; final String title,detail,level; final int price; final bool enabled; final VoidCallback onBuy;
  const _Upgrade({required this.icon,required this.color,required this.title,required this.detail,required this.level,required this.price,required this.enabled,required this.onBuy});

  @override Widget build(BuildContext context)=>Container(
    width:double.infinity,padding:const EdgeInsets.all(18),
    decoration:BoxDecoration(color:const Color(0xFF0B1021),borderRadius:BorderRadius.circular(20),border:Border.all(color:color.withValues(alpha:.45))),
    child:Column(crossAxisAlignment:CrossAxisAlignment.start,children:[
      Row(children:[
        Icon(icon,color:color,size:27),const SizedBox(width:12),
        Expanded(child:Text(title,style:const TextStyle(color:Colors.white,fontSize:17,fontWeight:FontWeight.w800))),
        Text(level,style:const TextStyle(color:Colors.white30,fontSize:10)),
      ]),
      const SizedBox(height:12),
      Text(detail,style:const TextStyle(color:Colors.white60,fontSize:13)),
      const SizedBox(height:16),
      SizedBox(
        width:double.infinity,height:48,
        child:ElevatedButton.icon(
          onPressed:enabled?onBuy:null,
          icon:const Icon(Icons.add_shopping_cart_rounded,size:19),
          label:Text(enabled?'Comprar • $price estrelas':'Estrelas insuficientes'),
          style:ElevatedButton.styleFrom(
            backgroundColor:color,foregroundColor:Colors.black,
            disabledBackgroundColor:Colors.white10,disabledForegroundColor:Colors.white24,
            shape:RoundedRectangleBorder(borderRadius:BorderRadius.circular(14)),
            textStyle:const TextStyle(fontWeight:FontWeight.w800),
          ),
        ),
      ),
    ]),
  );
}
+'{3+bonusLives} vidas • Compra: +1';

    return Scaffold(
      body:SpaceBackground(
        child:SafeArea(
          child:SingleChildScrollView(
            padding:const EdgeInsets.fromLTRB(20,18,20,28),
            child:Column(
              crossAxisAlignment:CrossAxisAlignment.start,
              children:[
                Row(children:[IconButton(onPressed:onBack,icon:const Icon(Icons.arrow_back_rounded)),const Text('Loja',style:TextStyle(color:Colors.white,fontSize:24,fontWeight:FontWeight.w900))]),
                const SizedBox(height:18),
                Container(
                  width:double.infinity,padding:const EdgeInsets.all(20),
                  decoration:BoxDecoration(
                    gradient:const LinearGradient(colors:[Color(0xFF0B1021),Color(0xFF180B31)]),
                    borderRadius:BorderRadius.circular(22),border:Border.all(color:Color(0xFF8A2BE2)),
                  ),
                  child:Row(children:[
                    const Icon(Icons.stars_rounded,color:Color(0xFF00FFFF),size:28),
                    const SizedBox(width:12),
                    const Expanded(child:Text('Estrelas',style:TextStyle(color:Colors.white70,fontSize:14))),
                    Text('$coins',style:const TextStyle(color:Colors.white,fontSize:28,fontWeight:FontWeight.w900)),
                  ]),
                ),
                const SizedBox(height:22),
                _Upgrade(
                  icon:Icons.timer_outlined,color:const Color(0xFF00FFFF),title:'Mais tempo',
                  detail:timeDetail,price:timeCost,enabled:!timeMax&&coins>=timeCost,onBuy:onBuyTime,
                  level:timeMax?'MÁXIMO':'NÍVEL '+timeLevel.toString()+'/4',
                ),
                const SizedBox(height:14),
                _Upgrade(
                  icon:Icons.favorite_rounded,color:const Color(0xFF8A2BE2),title:'Mais uma vida',
                  detail:lifeDetail,price:lifeCost,enabled:!lifeMax&&coins>=lifeCost,onBuy:onBuyLife,
                  level:lifeMax?'MÁXIMO':'NÍVEL '+bonusLives.toString()+'/2',
                ),
                const SizedBox(height:22),
                const Text('EQUILÍBRIO DA LOJA',style:TextStyle(color:Color(0xFF00FFFF),fontSize:10,fontWeight:FontWeight.w900,letterSpacing:2)),
                const SizedBox(height:8),
                const Text(
                  '10 segundos base, upgrades limitados e custos crescentes. Acertos rápidos rendem até 20 estrelas, mantendo a habilidade como principal vantagem.',
                  style:TextStyle(color:Colors.white54,fontSize:12,height:1.5),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Upgrade extends StatelessWidget{
  final IconData icon; final Color color; final String title,detail,level; final int price; final bool enabled; final VoidCallback onBuy;
  const _Upgrade({required this.icon,required this.color,required this.title,required this.detail,required this.level,required this.price,required this.enabled,required this.onBuy});

  @override Widget build(BuildContext context)=>Container(
    width:double.infinity,padding:const EdgeInsets.all(18),
    decoration:BoxDecoration(color:const Color(0xFF0B1021),borderRadius:BorderRadius.circular(20),border:Border.all(color:color.withValues(alpha:.45))),
    child:Column(crossAxisAlignment:CrossAxisAlignment.start,children:[
      Row(children:[
        Icon(icon,color:color,size:27),const SizedBox(width:12),
        Expanded(child:Text(title,style:const TextStyle(color:Colors.white,fontSize:17,fontWeight:FontWeight.w800))),
        Text(level,style:const TextStyle(color:Colors.white30,fontSize:10)),
      ]),
      const SizedBox(height:12),
      Text(detail,style:const TextStyle(color:Colors.white60,fontSize:13)),
      const SizedBox(height:16),
      SizedBox(
        width:double.infinity,height:48,
        child:ElevatedButton.icon(
          onPressed:enabled?onBuy:null,
          icon:const Icon(Icons.add_shopping_cart_rounded,size:19),
          label:Text(enabled?'Comprar • $price estrelas':'Estrelas insuficientes'),
          style:ElevatedButton.styleFrom(
            backgroundColor:color,foregroundColor:Colors.black,
            disabledBackgroundColor:Colors.white10,disabledForegroundColor:Colors.white24,
            shape:RoundedRectangleBorder(borderRadius:BorderRadius.circular(14)),
            textStyle:const TextStyle(fontWeight:FontWeight.w800),
          ),
        ),
      ),
    ]),
  );
}
+'{10+extraSeconds}s • Compra: +2s';
    final lifeDetail=lifeMax?'Máximo: 5 vidas por missão':'Atual: '+(3+bonusLives).toString()+' vidas • Compra: +1';

    return Scaffold(
      body:SpaceBackground(
        child:SafeArea(
          child:SingleChildScrollView(
            padding:const EdgeInsets.fromLTRB(20,18,20,28),
            child:Column(
              crossAxisAlignment:CrossAxisAlignment.start,
              children:[
                Row(children:[IconButton(onPressed:onBack,icon:const Icon(Icons.arrow_back_rounded)),const Text('Loja',style:TextStyle(color:Colors.white,fontSize:24,fontWeight:FontWeight.w900))]),
                const SizedBox(height:18),
                Container(
                  width:double.infinity,padding:const EdgeInsets.all(20),
                  decoration:BoxDecoration(
                    gradient:const LinearGradient(colors:[Color(0xFF0B1021),Color(0xFF180B31)]),
                    borderRadius:BorderRadius.circular(22),border:Border.all(color:Color(0xFF8A2BE2)),
                  ),
                  child:Row(children:[
                    const Icon(Icons.stars_rounded,color:Color(0xFF00FFFF),size:28),
                    const SizedBox(width:12),
                    const Expanded(child:Text('Estrelas',style:TextStyle(color:Colors.white70,fontSize:14))),
                    Text('$coins',style:const TextStyle(color:Colors.white,fontSize:28,fontWeight:FontWeight.w900)),
                  ]),
                ),
                const SizedBox(height:22),
                _Upgrade(
                  icon:Icons.timer_outlined,color:const Color(0xFF00FFFF),title:'Mais tempo',
                  detail:timeDetail,price:timeCost,enabled:!timeMax&&coins>=timeCost,onBuy:onBuyTime,
                  level:timeMax?'MÁXIMO':'NÍVEL '+timeLevel.toString()+'/4',
                ),
                const SizedBox(height:14),
                _Upgrade(
                  icon:Icons.favorite_rounded,color:const Color(0xFF8A2BE2),title:'Mais uma vida',
                  detail:lifeDetail,price:lifeCost,enabled:!lifeMax&&coins>=lifeCost,onBuy:onBuyLife,
                  level:lifeMax?'MÁXIMO':'NÍVEL '+bonusLives.toString()+'/2',
                ),
                const SizedBox(height:22),
                const Text('EQUILÍBRIO DA LOJA',style:TextStyle(color:Color(0xFF00FFFF),fontSize:10,fontWeight:FontWeight.w900,letterSpacing:2)),
                const SizedBox(height:8),
                const Text(
                  '10 segundos base, upgrades limitados e custos crescentes. Acertos rápidos rendem até 20 estrelas, mantendo a habilidade como principal vantagem.',
                  style:TextStyle(color:Colors.white54,fontSize:12,height:1.5),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Upgrade extends StatelessWidget{
  final IconData icon; final Color color; final String title,detail,level; final int price; final bool enabled; final VoidCallback onBuy;
  const _Upgrade({required this.icon,required this.color,required this.title,required this.detail,required this.level,required this.price,required this.enabled,required this.onBuy});

  @override Widget build(BuildContext context)=>Container(
    width:double.infinity,padding:const EdgeInsets.all(18),
    decoration:BoxDecoration(color:const Color(0xFF0B1021),borderRadius:BorderRadius.circular(20),border:Border.all(color:color.withValues(alpha:.45))),
    child:Column(crossAxisAlignment:CrossAxisAlignment.start,children:[
      Row(children:[
        Icon(icon,color:color,size:27),const SizedBox(width:12),
        Expanded(child:Text(title,style:const TextStyle(color:Colors.white,fontSize:17,fontWeight:FontWeight.w800))),
        Text(level,style:const TextStyle(color:Colors.white30,fontSize:10)),
      ]),
      const SizedBox(height:12),
      Text(detail,style:const TextStyle(color:Colors.white60,fontSize:13)),
      const SizedBox(height:16),
      SizedBox(
        width:double.infinity,height:48,
        child:ElevatedButton.icon(
          onPressed:enabled?onBuy:null,
          icon:const Icon(Icons.add_shopping_cart_rounded,size:19),
          label:Text(enabled?'Comprar • $price estrelas':'Estrelas insuficientes'),
          style:ElevatedButton.styleFrom(
            backgroundColor:color,foregroundColor:Colors.black,
            disabledBackgroundColor:Colors.white10,disabledForegroundColor:Colors.white24,
            shape:RoundedRectangleBorder(borderRadius:BorderRadius.circular(14)),
            textStyle:const TextStyle(fontWeight:FontWeight.w800),
          ),
        ),
      ),
    ]),
  );
}
