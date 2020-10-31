import 'package:demo1/ventanas/paciente/bitacora.dart';
import 'package:demo1/ventanas/paciente/menupaciente.dart';
import 'package:demo1/ventanas/medico/menutrabajador.dart';
import 'package:flutter/material.dart';
import 'package:demo1/login/loginpaciente.dart';
import 'package:demo1/login/loginmedico.dart';
import 'package:demo1/ventanas/paciente/datapicker.dart';
import 'package:flutter/services.dart';
import 'package:demo1/ventanas/paciente/verbitacora.dart';
import 'package:demo1/ventanas/paciente/verperfil.dart';
import 'package:demo1/ventanas/paciente/listarnotificaciones.dart';
import 'package:demo1/ventanas/paciente/listarAlertas.dart';
import 'package:demo1/ventanas/medico/verbitacora.dart';
import 'package:demo1/ventanas/medico/verpacientes.dart';
import 'package:demo1/ventanas/medico/verperfilmedico.dart';
import 'package:demo1/ventanas/medico/veralertaspaciente.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        "/inicio" : (BuildContext context) => Inicio(),
        "/loginpaciente" : (BuildContext context) => Loginpaciente(),
        "/loginmedico" : (BuildContext context) => Loginmedico(),
        "/menup" : (BuildContext context) => Menup(),
        "/bitacora":(BuildContext context) => Bitacora(),
        "/menutrabajador":(BuildContext context) => MenuTrabajador(),
        "/datapicker":(BuildContext context) => DataPicker(),
        "/verbitacora":(BuildContext context) => VerBitacora(),
        "/verperfil":(BuildContext context) => VerPerfil(),
        "/vernotificacion":(BuildContext context) => ListarNotificaciones(),
        "/veralertas":(BuildContext context) => ListarAlertas(),
        "/verbitacoramedico":(BuildContext context) => VerBitacoramedico(),
        "/verpacientes":(BuildContext context) => VerPaciente(),
        "/verperfilmedico":(BuildContext context) =>VerPerfilmedico(),
        "/veralertaspaciente":(BuildContext context) =>VerAlertasPaciente(),
      }
      ,
      home: Inicio()
    );
  }
}


class Inicio extends StatelessWidget{

  final PageController control = PageController();
  @override
  
  Widget build(BuildContext context){
    return new Container(
       child: new Scaffold(
        body: new PageView(
          scrollDirection: Axis.horizontal,
          controller: control,
          children: [
// slider 1 bienvenida

            new Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                image: AssetImage("assets/images/fondoindex.jpg"),
                fit: BoxFit.cover,
                ),
              ),
              ),
// slider 2 login paciente
            Container(
                decoration: BoxDecoration(
                image: DecorationImage(
                image: AssetImage("assets/images/fondo.png"),
                fit: BoxFit.cover,
                ),
              ),
              child: Column( 
                children: [
                  new Container(               
                    decoration: BoxDecoration(
                  image: DecorationImage(
                  image: AssetImage("assets/images/fondo.png"),
                  fit: BoxFit.cover,
                  ),
                ),
                    padding: EdgeInsets.only(
                    top: 100,
                    bottom: 190,
                    right: 50,
                    left: 50
                  ),
                  child: new Text('Si eres paciente ingresa aqui', style: TextStyle(fontSize: 40),),
                  ),
                  new Container(
                    decoration: BoxDecoration(
                    image: DecorationImage(
                    image: AssetImage("assets/images/fondo.png"),
                    fit: BoxFit.cover,
                      ),
                    ),
                    padding: EdgeInsets.only(
                      top: 100,
                      bottom: 52,
                      right: 60,
                      left: 60
                      ),
                    child: RaisedButton(
                      color: Colors.white,
                      shape: new RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/loginpaciente');
                      },
                      child: SizedBox(
                        width: 230,
                        height: 90,
                        child: Center(
                          child: Text("Ingresar",
                            style: TextStyle(fontSize: 25.0),
                            textAlign: TextAlign.center),
                          ),
                        ),
                      ),
                  ),
                ],
              ),
            ),
// login medico
            new Container( 
                decoration: BoxDecoration(
                image: DecorationImage(
                image: AssetImage("assets/images/fondo.png"),
                fit: BoxFit.cover,
                ),
              ),
              child: Column( 
                children: [
                  new Container(               
                    decoration: BoxDecoration(
                  image: DecorationImage(
                  image: AssetImage("assets/images/fondo.png"),
                  fit: BoxFit.cover,
                  ),
                ),
                    padding: EdgeInsets.only(
                    top: 100,
                    bottom: 190,
                    right: 50,
                    left: 50
                  ),
                  child: new Text('Si eres medico ingresa aqui', style: TextStyle(fontSize: 40),),
                  ),
                  new Container(
                                      decoration: BoxDecoration(
                  image: DecorationImage(
                  image: AssetImage("assets/images/fondo.png"),
                  fit: BoxFit.cover,
                  ),
                ),
                    padding: EdgeInsets.only(
                    top: 100,
                    bottom: 52,
                    right: 60,
                    left: 60
                  ),
                  child: RaisedButton(
                    color: Colors.white,
                    shape: new RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/loginmedico');
                        
                      },
                      child: SizedBox(
                        width: 230,
                        height: 90,
                        child: Center(
                          child: Text("Ingresar",
                            style: TextStyle(fontSize: 25.0),
                            textAlign: TextAlign.center),
                          ),
                        ),
                      ),
                  ),
                ],
              ),
            ),
          ],
    )));
  }}

  

// =>
// <> 