import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import '../components/Category_item.dart';
import '../data/dummy_data.dart';


class CategorieScreen extends StatelessWidget {
  const CategorieScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView(
        padding: const EdgeInsets.all(25), //para não ficar tão grudada as categorias.
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent //sliver quer dizer uma área que tem scroll. Griddelegate é uma forma de pegar como uma grid será renderizada, cross axis é o eixo horizontal
         (
          maxCrossAxisExtent: 200, //Aqui é o tamanho que cada pixel irá receber
        childAspectRatio: 3 /2, //aqui é a proporção de cada um,
        crossAxisSpacing: 20, //espaçamento no eixo cruzado
        mainAxisSpacing: 20, //espaçamento no eixo vertical
        ),
        children: dummyCategories.map((cat){
          return CategoryItem(cat);
        }).toList(),
      );
  }
}
