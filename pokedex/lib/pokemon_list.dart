import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pokedex/pokedex.dart';
import 'package:http/http.dart' as http;
import 'package:pokedex/pokemon_detail.dart';

class PokemonList extends StatefulWidget {
  @override
  _PokemonListState createState() => _PokemonListState();
}

class _PokemonListState extends State<PokemonList> {
  String url = "https://raw.githubusercontent.com/ingsoto83/fakeapi/master/pokedex.json";
  Pokedex pokedex;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async{
    var response = await http.get(url);
    var decodedJson = jsonDecode(response.body);
    pokedex = Pokedex.fromJson(decodedJson);
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pokedex"),
        backgroundColor: Colors.cyan,
      ),
      drawer: Drawer(),
      body: pokedex==null ? Center(child: CircularProgressIndicator(),) :
      GridView.count(
          crossAxisCount: 2,
          children: pokedex.pokemon.map((p)=> Padding(
            padding: const EdgeInsets.all(2.0),
            child: InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => PokemonDetail(pokemon: p,)));
              },
              child: Hero(
                tag: p.img,
                child: Card(
                  elevation: 3.0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(p.img)
                            )
                        ),
                      ),
                      Text(
                        p.name,
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                      )
                    ],
                  ),
                ),
              ),
            ),
          )).toList(),
      ),
    );
  }
}

