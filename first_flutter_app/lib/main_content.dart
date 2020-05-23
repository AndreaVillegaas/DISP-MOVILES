import 'package:flutter/material.dart';

class MainContent extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("First App"),
      ),
      body: Center(
      child:Container(
        height: 300,
        width: 300,
        child: Center(
          child: Text("Hola", style: TextStyle(fontSize: 100.0,fontFamily: 'Signatra', color: Colors.white),)
        ),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/img/cover.jpg'),
          )
        ),
      )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: Icon(Icons.add),
        backgroundColor: Colors.red,
      ),
    );
  }

  Widget createRow(){
    return Row(//Column ó Row
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text("HOLA", style: TextStyle(fontSize: 30.0, color: Colors.green),),
        Text("ke",style: TextStyle(fontSize: 35.0, color: Colors.purpleAccent),),
        Text("ase",style: TextStyle(fontSize: 40.0, color: Colors.cyan),)
      ],
    );
  }

}