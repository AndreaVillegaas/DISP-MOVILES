import 'package:flutter/material.dart';

class PlacePage extends StatefulWidget{
  bool liked = true;
  @override
  State<StatefulWidget> createState()=> new PlacePageState();
}

class PlacePageState extends State<PlacePage>{

  @override
  Widget build(BuildContext context) {

    Widget title = Container(
        padding: EdgeInsets.all(32),
        child: Row(
          children: <Widget>[
            Expanded(
                child:Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("Canales Tóxicos de Xochimilco",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        )
                    ),
                    Container(
                        margin: EdgeInsets.only(top:8),
                        child: Text(
                          "Xochimilco, CDMX, México",
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey[500]
                          ),
                        )
                    )
                  ],
                )
            ),
            Icon(widget.liked? Icons.favorite : Icons.favorite_border, color: Colors.red,),
            Text("41")
          ],
        )
    );
    Widget buttons = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        _buildButtonsColumn(Colors.blue, Icons.call, "CALL"),
        _buildButtonsColumn(Colors.blue, Icons.near_me, "ROUTE"),
        _buildButtonsColumn(Colors.blue, Icons.share, "SHARE"),
      ],
    );
    Widget description = Container(
      padding: EdgeInsets.all(32),
      child: Text(
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit,'
            'sed do eiusmod tempor incididunt ut labore et dolore magna'
            'aliqua. Ut enim ad minim veniam, quis nostrud exercitation '
            'ullamco laboris nisi ut aliquip ex ea commodo consequat.'
            'Duis aute irure dolor in reprehenderit in voluptate velit'
            'esse cillum dolore eu fugiat nulla pariatur. Excepteur '
            'sint occaecat cupidatat non proident, sunt in culpa qui '
            'officia deserunt mollit anim id est laborum.'
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit,'
            'sed do eiusmod tempor incididunt ut labore et dolore magna'
            'aliqua. Ut enim ad minim veniam, quis nostrud exercitation '
            'ullamco laboris nisi ut aliquip ex ea commodo consequat.'
            'Duis aute irure dolor in reprehenderit in voluptate velit'
            'esse cillum dolore eu fugiat nulla pariatur. Excepteur '
            'sint occaecat cupidatat non proident, sunt in culpa qui '
            'officia deserunt mollit anim id est laborum.'
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit,'
            'sed do eiusmod tempor incididunt ut labore et dolore magna'
            'aliqua. Ut enim ad minim veniam, quis nostrud exercitation '
            'ullamco laboris nisi ut aliquip ex ea commodo consequat.'
            'Duis aute irure dolor in reprehenderit in voluptate velit'
            'esse cillum dolore eu fugiat nulla pariatur. Excepteur '
            'sint occaecat cupidatat non proident, sunt in culpa qui '
            'officia deserunt mollit anim id est laborum.',
        softWrap: true,
      ),
    );
    Widget bodyPortrait = ListView(
      children: <Widget>[
        Image.asset(
          'assets/img/header.jpg',
          height: 240,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        title,
        buttons,
        description
      ],
    );
    Widget bodyLandscape = Row(
      children: <Widget>[
        Image.asset(
          'assets/img/header.jpg',
          height: MediaQuery.of(context).size.height,
          width: 320,
          fit: BoxFit.cover,
        ),
        Expanded(
          child: ListView(
            children: <Widget>[
              title,
              buttons,
              description
            ],
          ),
        )
      ],
    );


    return Scaffold(
      appBar: AppBar(
        title: Text("Places"),
      ),
      body: OrientationBuilder(
        builder: (context, orientation){
          return
            orientation == Orientation.portrait ? bodyPortrait : bodyLandscape;
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          setState(() {
            widget.liked = !widget.liked;
            print(widget.liked);
          });
        },
        backgroundColor: Colors.red,
        child: Icon(Icons.favorite, color: Colors.white,),
      ),
    );
  }

  Widget _buildButtonsColumn(Color color, IconData icon, String label){
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Icon(icon,color: color,),
        Container(
            margin: EdgeInsets.only(top:8),
            child: Text(label,style: TextStyle(color: color))
        )
      ],
    );
  }

}