import 'package:flutter/material.dart';

class Category {
final String id;
final String title;
final Color color;

const Category({
this.color = Colors.orange,
required this.id,
required this.title,
});
}

//aqui nessa pasta eu criei uma classe com os atributos das categorias, criei um construtor requerido e constante pois são atributos que não irão se modificar.
