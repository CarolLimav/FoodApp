import 'package:flutter/material.dart';
import '../components/main_drawer.dart';
import '../models/settings.dart';


class SettingsScreen extends StatefulWidget {


  final Settings settings;
 


  final Function(Settings) onSettingsChanged;


  SettingsScreen(this.settings, this.onSettingsChanged);


  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}


class _SettingsScreenState extends State<SettingsScreen> {


late Settings settings;


@override
  void initState() {
    super.initState();
    settings = widget.settings;
  }


  Widget _createSwwitch
(String title,
String subtitle,
 bool value,
  Function(bool) onChanged,
  ){
    return SwitchListTile.adaptive(
     title: Text(title),
     subtitle: Text(subtitle),
      value: value,
      onChanged: (value){
        onChanged(value);
        widget.onSettingsChanged(settings);
      },
      );
 }


  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: AppBar(
        title: Text('Configurações'),
      ),
    drawer: MainDrawer(),


    body: Column(children: [
      Container(
        padding: EdgeInsets.all(20),
        child: Text(
          'Configurações',
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
      Expanded(
        child: ListView(children: [
          _createSwwitch(
            'Sem Glutén',
           'Só exibe refeições sem glúten',
           settings.isGlutenFree,
            (value)=> setState(()=> settings.isGlutenFree = value ),
            ),
              _createSwwitch(
            'Sem Lactose',
           'Só exibe refeições sem lactose',
           settings.isLactoseFree,
            (value)=> setState(()=> settings.isLactoseFree = value ),
            ),
             _createSwwitch(
            'Vegana',
           'Só exibe refeições veganas',
           settings.isVegan,
            (value)=> setState(()=> settings.isVegan = value ),
            ),
             _createSwwitch(
            'Vegetariana',
           'Só exibe refeições vegetarianas',
           settings.isVegetarian,
            (value)=> setState(()=> settings.isVegetarian = value ),
            )
        ],),
        )
    ],)
    );
  }
}
