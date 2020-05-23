import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'models/planet.dart';

class PlanetCard extends StatelessWidget {
  const PlanetCard({@required this.planet});
  final Planet planet;

  @override
  Widget build(BuildContext context) {
    final baseTextStyle = GoogleFonts.poppins();
    final headerTextStyle = baseTextStyle.copyWith(
        color: Colors.white,
        fontSize: 18.0,
        fontWeight: FontWeight.w600
    );
    final regularTextStyle = baseTextStyle.copyWith(
        color: Color(0xffb6b2df),
        fontSize: 9.0,
        fontWeight: FontWeight.w400
    );
    final subHeaderTextStyle = regularTextStyle.copyWith(
        fontSize: 12.0
    );
    final planetCardContent = new Container(
      margin: new EdgeInsets.fromLTRB(76.0, 8.0, 16.0, 8.0),
      constraints: new BoxConstraints.expand(),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Container(height: 4.0),
          new Text(planet.name,
            style: headerTextStyle,
          ),
          new Container(height: 10.0),
          new Text(planet.location,
              style: subHeaderTextStyle

          ),
          new Container(
              margin: new EdgeInsets.symmetric(vertical: 8.0),
              height: 2.0,
              width: 18.0,
              color: new Color(0xff00c6ff)
          ),
          new Row(
            children: <Widget>[
              new Image.asset("assets/img/ic_distance.png", height: 12.0),
              new Container(width: 8.0),
              new Text(planet.distance,
                style: regularTextStyle,
              ),
              new Container(width: 24.0),
              new Image.asset("assets/img/ic_gravity.png", height: 12.0),
              new Container(width: 8.0),
              new Text(planet.gravity,
                style: regularTextStyle,
              ),
            ],
          ),
        ],
      ),
    );

    return Container(
      height: 120.0,
      margin: const EdgeInsets.symmetric(
        vertical: 16.0,
        horizontal: 24.0,
      ),
      child: Stack(
        children: <Widget>[
          Container(
            height: 128.0,
            child: planetCardContent,
            margin: EdgeInsets.only(left: 46.0),
            decoration: BoxDecoration(
                color: Color(0xFF434273),
                shape: BoxShape.rectangle,
                borderRadius: new BorderRadius.circular(8.0),
                boxShadow: <BoxShadow>[
                  new BoxShadow(
                      color: Colors.black12,
                          blurRadius: 10.0,
                          offset: new Offset(0.0, 10.0),
                      ),
                ]
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(
              vertical: 16.0
            ),
            alignment: FractionalOffset.centerLeft,
            child: Image(
              image: AssetImage(planet.image),
              height: 92.0,
              width: 92.0,
            )
          ),

        ],
      ),
    );
  }
}
