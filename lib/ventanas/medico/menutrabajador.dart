import 'package:flutter/material.dart';
import 'package:demo1/ventanas/paciente/bitacora.dart';
import 'package:demo1/main.dart';

class MenuTrabajador extends StatefulWidget {
  MenuTrabajador({Key key}) : super(key: key);
  
  @override
  _MenuTrabajadorState createState() => _MenuTrabajadorState();
}

class _MenuTrabajadorState extends State<MenuTrabajador> {

   @override
  Widget build(BuildContext context) {
 return  Scaffold(
        body: Container(
          padding: EdgeInsets.only(
              top: 200,
              bottom: 10,
              right: 10,
              left: 10
            ),
          decoration: BoxDecoration(
              image: DecorationImage(image: new AssetImage("assets/images/menu.png"))
            ),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: RaisedButton(
                            color: Colors.white,
                            shape: new RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            onPressed: () {
                              Navigator.pushNamed(context, '/verpacientes');
                            },
                            child: SizedBox(
                              width: 100,
                              height: 100,
                              child: Center(
                                child: Text("Ver pacientes",
                                    textAlign: TextAlign.center),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),

                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: RaisedButton(
                            color: Colors.white,
                            shape: new RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            onPressed: () {
                              Navigator.pushNamed(context, '/veralertaspaciente');
                            },
                            child: SizedBox(
                              width: 100,
                              height: 100,
                              child: Center(
                                child: Text("Ver Notificaciones",
                                    textAlign: TextAlign.center),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    
                  ],  
                ),
                                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: RaisedButton(
                            color: Colors.white,
                            shape: new RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            onPressed: () {
                              Navigator.pushNamed(context, '/verperfilmedico');
                            },
                            child: SizedBox(
                              width: 100,
                              height: 100,
                              child: Center(
                                child: Text("Ver Perfil",
                                    textAlign: TextAlign.center),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    
                  ],  
                ),
                                
              ],
            ),
          ),
        );
  }
}

