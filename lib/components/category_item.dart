import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import '../models/category.dart'; //aqui pq eu vou receber uma categoria como modelo
import '../utils/app_routes.dart';


class CategoryItem extends StatelessWidget {


  final Category category; //constante definida como category que chamada categoria


  const CategoryItem(this.category); //construtor que vai apenas receber categoria


  void _selectCategory(BuildContext context){//fiz esse primeiro mas depois foi excluído
    //Navigator.of(context).push(MaterialPageRoute(//essa parte é onde a tela será chamada
    //builder: (_){
      //return CategoriesMeals(category); //passando informações via construtor
    //}
    //),
    //);
    Navigator.of(context).pushNamed( //vou querer chamar uma rota nomeada
      AppRoutes.categoriesMeals,
      arguments:  category,    //o que passo aqui é o mesmo que está sendo consumido em mealsscreen   //argumentos que quero passar para minha rota
     
    );        
  }


  @override
  Widget build(BuildContext context) {
    return InkWell(// o inkweel serve para ter um feedback qunado o usuário clicar
    onTap: () => _selectCategory(context)//serve para quando eu criar uma função que será chamada quando o usuário clicar
,
    splashColor: Theme.of(context).primaryColor, //definir a cor do clique
     borderRadius: BorderRadius.circular(15), //border radius para as bordas do botão ficarem de acordo
      child: Container(
        padding: EdgeInsets.all(15),//para o texto não ficar tão desorganizado
        child: Text(
          category.title,
          style: Theme.of(context).textTheme.titleMedium,
          ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), //borda associada ao box decoration
          gradient: LinearGradient(
            colors: [
              category.color.withOpacity(0.5),
              category.color,
            ],
            begin: Alignment.topLeft,// decoração vai ficar com um pouco de opacidadde
            end: Alignment.bottomRight, //
          ),
        ),
      ),
    );
  }
}
