import 'package:flutter/material.dart';
import '../models/meals.dart';
import '../utils/app_routes.dart';


class MealItem extends StatelessWidget {


  final Meal meal;


  const MealItem(this.meal);


  void _selectMeal(BuildContext context)//aqui irá fazer a chamada da navegação do mel
  {
    Navigator.of(context).pushNamed(
      AppRoutes.mealDetail,
      arguments: meal, //aqui eu tô passando a refeição como parâmetro
      ).then((result) {//o then serve só para quando for chamar alguma coisa, só abrirá quando a tela que coloquei na pilha for fechada
        if(result == null){
          print('Sem resultado');
        }else{
          print('o nome da refeição é $result');
        }
      });
  }


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:() => _selectMeal(context), //aqui eu chamo a fubção selectMel
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
           ),
        elevation: 4,
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
          Stack(
            children: [
              ClipRRect(// faz com que garanta as bordas para um determinado tipo de imagem
              borderRadius: BorderRadius.only(topLeft: Radius.circular(15),//esquerda //only eu coloco a borda como eu quero
              topRight: Radius.circular(15)),//direita),
                child: Image.network(
                  meal.imageUrl,
                  height: 250,
                  width: double.infinity, //espaço disponivel
                  fit: BoxFit.cover,
                ),
              ),//imagem a partir da rede
            Positioned(//componente que só funciona no contexto de uma stack, como se eu tivesse trabalhando em um layout absoluto dentro de um componente relatuvo na web , para isso irei envolver no container
              //com o positioned tenho a capacidade de definir onde quero fazer o enquadramento desse texto
             right: 10,
              bottom: 20,//quero que fique afastado do fundo ,
              child: Container(
                //envolvi com um container para dar uma estilizada
              width: 300, //altura
              color: Colors.black54, //cor do container
              padding: EdgeInsets.symmetric(//vou querer diferenciar o padding
              vertical: 5,
              horizontal: 20,
              ),
                child: Text(
                meal.title, //
                style: TextStyle(
                fontSize: 26,
                color: Colors.white,
                ),
                softWrap: true,
                overflow: TextOverflow.fade, //caso tenha uma imagem muito grande que apresente um overflow ele irá fazer isso de uma forma mais bonita com o TextOverflow.fade
                ),
              ),
            ),
            ],
          ),
          //componente que irá representar as informações que coloco embaixo
          Padding(
            padding: EdgeInsets.all(20),
            child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround, //espaço entre
              children:
            [
              Row(children: [
                Icon(Icons.schedule),
                SizedBox(//espaço com largura de 6
                  width: 6,
                  ),
                Text('${meal.duration} min'),
              ],
              ),
              Row(children: [
                Icon(Icons.work),
                SizedBox(//espaço com largura de 6
                  width: 6,
                  ),
                Text(meal.complexityText), //texto da complexidade que fiz na classe Meal.dart
             ]
              ),
               Row(children: [
                Icon(Icons.attach_money),
                SizedBox(//espaço com largura de 6
                  width: 6,
                  ),
                Text(meal.costText), //texto da complexidade que fiz na classe Meal.dart  
             ]
              ),
            ]
             ),
           ),
        ]),
      ),
    );
  }
}
