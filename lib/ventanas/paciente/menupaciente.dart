import 'package:flutter/material.dart';
import 'package:demo1/ventanas/paciente/bitacora.dart';
import 'package:demo1/main.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:demo1/controllers/usuario.dart';

class Menup extends StatefulWidget {
  Menup({Key key}) : super(key: key);
  
  @override
  _MenupState createState() => _MenupState();
}
//------------------------------------------------------------------------

class _MenupState extends State<Menup> {
  final Usuario _usuario = new Usuario();
  DateTime _dateTime= DateTime.now();
  String _splitter(String _sfecha) {
    try {
      List a = (_sfecha.split(" "));
      String auxC = a[0];
      List b = (auxC.split("-"));
      String fecha = (b[2] + "/" + b[1] + "/" + b[0]).toString();
      //<{'','',''}>
      print(fecha);
      return auxC;
    } catch (e) {
      print(e);
    }
  }
      Future <List> regbitacora() async{
      
      final response = await http.post("http://192.168.1.108/demo1/regbitacora.php", body:{
      "IdPaciente":_usuario.id.toString(),
      "DataIni":_splitter(_dateTime.toString()),
      });
      var datauser = json.decode(response.body);
      print('paso1');

      if(datauser.length == 0){
        print('paso2');
        Navigator.pushNamed(context, '/bitacora');
      }else{
        print('paso3');
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Ya has ingresado bitacoras el dia de hoy.'),
            actions:<Widget>[
              
              RaisedButton(onPressed: (){
                Navigator.of(context).pop();
              },
               child: Text('Aceptar'))
            ],),
        );          
      }
    return datauser;
    }
  
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
                              regbitacora();
                            },
                            child: SizedBox(
                              width: 100,
                              height: 100,
                              child: Center(
                                child: Text("Registrar Bitacora",
                                    textAlign: TextAlign.center),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: RaisedButton(
                            color: Colors.white,
                            shape: new RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            onPressed: () {
                              Navigator.pushNamed(context, '/vernotificacion');
                            },
                            child: SizedBox(
                              width: 100,
                              height: 100,
                              child: Center(
                                child: Text("Notificaciones",
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
                              Navigator.pushNamed(context, '/datapicker');
                            },
                            child: SizedBox(
                              width: 100,
                              height: 100,
                              child: Center(
                                child: Text("Visualizar bitacoras",
                                    textAlign: TextAlign.center),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: RaisedButton(
                            color: Colors.white,
                            shape: new RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            onPressed: () {
                              Navigator.pushNamed(context, '/veralertas');
                            },
                            child: SizedBox(
                              width: 100,
                              height: 100,
                              child: Center(
                                child: Text("Alertas",
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
                              Navigator.pushNamed(context, '/verperfil');
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
                    Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: RaisedButton(
                            color: Colors.white,
                            shape: new RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            onPressed: () {},
                            child: SizedBox(
                              width: 100,
                              height: 100,
                              child: Center(
                                child: Text("Informacion",
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