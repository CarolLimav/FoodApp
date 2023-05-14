
import 'package:flutter/material.dart';

import '../screens/categories_meals.dart';
import 'utils/app_routes.dart';
import '../screens/meal_detail_screen.dart';
import '../screens/tabs_screen.dart';
import '../screens/setting_screen.dart';
import 'models/meals.dart';
import '../data/dummy_data.dart';
import '../models/settings.dart';
void main() => runApp(MyApp());
 
class MyApp extends StatefulWidget {  @override
  State<MyApp> createState() => _MyAppState();
}


class _MyAppState extends State<MyApp> {


  Settings settings = Settings();//aqui é pra persistir as configurações ao sair da tela.
//converti myapp por stateful


List<Meal> _availablemeals = dummyMeals;//lista que irá receber apenas as comidas disponíveis
final List<Meal> _favoriteMeals = [];
void _filterMeals(Settings settings){
  setState(() {
    this.settings = settings;
    _availablemeals =  dummyMeals.where((Meal) {
      final filterGluten = settings.isGlutenFree && !Meal.isGlutenFree; //filtro foi acionado e a comida não estará presente no produto final
      final filterLactose = settings.isLactoseFree && !Meal.isLactoseFree; //se o usuário marcar que não quer comida com lactose e a comida não é livre de lactose significa que ele irá filtrar essa comida por conta da lactose.
      final filterVegan = settings.isVegan && !Meal.isVegan;
      final filterVegetarian = settings.isVegetarian && !Meal.isVegetarian;
      return !filterGluten && !filterLactose && !filterVegan && !filterVegetarian;  //retornar caso o filtro de glúten não seja verrdadeiro e o filtro de lactose não for verdadeiro e, e o filtro vegano não for verdadeiro tmb e o filtro de vegetariano não estiver verdadeiro.
    }).toList();
  });
}


void _toggleFavorite (Meal meal){
setState(() {
  _favoriteMeals.contains(meal ) ? _favoriteMeals.remove(meal) : _favoriteMeals.add(meal);
});
}




bool _isFavorite(Meal meal){
    return  _favoriteMeals.contains(meal);
  }
  @override
  Widget build(BuildContext context) {


    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Colors.pink,
          secondary: Colors.amber,
        ),
        canvasColor: Color.fromRGBO(255, 254, 229, 1), //para ficar com um tom mais amarelado no fundo
        fontFamily: 'Raleway',
         textTheme: ThemeData.light().textTheme.copyWith(
              headline6: const TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
        ),
       ),
      ),
      //home: CategorieScreen(),//home principal
    //  initialRoute:                                , //rota inicial da aplicação, se eu não quiser colocar da forma abaixo, assim como posso colocar como acima
      routes: {
       AppRoutes.home: (ctx) => TabsScreen(_favoriteMeals),
        // AppRoutes.HOME: (context) => CategorieScreen(),//ao invés de utilizar o home acima posso colocar uma rota principal aqui
       AppRoutes.categoriesMeals: (ctx) => CategoriesMeals(_availablemeals),//essa rota criada vai retornar esse componente; o available meals é o filtro das preferidas  
        AppRoutes.mealDetail: (ctx) => MealDetailScreen(_toggleFavorite, _isFavorite),
        AppRoutes.settings: (ctx) => SettingsScreen(settings, _filterMeals),
      },
      // onGenerateRoute: (settings) {//método para utilizar se quiser criar rotas dinâmicas
      //   if(settings.name == '/alguma-coisa'){
      //     return null;
      //   } else if(settings.name == 'outra coisa'){
      //     return null;
      //   }
      //   else {
      //     return MaterialPageRoute(builder: (_){//aqui caso nao apareça o routes acima ele irá retornar essa parte
      //       return CategorieScreen();
      //     });
      //   }
      // },
      // onUnknownRoute: (settings){
      //    return MaterialPageRoute(builder: (_){//aqui caso nao apareça o routes acima ele irá retornar essa parte
      //       return CategorieScreen();
      //     });
      // },
    );
  }
}
