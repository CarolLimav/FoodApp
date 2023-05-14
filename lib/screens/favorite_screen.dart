import 'package:flutter/material.dart';
import '../models/meals.dart';
import '../components/meal_item.dart';
class FavoriteScreen extends StatelessWidget {
 final List<Meal> favoriteMeals;
 const FavoriteScreen(this.favoriteMeals, _favoriteMeals);
  @override
  Widget build(BuildContext context) {
if(favoriteMeals.isEmpty){
   return Center( //cada tela foi construída com Scaffold, essa irá utilizar outro componente
      child: Text(
        'Nenhuma refeição foi marcada como favorita!'
      ),
    );
    }else{
      return ListView.builder(
        itemCount: favoriteMeals.length,
        itemBuilder: (ctx,index) {
          return MealItem(favoriteMeals[index]);
        },
       );
    }
  }
}
