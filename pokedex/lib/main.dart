import 'package:flutter/material.dart';
import 'package:pokedex/pokemon_list.dart';

void main(){
  runApp(MaterialApp(
    title: "Pokedex App",
    home: PokemonList(),
    debugShowCheckedModeBanner: false,
  ));
}