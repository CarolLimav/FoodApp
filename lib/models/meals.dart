import 'package:flutter/foundation.dart';
import 'package:flutter/rendering.dart';


enum Complexity{//complexidade
Simple,
Medium,
Difficult,
}


enum Cost{
  Cheap, //preço barato
  Fair, //custo ok
  Expensive, //custo caro
}


class Meal{
 final String id;
  final List<String> categories;//lista de categorias as quais as comidas estão associadas
  final String title;
  final String imageUrl;
  final List<String> ingredientes; //lista ingredientes
  final List<String> steps; //lista dos passos a passos das receitas
  final int duration; //duração para fazer a comida
  final bool isGlutenFree;
  final bool isLactoseFree;
  final bool isVegan;
  final bool isVegetarian;
  final Complexity complexity;
  final Cost cost;


 const Meal({
  required this.id,
  required this.categories,
  required this.imageUrl,
  required this.title,
  required this.ingredientes,
  required this.steps,
  required this.duration,
  required this.isGlutenFree,
  required this.isLactoseFree,
  required this.isVegan,
  required this.isVegetarian,
  required this.complexity,
  required this.cost,
 });
 
   String get complexityText {//modelo para complexidade da receita
    switch (complexity) {
      case Complexity.Simple:
        return 'Simples';
      case Complexity.Medium:
        return 'Normal';
      case Complexity.Difficult:
        return 'Difícil';
      default:
        return 'Desconhecida';
    }
  }


   
   String get costText {//modelo para complexidade da receita
    switch (cost) {
      case Cost.Cheap:
        return 'Barato';
      case Cost.Fair:
        return 'Justo';
      case Cost.Expensive:
        return 'Caro';
      default:
        return 'Desconhecida';
    }
  }
}
