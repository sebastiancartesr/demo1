import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:demo1/controllers/usuario.dart';
import 'package:demo1/controllers/centro.dart';


class VerInfo extends StatefulWidget {
  VerInfo({Key key, this.title}) : super(key: key);


  final String title;

  @override
  _VerInfoState createState() => _VerInfoState();
}

class _VerInfoState extends State<VerInfo> {
  final Centro _centro = new Centro();
  final Usuario _usuario = new Usuario();

  
  @override
  Widget build(BuildContext context) {
    return Container(
      
      child: Scaffold(
        appBar: AppBar(
          title: Text('Informacion'),
          leading: new IconButton(
            icon: new Icon(Icons.arrow_back_sharp),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: Container(
          
          padding: EdgeInsets.only(
            top: 0,
            bottom: 0,
            right: 0,
            left: 0
          ),
        child: Column(
          
          children: <Widget>[
  
             Table(
                      border: TableBorder.all(),
                      
                      columnWidths: {
                      0:FractionColumnWidth(.30),
                      1:FractionColumnWidth(.70),
                      },
                      
                  
                
                children: [            
                  TableRow(children: [
                    TableCell(child: Container ( child: Center(child: Text('Direccion',style: TextStyle(color: Colors.black,fontSize: 25),))),),
                    TableCell(child: Container ( child: Center(child: Text(_centro.direccion,style: TextStyle(color: Colors.black,fontSize: 25),))),),            
                  ]),
                  TableRow(children: [
                    TableCell(
                      child: Center(child: Text('Telefono',style: TextStyle(color: Colors.black,fontSize: 25),)),
                      verticalAlignment: TableCellVerticalAlignment.bottom,
                    ),
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Center(child: Text(_centro.telefono,style: TextStyle(color: Colors.black,fontSize: 25),)),
                    ),

              ]),
                             TableRow(children: [
                    TableCell(
                      child: Center(child: Text('Correo',style: TextStyle(color: Colors.black,fontSize: 25),)),
                      verticalAlignment: TableCellVerticalAlignment.bottom,
                    ),
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Center(child: Text(_centro.correo,style: TextStyle(color: Colors.black,fontSize: 25),)),
                    ),

              ]),
              ],),
              Text("\n"),

                    RaisedButton(
                            color: Colors.grey[200],
                            shape: new RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            onPressed: () {
                               Navigator.pushNamed(context, "/infoverbitacora");
                            },
                            child: SizedBox(
                              width: 100,
                              height: 100,
                              child: Center(
                                child: Text("¿Como registrar bitacora?",
                                    textAlign: TextAlign.center),
                              ),
                            ),
                          ),
                           Text("\n"),
                                              RaisedButton(
                            color: Colors.grey[200],
                            shape: new RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            onPressed: () {
                              Navigator.pushNamed(context, "/selecbitacora");
                            },
                            child: SizedBox(
                              width: 100,
                              height: 100,
                              child: Center(
                                child: Text("¿Como ver bitacoras pasadas?",
                                    textAlign: TextAlign.center),
                              ),
                            ),
                          ),
                           Text("\n"),
                                              RaisedButton(
                            color: Colors.grey[200],
                            shape: new RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            onPressed: () {
                              Navigator.pushNamed(context, "/cambiardatos");
                            },
                            child: SizedBox(
                              width: 100,
                              height: 100,
                              child: Center(
                                child: Text("¿Como cambiar datos personales?",
                                    textAlign: TextAlign.center),
                              ),
                            ),
                          ),
          ]
        ),
        )
      ),
    );

    
    }
}
/*
class InfoBitacora extends StatelessWidget{

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
                        new Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                image: AssetImage("assets/images/fondoindex.jpg"),
                fit: BoxFit.cover,
                ),
              ),
              ),
// login medico

                        new Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                image: AssetImage("assets/images/fondoindex.jpg"),
                fit: BoxFit.cover,
                ),
              ),
              ),
              
          ],
    )));
  }}*/