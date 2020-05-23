import 'package:flutter/material.dart';

class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Design", style: TextStyle(fontFamily: 'Signatra', fontSize: 40)),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/img/cover.jpg'),
                fit: BoxFit.cover
              )
            ),
          ),
          Center(
            child: Container(
              height: 100,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.5)
              ),
            )
          ),
          Center(
            child: Text("Practica 1", style: TextStyle(fontFamily: 'Signatra', fontSize: 60, color: Colors.white),),
          )
        ],
      ),
    );
  }
}