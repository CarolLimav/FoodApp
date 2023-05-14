import 'package:flutter/material.dart';
import '../models/meals.dart';
import '../screens/categoria_screen.dart';
 //essa tela controla a navegação usando tabs
import '../components/main_drawer.dart';

class TabsScreen extends StatefulWidget {///comecei com stateless mas mudei para stateful pq ele vai ter estado
 
  final List<Meal> favoriteMeals;
  const TabsScreen(this.favoriteMeals);
  @override
  State<TabsScreen> createState() => _TabsScreenState();
}
class _TabsScreenState extends State<TabsScreen> {

  int _selectedScreenIndex = 0;
  List<Map<String, Object>>? _screens;
  @override
  void initState(){
    super.initState();
    _screens = [
   {
    'title': 'Lista de Categorias', 
    'screen': CategorieScreen(),
    },
   {
    'title': 'Meus favoritos ', 
    // 'screen': FavoriteScreen(widget.favoriteMeals), 
    // 'screen': FavoriteScreen(widget.favoriteMeals),
   },

  ];
  }
  _selectScreen(int index ) //recebendo como parâmetro
  {
    setState(() {
      _selectedScreenIndex = index;  //alterar baseado no indice que recebi
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _screens![_selectedScreenIndex]['title'] as String
          ),
      ),
      drawer: MainDrawer(),//icone de configurações que fica ao lado da tela
     body: _screens![_selectedScreenIndex]['screen'] as Widget, //vai navegar de uma tela para outra
     bottomNavigationBar: BottomNavigationBar(
      onTap: _selectScreen, //chamando o método
      backgroundColor: Theme.of(context).primaryColor,
      unselectedItemColor: Colors.white,
      //selectedItemColor: Theme.of(context).accentColor,
      currentIndex: _selectedScreenIndex , //propriedade pra acender qual está selecionado na parte de categorias e favoritos ,
      // type: BottomNavigationBarType.shifting, //animção da navegação de categorias e favoritos (caso eu quisesse, deixei o fixado);
      items: [
        BottomNavigationBarItem(
          // backgroundColor: Theme.of(context).primaryColor,
          icon: Icon(Icons.category),
          label: 'Categorias'
         ),
         BottomNavigationBarItem(
          // backgroundColor: Theme.of(context).primaryColor,
          icon: Icon(Icons.star),
          label: 'Favoritos'
         )
      ]
      ),
    );
  }
}
