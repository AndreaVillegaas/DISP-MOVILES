import 'package:design_app/place_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState()=> new _LoginPageState();

}
class _LoginPageState extends State<LoginPage>{
  @override
  String _user;
  String _password;
  final formkey = GlobalKey<FormState>();
  final scaffoldkey = GlobalKey<ScaffoldState>();

  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      key: scaffoldkey,
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: ListView(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 60),
                child: FlutterLogo(size: 100,),
              ),
              Padding(
                padding: EdgeInsets.only(top: 16),
                child: Text(
                  "TravelApp",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.pacifico(
                    textStyle: TextStyle(
                        fontSize: 54,
                        fontWeight: FontWeight.w700,
                        color: Colors.blue
                    )
                  )
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: Text(
                  "Welcome",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.blue[500],
                    fontSize: 24,
                    fontWeight: FontWeight.w500
                  ),
                ),
              ),
              Form(
                key: formkey,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 16, left: 8, right: 8),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                              width: 300,
                              child: Material(
                                  elevation: 5.0,
                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                  color: Colors.blue,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Padding(
                                        padding: EdgeInsets.all(12.0),
                                        child: Icon(Icons.account_circle, color: Colors.white,),
                                      ),
                                      Container(
                                        width: 250,
                                        height: 60,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(10),
                                                bottomRight: Radius.circular(10)
                                            )
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.all(8),
                                          child: TextFormField(
                                            validator: (value) => value.isEmpty ? "Usuario es obligatorio": null,
                                            onSaved: (value) => _user = value,
                                            style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.black
                                            ),
                                            decoration: InputDecoration(
                                                border: InputBorder.none,
                                                hintText: "Usuario",
                                                fillColor: Colors.white,
                                                filled: true
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  )
                              )
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 16, left: 8, right: 8),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                              width: 300,
                              child: Material(
                                  elevation: 5.0,
                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                  color: Colors.blue,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Padding(
                                        padding: EdgeInsets.all(12.0),
                                        child: Icon(Icons.vpn_key, color: Colors.white,),
                                      ),
                                      Container(
                                        width: 250,
                                        height: 60,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(10),
                                                bottomRight: Radius.circular(10)
                                            )
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.all(8),
                                          child: TextFormField(
                                            obscureText: true,
                                            validator: (value) => value.toString().isEmpty ? "Contraseña es obligatoria": null,
                                            onSaved: (value) => _password = value,
                                            style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.black
                                            ),
                                            decoration: InputDecoration(
                                                border: InputBorder.none,
                                                hintText: "Contraseña",
                                                fillColor: Colors.white,
                                                filled: true
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  )
                              )
                          )
                        ],
                      ),
                    ),
                  ],
                )
              ),
              Padding(
                padding: EdgeInsets.only(top:20, left: 8,right: 8),
                child: Container(
                  width: 300,
                  height: 130,
                  padding: EdgeInsets.all(40),
                  child: RaisedButton(
                    onPressed: (){
                      final form = formkey.currentState;
                      if(form.validate()){
                        form.save();
                        if(_user=="alejandro" && _password=="soto123"){
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder:(context)=> PlacePage()
                              )
                          );
                        }else{
                          scaffoldkey.currentState.showSnackBar(SnackBar(
                            content: Text("Usuario y/o contraseña erronea!"),
                          ));
                        }
                      }
                      //Para sacar la última ruta:  Navigator.pop(context);
                    },
                    elevation: 5,
                    color: Colors.blue,
                    child: Text(
                        "Entrar",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18
                      ),
                    ),
                  )
                ),
              )
            ],
          )
      )
    );
  }

}