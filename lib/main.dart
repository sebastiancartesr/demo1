import 'package:demo1/controllers/provider.dart';
import 'package:demo1/controllers/push_notification_provider.dart';
import 'package:demo1/login/newloginmedico.dart';
import 'package:demo1/login/newloginpaciente.dart';
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
import 'package:demo1/ventanas/paciente/verbitacoraprueba.dart';
import 'package:demo1/ventanas/paciente/verbitacoras.dart';
import 'package:demo1/ventanas/medico/elegirbitacoramedico.dart';
import 'package:demo1/ventanas/medico/verbitacorapruebamedico.dart';
import 'package:demo1/ventanas/paciente/informacion.dart';
import 'package:demo1/ventanas/paciente/Infoverbitacora.dart';
import 'package:demo1/ventanas/paciente/cambiardatos.dart';
import 'package:demo1/ventanas/paciente/infoseleccionarbitacora.dart';
import 'package:demo1/ventanas/paciente/pruebanotificacion.dart';
//import 'package:flutter_driver/driver_extension.dart';

void main() => runApp(MyApp());

// f4_DAiwRTtCDS9aJIEYtev:APA91bGu-NY0knJ9UP3rbV0rpH7SukKTfoi_q-psFGnyIC12pH0TT-2LeBEamEbF7FLBEC9ZrEQYX0EC34VvAsYrfBrMcfvA-UMB2NTkWX-U35o9EQIrvRBWG6IEcQx27xubbOjwtvp1

class MyApp extends StatefulWidget{
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() { 
    super.initState();

    final pushProvider = new PushNotificationsProvider();
    pushProvider.initNotifications();
    
  }


  @override
  Widget build(BuildContext context){
    return Provider(
      child: MaterialApp(
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
        "/verbitacoraprueba":(BuildContext context) =>DataPickerprueba(),
        "/elegirbitacora":(BuildContext context) =>ElegirBitacora(),
        "/elegirbitacoramedico":(BuildContext context) =>ElegirBitacoramedico(),
        "/verpacientesdos":(BuildContext context) =>VerPacientedos(),
        "/verinfo":(BuildContext context) =>VerInfo(),
        "/infoverbitacora":(BuildContext context) =>InfoBitacora(),
        "/cambiardatos":(BuildContext context) =>CambiarDatos(),
        "/selecbitacora":(BuildContext context) =>InfoSeleccionarBitacora(),
        "/pruebaxd":(BuildContext context)=>Pruebaxd(),
        "/loginconvalidador":(BuildContext context)=>LoginPage(),
        "/loginconvalidadorpaciente":(BuildContext context)=>LoginPagePaciente(),
      }
      ,
      home: Inicio()
    ),

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
            Scaffold(            
              body: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                image: AssetImage("assets/images/fondoindex.jpg"),
                fit: BoxFit.cover,
                ),
              ),
            ),),

// slider 2 login paciente

Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image:AssetImage('assets/images/fondopaciente.jpg'),
            fit: BoxFit.cover,
            ),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Color.fromRGBO(189, 219, 255, 0.8),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(30.0),
                  child: Text(
                    'Ingresar como \n Paciente',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color:Colors.black.withOpacity(1),
                      fontWeight: FontWeight.bold,
                      fontSize: 40.0,
                      fontFamily: "Poppins"
                    ),
                  ),
                ),
                SizedBox(height: 80.0),
                RaisedButton(
                      color: Colors.white,
                      
                      shape: new RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0)),
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/loginconvalidadorpaciente');
                      },
                      child: SizedBox(
                        width: 200,
                        height: 70,
                        child: Center(
                          child: Text("Ingresar",
                            style: TextStyle(fontSize: 25.0),
                            textAlign: TextAlign.center),
                          ),
                      ),
                      ),
              ],
            ),
          ),
        ),
      ),
    ),
// login medico
Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image:AssetImage('assets/images/fondopaciente2.jpg'),
            fit: BoxFit.cover,
            ),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Color.fromRGBO(189, 219, 255, 0.8),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(30.0),
                  child: Text(
                    'Ingresar como \n Médico',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color:Colors.black.withOpacity(1),
                      fontWeight: FontWeight.bold,
                      fontSize: 40.0,
                      fontFamily: "Poppins"
                    ),
                  ),
                ),
                SizedBox(height: 80.0),
                RaisedButton(
                      color: Colors.white,
                      
                      shape: new RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0)),
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/loginconvalidador');
                      },
                      child: SizedBox(
                        width: 200,
                        height: 70,
                        child: Center(
                          child: Text("Ingresar",
                            style: TextStyle(fontSize: 25.0),
                            textAlign: TextAlign.center),
                          ),
                      ),
                      ),
              ],
            ),
          ),
        ),
      ),
    ),
/*
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
                       // Navigator.pushReplacementNamed(context, '/loginmedico');
                         Navigator.pushReplacementNamed(context, '/loginconvalidador');
                        
                        
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
            ),*/
          ],
    )));
  }}

  

// =>
// <> 