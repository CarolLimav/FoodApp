//tela de detalhes das receitas
import 'package:flutter/material.dart';
import '../models/meals.dart';
class MealDetailScreen extends StatelessWidget {
 
final Function(Meal) onToggleFavorite;
final bool Function (Meal)_isFavorite;

const MealDetailScreen(this.onToggleFavorite,this._isFavorite);

Widget _createSectionTitle(BuildContext context, String title) {//construtor
return Container(
          margin: EdgeInsets.symmetric(
            vertical: 10,
      ),
     child: Text(
     title,
     style: Theme.of(context).textTheme.headline6, //pegar estilo a partir do main
         
   ),
  );
}

Widget _createSectionContainer(Widget child){
 return Container(
          width: 330,
          height: 200,
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(10),
          ),
          child: child
  );
}

  @override
  Widget build(BuildContext context) {

    final meal = ModalRoute.of(context)!.settings.arguments as Meal;

    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
    body: SingleChildScrollView(//envolvi com o single child scrow view para não ter problema de overflow
      child: Column(
        children: [
          SizedBox(
            child: Container(
              height: 300,
              width: double.infinity, //usar espaço máximo
              child: Image.network(
                meal.imageUrl,
                fit: BoxFit.cover, //aqui é pra mostrar a tela assim que aperta no box das especificações da receita;
              ),
            ),
          ),
          _createSectionTitle(context, 'ingredientes'), //isso vem a partir do método que criei em cima
          _createSectionContainer(ListView.builder(
              itemCount: meal.ingredientes.length, //quantos elementos tenho na lista para não ter problemas, irá percorrer apenas a quantidade de itens que coloquei na lista
              itemBuilder: (context, index){
              return Card (
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 5,
                    horizontal: 10,
                  ),
                  child: Text(
                    meal.ingredientes[index]),
                ),
                // color: Theme.of(context).accentColor, //cor de destaque
                );
            }),),
            _createSectionTitle(context, 'Passos'),
            _createSectionContainer(
              ListView.builder(
                itemCount: meal.steps.length,
                itemBuilder: (context, index)// parâmetros da função recebendo o context e o index
                {
                  return Column(
                    children: [
                      ListTile( //componente que irá retornar os passos da refeição
                      leading: CircleAvatar( //aqui é para a parte do passo a passo das refeições
                      child: Text('${index + 1}'), //aqui ele vai pegar o valor do indice e somar +1
                      ),
                      title: Text(meal.steps[index]),
                      ),
                      Divider(), //pra colocar linha entre o passo a passo
                    ],
                  );
                },
                )
            )
        ],
      ),
    ),
    floatingActionButton: FloatingActionButton(
     child: Icon(_isFavorite(meal) ? Icons.star : Icons.star_border), //se for favorita aparece um ícone, se não for já é outro ícone
      onPressed: (){
      onToggleFavorite(meal);//por enquanto é o botão de adicionar como favorito, mas ao clicar nele ele retorna a tela anterior
      }
    ),
    );
  }
}
