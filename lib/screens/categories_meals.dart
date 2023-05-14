import 'package:flutter/material.dart';
import '../models/category.dart';

import '../components/meal_item.dart';
import '../models/meals.dart';
class CategoriesMeals extends StatelessWidget {
 
 final List<Meal> meals;


const CategoriesMeals(this.meals);
  @override
  Widget build(BuildContext context) {
     final category = ModalRoute.of(context)!.settings.arguments as Category; //consegeue pegar argumentos través do contexto,
    final categoryMeals = meals.where((meal) {
      return meal.categories.contains(category.id);
    }).toList(); //lista dss comidas do dummy meals //comidas que pertencem a essa categoria  //caso a comida esteja a lista retornará verdadeiro, caso não, falso.
    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
      ),
      body: ListView.builder(
        itemCount: categoryMeals.length, //quantidade de alimentos que possuo
        itemBuilder: (ctx,  index){
         
          return MealItem(categoryMeals[index]);
        }
      ),
    );
  }
}
