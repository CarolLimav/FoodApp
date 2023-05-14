import 'package:flutter/material.dart';
import '../utils/app_routes.dart';


class MainDrawer extends StatelessWidget {
 
  Widget _createItem(IconData icon, String label, Function onTap){
   //criei uma função e nomeei
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        label,
        style: TextStyle(
          fontFamily: ' RobotoCondensed',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: (){},
    );
  }


 


  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(children: [
        Container(
          height: 120,
          width: double.infinity,
          padding: EdgeInsets.all(20),
          color: Theme.of(context).colorScheme.secondary,
          alignment: Alignment.bottomRight,


          child: Text(
            'Vamos Cozinhar?',
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 30,
              color: Theme.of(context).primaryColor,
            ),
          ),


        ),
      SizedBox(height: 20,),
      _createItem(Icons.restaurant, 'Refeições',
      () => Navigator.of(context).pushReplacementNamed(AppRoutes.home), //aqui navegará entre as telas
      ),
      _createItem(Icons.settings, 'Configurações',
       () => Navigator.of(context).pushReplacementNamed(AppRoutes.settings),//esse push remove a última e coloca uma nova no local , não acrescenta, apenas substitui
      ),
      ]),


    );
  }
}
