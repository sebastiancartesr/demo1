import 'package:demo1/login/loginmedico.dart';
import 'package:flutter/material.dart';
import 'package:demo1/login/loginpaciente.dart';
import 'package:demo1/controllers/usuario.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:demo1/controllers/bitacoraController.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'dart:async';

class Bitacora extends StatefulWidget {
  Bitacora({Key key}) : super(key: key);
  

  @override
  _BitacoraState createState() => _BitacoraState();
}

class _BitacoraState extends State<Bitacora> {
  final BitacoraController _bitacora= new BitacoraController();
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

    showNotification() async {
      print('prueba????');
    var android = new AndroidNotificationDetails(
        'id', 'channel ', 'description',
        priority: Priority.High, importance: Importance.Max);
    var iOS = new IOSNotificationDetails();
    var platform = new NotificationDetails(android, iOS);
    await flutterLocalNotificationsPlugin.show(
        0, 'Alerta', _bitacora.mensaje, platform,
        payload: 'Welcome to the Local Notification demo ');
  }

//conexión microservicio Flask Machine Learning
  Future <List> respuesta() async{
      Map<String,String> headers = {
  'Content-type' : 'application/json', 
  'Accept': 'application/json',
};
      
      final response = await http.post("http://10.0.2.2:36574/predict", body:
        json.encode({"bitacora":[_nauseas,_vomito,_diarrea,_constipacion,_dolor,_fatiga,_perdidaapetito,(_fiebre).round(),_sintomaresfrio,_sintomasunitarios,_valoricg]})
      ,headers:headers
      
      );
      print(response);
      var datauser = json.decode(response.body);
   
        setState(() {    
          _bitacora.alerta= (datauser['name']).round();

      });

      enviaralerta();

    return datauser;
}
void setmensaje(){
  if (_bitacora.alerta==0){
        setState(() {
          _bitacora.mensaje="Te encuentras bien de momento.";
      });


  }
  else if(_bitacora.alerta==1){
            setState(() {
          _bitacora.mensaje="Siga las indicaciones de alta.";
      });

  }
    else if(_bitacora.alerta==2){
                 setState(() {
          _bitacora.mensaje="Siga regimen.";
      });


  }
    else if(_bitacora.alerta==3){
                 setState(() {
          _bitacora.mensaje="Controle temperatura.";
      });


  }
    else if(_bitacora.alerta==4){
                 setState(() {
          _bitacora.mensaje="Avise a las enfermeras.";
      });


  }
    else if(_bitacora.alerta==5){
                 setState(() {
          _bitacora.mensaje="Adelante control medico.";
      });


  }
    else if(_bitacora.alerta==6){
                 setState(() {
          _bitacora.mensaje="Avise a las enfermeras y adelante su control médico.";
      });


  }
    else{
        setState(() {
          _bitacora.mensaje="Vaya a servicio de urgencia.";
      });


  }
}

void enviaralerta(){

  int aux=_bitacora.alerta;
  setmensaje();
  enviaralertaphp();
  if (aux==0){ 
            showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Te encuentras bien de momento.'),
            actions:<Widget>[
              
              RaisedButton(onPressed: (){
                Navigator.of(context).pop();
              },
               child: Text('Aceptar'))
            ],),
        );    

  }
  else if (aux==1){
            showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Siga las indicaciones de alta.'),
            actions:<Widget>[
              
              RaisedButton(onPressed: (){
                Navigator.of(context).pop();
              },
               child: Text('Aceptar'))
            ],),
        );    
    
  }
  else if (aux==2){
            showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Siga regimen.'),
            actions:<Widget>[
              
              RaisedButton(onPressed: (){
                Navigator.of(context).pop();
              },
               child: Text('Aceptar'))
            ],),
        );    

  }
    else if (aux==3){
              showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Controle temperatura.'),
            actions:<Widget>[
              
              RaisedButton(onPressed: (){
                Navigator.of(context).pop();
              },
               child: Text('Aceptar'))
            ],),
        );    

  }
    else if (aux==4){
              showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Avise a las enfermera.'),
            actions:<Widget>[
              
              RaisedButton(onPressed: (){
                Navigator.of(context).pop();
              },
               child: Text('Aceptar'))
            ],),
        );    

  }
  else  if (aux==5){
              showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Adelante control medico.'),
            actions:<Widget>[
              
              RaisedButton(onPressed: (){
                Navigator.of(context).pop();
              },
               child: Text('Aceptar'))
            ],),
        );    

  }
  else  if (aux==6){
              showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Avise enfermera y adelante control médico .'),
            actions:<Widget>[
              
              RaisedButton(onPressed: (){
                Navigator.of(context).pop();
              },
               child: Text('Aceptar'))
            ],),
        );    

  }
    else{
              showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Vaya a servicio de urgencia.'),
            actions:<Widget>[
              
              RaisedButton(onPressed: (){
                Navigator.of(context).pop();
              },
               child: Text('Aceptar'))
            ],),
        );    

    }

  

}
  
  
//Funcion agregar bitacora a base de datos.
  void addData() {
    var url = "http://192.168.1.27/demo1/adbitacora.php";

    http.post(url, body: {
      "FechaHora": now.toString(),
      "Nauseas": _nauseas.toString(),
      "Vomitos": _vomito.toString(),
      "Diarrea":_diarrea.toString(),
      "Constipacion":_constipacion.toString(),
      "Dolor":_dolor.toString(),
      "Fatiga":_fatiga.toString(),
      "PerdidaApetito":_perdidaapetito.toString(),
      "Fiebre":_fiebre.toString(),
      "SintomasResfrio":_sintomaresfrio.toString(),
      "SintomasUnitarios":_sintomasunitarios.toString(),
      "ValorICG":_valoricg.toString(),
      "IdPaciente":_usuario.id.toString(),
    });
    respuesta();
  }
//Funcion que registra la alerta dentro de la base datos 
    void enviaralertaphp() {
    var url = "http://192.168.1.27/demo1/adalerta.php";

    http.post(url, body: {
      "TipoNotificacion": '2',
      "FechaNotificacion": now.toString(),
      "Titulo": 'Alerta',
      "Remitente":'Sistema',
      "Mensaje":_bitacora.mensaje,
      "IdPaciente":_usuario.id.toString(),
    });
    showNotification();
  }

  
  final PageController control = PageController();
  int _nauseas= 0;
  int _vomito=0;
  int _diarrea=0;
  int _constipacion=0;
  int _dolor=0;
  int _fatiga=0;
  int _perdidaapetito=0;
  double _fiebre=37.0; 
  int _sintomaresfrio=0;
  int _sintomasunitarios=0;
  int _valoricg=0;
  DateTime now= new DateTime.now();
  
  final Usuario _usuario = new Usuario();

//---------nauseas------------------------------------
  void incrementarnauseas() {
    setState(() {
      if (_nauseas<5) {
        _nauseas++;
      }
      if (_nauseas==5) {
        setState((){_nauseas=4;},);
        showDialog(
          context: context,         
          builder: (context) => AlertDialog(
            title: Text('No se puede incrementar más'),
            actions:<Widget>[
              FlatButton(onPressed: (){
                Navigator.of(context).pop();
              },
               child: Text('Aceptar'))
            ],),
        );      
      }      
    });
    
  } 
  void disminuirnauseas() {
    setState(() {
      if (_nauseas>-1) {
        _nauseas--;
      }
      if (_nauseas<=-1) {
        setState((){_nauseas=0;},);
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('No se puede disminuir más'),
            actions:<Widget>[
              
              RaisedButton(onPressed: (){
                Navigator.of(context).pop();
              },
               child: Text('Aceptar'))
            ],),
        );      
      }      
    }); }
//---------vomito------------------------------------
  void incrementarvomito() {
    setState(() {
      if (_vomito<5) {
        _vomito++;
      }
      if (_vomito==5) {
        setState((){_vomito=4;},);
        showDialog(
          context: context,         
          builder: (context) => AlertDialog(
            title: Text('No se puede incrementar más'),
            actions:<Widget>[
              FlatButton(onPressed: (){
                Navigator.of(context).pop();
              },
               child: Text('Aceptar'))
            ],),
        );      
      }      
    });
    
  } 
  void disminuirvomito() {
    setState(() {
      if (_vomito>-1) {
        _vomito--;
      }
      if (_vomito<=-1) {
        setState((){_vomito=0;},);
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('No se puede disminuir más'),
            actions:<Widget>[
              
              RaisedButton(onPressed: (){
                Navigator.of(context).pop();
              },
               child: Text('Aceptar'))
            ],),
        );      
      }      
    });
    }  
//---------diarrea------------------------------------
  void incrementardiarrea() {
    setState(() {
      if (_diarrea<5) {
        _diarrea++;
      }
      if (_diarrea==5) {
        setState((){_diarrea=4;},);
        showDialog(
          context: context,         
          builder: (context) => AlertDialog(
            title: Text('No se puede incrementar más'),
            actions:<Widget>[
              FlatButton(onPressed: (){
                Navigator.of(context).pop();
              },
               child: Text('Aceptar'))
            ],),
        );      
      }      
    });
    
  } 
  void disminuirdiarrea() {
    setState(() {
      if (_diarrea>-1) {
        _diarrea--;
      }
      if (_diarrea<=-1) {
        setState((){_diarrea=0;},);
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('No se puede disminuir más'),
            actions:<Widget>[
              
              RaisedButton(onPressed: (){
                Navigator.of(context).pop();
              },
               child: Text('Aceptar'))
            ],),
        );      
      }      
    }); } 
//---------constipacion------------------------------------
  void incrementarconstipacion() {
    setState(() {
      if (_constipacion<5) {
        _constipacion++;
      }
      if (_constipacion==5) {
        setState((){_constipacion=4;},);
        showDialog(
          context: context,         
          builder: (context) => AlertDialog(
            title: Text('No se puede incrementar más'),
            actions:<Widget>[
              FlatButton(onPressed: (){
                Navigator.of(context).pop();
              },
               child: Text('Aceptar'))
            ],),
        );      
      }      
    });
    
  } 
  void disminuirconstipacion() {
    setState(() {
      if (_constipacion>-1) {
        _constipacion--;
      }
      if (_constipacion<=-1) {
        setState((){_constipacion=0;},);
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('No se puede disminuir más'),
            actions:<Widget>[
              
              RaisedButton(onPressed: (){
                Navigator.of(context).pop();
              },
               child: Text('Aceptar'))
            ],),
        );      
      }      
    }); 
  } 
//---------dolor--------------------
  void incrementardolor() {
    setState(() {
      if (_dolor<5) {
        _dolor++;
      }
      if (_dolor==5) {
        setState((){_dolor=4;},);
        showDialog(
          context: context,         
          builder: (context) => AlertDialog(
            title: Text('No se puede incrementar más'),
            actions:<Widget>[
              FlatButton(onPressed: (){
                Navigator.of(context).pop();
              },
               child: Text('Aceptar'))
            ],),
        );      
      }      
    });
    
  } 
  void disminuirdolor() {
    setState(() {
      if (_dolor>-1) {
        _dolor--;
      }
      if (_dolor<=-1) {
        setState((){_dolor=0;},);
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('No se puede disminuir más'),
            actions:<Widget>[
              
              RaisedButton(onPressed: (){
                Navigator.of(context).pop();
              },
               child: Text('Aceptar'))
            ],),
        );      
      }      
    }); 
  } 
//---------fatiga--------------------
  void incrementarfatiga() {
    setState(() {
      if (_fatiga<5) {
        _fatiga++;
      }
      if (_fatiga==5) {
        setState((){_fatiga=4;},);
        showDialog(
          context: context,         
          builder: (context) => AlertDialog(
            title: Text('No se puede incrementar más'),
            actions:<Widget>[
              FlatButton(onPressed: (){
                Navigator.of(context).pop();
              },
               child: Text('Aceptar'))
            ],),
        );      
      }      
    });
    
  } 
  void disminuirfatiga() {
    setState(() {
      if (_fatiga>-1) {
        _fatiga--;
      }
      if (_fatiga<=-1) {
        setState((){_fatiga=0;},);
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('No se puede disminuir más'),
            actions:<Widget>[
              
              RaisedButton(onPressed: (){
                Navigator.of(context).pop();
              },
               child: Text('Aceptar'))
            ],),
        );      
      }      
    }); 
  } 
//---------perdidaapetito--------------------
  void incrementarperdidaapetito() {
    setState(() {
      if (_perdidaapetito<5) {
        _perdidaapetito++;
      }
      if (_perdidaapetito==5) {
        setState((){_perdidaapetito=4;},);
        showDialog(
          context: context,         
          builder: (context) => AlertDialog(
            title: Text('No se puede incrementar más'),
            actions:<Widget>[
              FlatButton(onPressed: (){
                Navigator.of(context).pop();
              },
               child: Text('Aceptar'))
            ],),
        );      
      }      
    });
    
  } 
  void disminuirperdidaapetito() {
    setState(() {
      if (_perdidaapetito>-1) {
        _perdidaapetito--;
      }
      if (_perdidaapetito<=-1) {
        setState((){_perdidaapetito=0;},);
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('No se puede disminuir más'),
            actions:<Widget>[
              
              RaisedButton(onPressed: (){
                Navigator.of(context).pop();
              },
               child: Text('Aceptar'))
            ],),
        );      
      }      
    }); 
  } 
//--------------fiebre-----------------------
  void incrementarfiebre() {
    setState(() {
      
      if (_fiebre<55.1) {
        _fiebre= _fiebre+0.1;
      }
      if (_fiebre>55) {
        setState((){_fiebre=55;},);
        showDialog(
          context: context,         
          builder: (context) => AlertDialog(
            title: Text('No se puede incrementar más'),
            actions:<Widget>[
              FlatButton(onPressed: (){
                Navigator.of(context).pop();
              },
               child: Text('Aceptar'))
            ],),
        );      
      }      
    });
    
  } 
  void disminuirfiebre() {
    setState(() {
      if (_fiebre>29.9) {
        _fiebre=_fiebre-0.1;
      }
      if (_fiebre<=29.9) {
        setState((){_fiebre=30;},);
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('No se puede disminuir más'),
            actions:<Widget>[
              
              RaisedButton(onPressed: (){
                Navigator.of(context).pop();
              },
               child: Text('Aceptar'))
            ],),
        );      
      }      
    }); 
  } 
//---------sintomaderesfrio--------------------
  void incrementarsintomaresfrio() {
    setState(() {
      if (_sintomaresfrio<5) {
        _sintomaresfrio++;
      }
      if (_sintomaresfrio==5) {
        setState((){_sintomaresfrio=4;},);
        showDialog(
          context: context,         
          builder: (context) => AlertDialog(
            title: Text('No se puede incrementar más'),
            actions:<Widget>[
              FlatButton(onPressed: (){
                Navigator.of(context).pop();
              },
               child: Text('Aceptar'))
            ],),
        );      
      }      
    });
    
  } 
  void disminuirsintomaresfrio() {
    setState(() {
      if (_sintomaresfrio>-1) {
        _sintomaresfrio--;
      }
      if (_sintomaresfrio<=-1) {
        setState((){_sintomaresfrio=0;},);
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('No se puede disminuir más'),
            actions:<Widget>[
              
              RaisedButton(onPressed: (){
                Navigator.of(context).pop();
              },
               child: Text('Aceptar'))
            ],),
        );      
      }      
    }); 
  } 
  //---------sintomasunitarios--------------------
  void incrementarsintomasunitarios() {
    setState(() {
      if (_sintomasunitarios<5) {
        _sintomasunitarios++;
      }
      if (_sintomasunitarios==5) {
        setState((){_sintomasunitarios=4;},);
        showDialog(
          context: context,         
          builder: (context) => AlertDialog(
            title: Text('No se puede incrementar más'),
            actions:<Widget>[
              FlatButton(onPressed: (){
                Navigator.of(context).pop();
              },
               child: Text('Aceptar'))
            ],),
        );      
      }      
    });
    
  } 
  void disminuirsintomasunitarios() {
    setState(() {
      if (_sintomasunitarios>-1) {
        _sintomasunitarios--;
      }
      if (_sintomasunitarios<=-1) {
        setState((){_sintomasunitarios=0;},);
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('No se puede disminuir más'),
            actions:<Widget>[
              
              RaisedButton(onPressed: (){
                Navigator.of(context).pop();
              },
               child: Text('Aceptar'))
            ],),
        );      
      }      
    }); 
  } 
  //---------valoricg--------------------
  void incrementarvaloricg() {
    setState(() {
      if (_valoricg<5) {
        _valoricg++;
      }
      if (_valoricg==5) {
        setState((){_valoricg=4;},);
        showDialog(
          context: context,         
          builder: (context) => AlertDialog(
            title: Text('No se puede incrementar más'),
            actions:<Widget>[
              FlatButton(onPressed: (){
                Navigator.of(context).pop();
              },
               child: Text('Aceptar'))
            ],),
        );      
      }      
    });
    
  } 
  void disminuirvaloricg() {
    setState(() {
      if (_valoricg>-1) {
        _valoricg--;
      }
      if (_valoricg<=-1) {
        setState((){_valoricg=0;},);
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('No se puede disminuir más'),
            actions:<Widget>[
              
              RaisedButton(onPressed: (){
                Navigator.of(context).pop();
              },
               child: Text('Aceptar'))
            ],),
        );      
      }      
    }); 
  } 

  //cierre
  
  @override
  Widget build(BuildContext context) {
    String fiebre=_fiebre.toStringAsFixed(1);
    return Scaffold(
        body: new PageView(
          scrollDirection: Axis.horizontal,
          controller: control,
          children: [
//---------nauseas------------------------------------
            new Container(
              child: Scaffold(
                appBar: AppBar(
                  title: Text('Registrar bitacora'),
                ),
                body: Container(
                  padding: EdgeInsets.only(
                    top: 70,
                    bottom: 0,
                    right: 10,
                    left: 10
                  ),
                  child: Column(         
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(                  
                            child: Text('¿Qué valor asignaría en relación \n a las Nauseas en este momento?\n',                 
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                              )
                            ),
                          )
                        ],             
                      ),
                     Row(
                      children: [
                        Text('\n')],
                     ),
                         
                    Table(
                    border: TableBorder.all(),
                    columnWidths: {
                    0:FractionColumnWidth(.15),
                    1:FractionColumnWidth(.25),
                    2:FractionColumnWidth(.15),
                    3:FractionColumnWidth(.2),
                    4:FractionColumnWidth(.2),
                    },
                
              
              children: [            
                TableRow(children: [
                  TableCell(child: Container (color: Colors.green[300], child: Center(child: Text('Nada',style: TextStyle(color: Colors.black,fontSize: 18),))),),
                  TableCell(child: Container (color: Colors.purple[300], child: Center(child: Text('Muy poco',style: TextStyle(color: Colors.black,fontSize: 18),))),),
                  TableCell(child: Container (color: Colors.orange[300], child: Center(child: Text('Poco',style: TextStyle(color: Colors.black,fontSize: 18),))),),
                  TableCell(child: Container (color: Colors.pink[300], child: Center(child: Text('Bastante',style: TextStyle(color: Colors.black,fontSize: 18),))),), 
                  TableCell(child: Container (color: Colors.red[200], child: Center(child: Text('Severo',style: TextStyle(color: Colors.black,fontSize: 18),))),),             
                ]),
                TableRow(children: [
                  TableCell(
                    child: Center(child: Text('0',style: TextStyle(color: Colors.black,fontSize: 18),)),
                    verticalAlignment: TableCellVerticalAlignment.bottom,
                  ),
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Center(child: Text('1',style: TextStyle(color: Colors.black,fontSize: 18),)),
                  ),
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Center(child: Text('2',style: TextStyle(color: Colors.black,fontSize: 18),)),
                  ),
                  TableCell(
                    child: Center(child: Text('3',style: TextStyle(color: Colors.black,fontSize: 18),)),
                    verticalAlignment: TableCellVerticalAlignment.top,
                  ),
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Center(child: Text('4',style: TextStyle(color: Colors.black,fontSize: 18),)),
                  ),
            ]),
            ],), 
            Row(
              children: [
                Text('\n')
            ],),                                 
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                  margin: EdgeInsets.fromLTRB(90.0, 16.0, 16.0, 16.0),      
                  child :Text('$_nauseas ',style: Theme.of(context).textTheme.headline4,),  
                ),
                Card(
                  child: Column(
                    children:<Widget> [
                      RaisedButton(onPressed: incrementarnauseas ,
                      child: Icon(Icons.expand_less), ),
                      RaisedButton(onPressed: disminuirnauseas,
                      child: Icon(Icons.expand_more), )
                    ],
                  ),
                )
              ]
            ),
            Row(
              children: [
                Text('\n'),
              ],
            ), 
            Row(
              children: [
                Text('\n'),
              ],
            ), 
            Row(
              children: [
                Text('\n'),
              ],
            ), 
            Row(
              children: [
                Text('\n'),
              ],
            ), 
          ],
        ),
      ), 
    ),
            ),
//---------vomito------------------------------------
            new Container(child: Scaffold(
                appBar: AppBar(
                  title: Text('Registrar bitacora'),
                ),
                body: Container(
                  padding: EdgeInsets.only(
                    top: 70,
                    bottom: 0,
                    right: 10,
                    left: 10
                  ),
                  child: Column(         
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(                  
                            child: Text('¿Qué valor asignaría en relación \n a los Vomitos en este momento?\n',                 
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                              )
                            ),
                          )
                        ],             
                      ),
                     Row(
                      children: [
                        Text('\n')],
                     ),
                         
                    Table(
                    border: TableBorder.all(),
                    columnWidths: {
                    0:FractionColumnWidth(.15),
                    1:FractionColumnWidth(.25),
                    2:FractionColumnWidth(.15),
                    3:FractionColumnWidth(.2),
                    4:FractionColumnWidth(.2),
                    },
                
              
              children: [            
                TableRow(children: [
                  TableCell(child: Container (color: Colors.green[300], child: Center(child: Text('Nada',style: TextStyle(color: Colors.black,fontSize: 18),))),),
                  TableCell(child: Container (color: Colors.purple[300], child: Center(child: Text('Muy poco',style: TextStyle(color: Colors.black,fontSize: 18),))),),
                  TableCell(child: Container (color: Colors.orange[300], child: Center(child: Text('Poco',style: TextStyle(color: Colors.black,fontSize: 18),))),),
                  TableCell(child: Container (color: Colors.pink[300], child: Center(child: Text('Bastante',style: TextStyle(color: Colors.black,fontSize: 18),))),), 
                  TableCell(child: Container (color: Colors.red[200], child: Center(child: Text('Severo',style: TextStyle(color: Colors.black,fontSize: 18),))),),             
                ]),
                TableRow(children: [
                  TableCell(
                    child: Center(child: Text('0',style: TextStyle(color: Colors.black,fontSize: 18),)),
                    verticalAlignment: TableCellVerticalAlignment.bottom,
                  ),
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Center(child: Text('1',style: TextStyle(color: Colors.black,fontSize: 18),)),
                  ),
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Center(child: Text('2',style: TextStyle(color: Colors.black,fontSize: 18),)),
                  ),
                  TableCell(
                    child: Center(child: Text('3',style: TextStyle(color: Colors.black,fontSize: 18),)),
                    verticalAlignment: TableCellVerticalAlignment.top,
                  ),
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Center(child: Text('4',style: TextStyle(color: Colors.black,fontSize: 18),)),
                  ),
            ]),
            ],), 
            Row(
              children: [
                Text('\n')
            ],),                                 
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                  margin: EdgeInsets.fromLTRB(90.0, 16.0, 16.0, 16.0),      
                  child :Text('$_vomito ',style: Theme.of(context).textTheme.headline4,),  
                ),
                Card(
                  child: Column(
                    children:<Widget> [
                      RaisedButton(onPressed: incrementarvomito  ,
                      child: Icon(Icons.expand_less), ),
                      RaisedButton(onPressed: disminuirvomito,
                      child: Icon(Icons.expand_more), )
                    ],
                  ),
                )
              ]
            ),
            Row(
              children: [
                Text('\n'),
              ],
            ), 
            Row(
              children: [
                Text('\n'),
              ],
            ), 
            Row(
              children: [
                Text('\n'),
              ],
            ), 
            Row(
              children: [
                Text('\n'),
              ],
            ), 
          ],
        ),
      ), 
    ),),
//---------diarrea------------------------------------
            new Container(child: Scaffold(
                appBar: AppBar(
                  title: Text('Registrar bitacora'),
                ),
                body: Container(
                  padding: EdgeInsets.only(
                    top: 70,
                    bottom: 0,
                    right: 10,
                    left: 10
                  ),
                  child: Column(         
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(                  
                            child: Text('¿Qué valor asignaría en relación \n a la Diarrea en este momento?\n',                 
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                              )
                            ),
                          )
                        ],             
                      ),
                     Row(
                      children: [
                        Text('\n')],
                     ),
                         
                    Table(
                    border: TableBorder.all(),
                    columnWidths: {
                    0:FractionColumnWidth(.15),
                    1:FractionColumnWidth(.25),
                    2:FractionColumnWidth(.15),
                    3:FractionColumnWidth(.2),
                    4:FractionColumnWidth(.2),
                    },
                
              
              children: [            
                TableRow(children: [
                  TableCell(child: Container (color: Colors.green[300], child: Center(child: Text('Nada',style: TextStyle(color: Colors.black,fontSize: 18),))),),
                  TableCell(child: Container (color: Colors.purple[300], child: Center(child: Text('Muy poco',style: TextStyle(color: Colors.black,fontSize: 18),))),),
                  TableCell(child: Container (color: Colors.orange[300], child: Center(child: Text('Poco',style: TextStyle(color: Colors.black,fontSize: 18),))),),
                  TableCell(child: Container (color: Colors.pink[300], child: Center(child: Text('Bastante',style: TextStyle(color: Colors.black,fontSize: 18),))),), 
                  TableCell(child: Container (color: Colors.red[200], child: Center(child: Text('Severo',style: TextStyle(color: Colors.black,fontSize: 18),))),),             
                ]),
                TableRow(children: [
                  TableCell(
                    child: Center(child: Text('0',style: TextStyle(color: Colors.black,fontSize: 18),)),
                    verticalAlignment: TableCellVerticalAlignment.bottom,
                  ),
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Center(child: Text('1',style: TextStyle(color: Colors.black,fontSize: 18),)),
                  ),
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Center(child: Text('2',style: TextStyle(color: Colors.black,fontSize: 18),)),
                  ),
                  TableCell(
                    child: Center(child: Text('3',style: TextStyle(color: Colors.black,fontSize: 18),)),
                    verticalAlignment: TableCellVerticalAlignment.top,
                  ),
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Center(child: Text('4',style: TextStyle(color: Colors.black,fontSize: 18),)),
                  ),
            ]),
            ],), 
            Row(
              children: [
                Text('\n')
            ],),                                 
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                  margin: EdgeInsets.fromLTRB(90.0, 16.0, 16.0, 16.0),      
                  child :Text('$_diarrea ',style: Theme.of(context).textTheme.headline4,),  
                ),
                Card(
                  child: Column(
                    children:<Widget> [
                      RaisedButton(onPressed: incrementardiarrea  ,
                      child: Icon(Icons.expand_less), ),
                      RaisedButton(onPressed: disminuirdiarrea,
                      child: Icon(Icons.expand_more), )
                    ],
                  ),
                )
              ]
            ),
            Row(
              children: [
                Text('\n'),
              ],
            ), 
            Row(
              children: [
                Text('\n'),
              ],
            ), 
            Row(
              children: [
                Text('\n'),
              ],
            ), 
            Row(
              children: [
                Text('\n'),
              ],
            ), 
          ],
        ),
      ), 
    ),),
//---------constipacion------------------------------------
            new Container(child: Scaffold(
                appBar: AppBar(
                  title: Text('Registrar bitacora'),
                ),
                body: Container(
                  padding: EdgeInsets.only(
                    top: 70,
                    bottom: 0,
                    right: 10,
                    left: 10
                  ),
                  child: Column(         
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(                  
                            child: Text('¿Qué valor asignaría en relación \n a la Constipacion en este momento?\n',                 
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                              )
                            ),
                          )
                        ],             
                      ),
                     Row(
                      children: [
                        Text('\n')],
                     ),
                         
                    Table(
                    border: TableBorder.all(),
                    columnWidths: {
                    0:FractionColumnWidth(.15),
                    1:FractionColumnWidth(.25),
                    2:FractionColumnWidth(.15),
                    3:FractionColumnWidth(.2),
                    4:FractionColumnWidth(.2),
                    },
                
              
              children: [            
                TableRow(children: [
                  TableCell(child: Container (color: Colors.green[300], child: Center(child: Text('Nada',style: TextStyle(color: Colors.black,fontSize: 18),))),),
                  TableCell(child: Container (color: Colors.purple[300], child: Center(child: Text('Muy poco',style: TextStyle(color: Colors.black,fontSize: 18),))),),
                  TableCell(child: Container (color: Colors.orange[300], child: Center(child: Text('Poco',style: TextStyle(color: Colors.black,fontSize: 18),))),),
                  TableCell(child: Container (color: Colors.pink[300], child: Center(child: Text('Bastante',style: TextStyle(color: Colors.black,fontSize: 18),))),), 
                  TableCell(child: Container (color: Colors.red[200], child: Center(child: Text('Severo',style: TextStyle(color: Colors.black,fontSize: 18),))),),             
                ]),
                TableRow(children: [
                  TableCell(
                    child: Center(child: Text('0',style: TextStyle(color: Colors.black,fontSize: 18),)),
                    verticalAlignment: TableCellVerticalAlignment.bottom,
                  ),
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Center(child: Text('1',style: TextStyle(color: Colors.black,fontSize: 18),)),
                  ),
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Center(child: Text('2',style: TextStyle(color: Colors.black,fontSize: 18),)),
                  ),
                  TableCell(
                    child: Center(child: Text('3',style: TextStyle(color: Colors.black,fontSize: 18),)),
                    verticalAlignment: TableCellVerticalAlignment.top,
                  ),
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Center(child: Text('4',style: TextStyle(color: Colors.black,fontSize: 18),)),
                  ),
            ]),
            ],), 
            Row(
              children: [
                Text('\n')
            ],),                                 
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                  margin: EdgeInsets.fromLTRB(90.0, 16.0, 16.0, 16.0),      
                  child :Text('$_constipacion ',style: Theme.of(context).textTheme.headline4,),  
                ),
                Card(
                  child: Column(
                    children:<Widget> [
                      RaisedButton(onPressed: incrementarconstipacion  ,
                      child: Icon(Icons.expand_less), ),
                      RaisedButton(onPressed: disminuirconstipacion,
                      child: Icon(Icons.expand_more), )
                    ],
                  ),
                )
              ]
            ),
            Row(
              children: [
                Text('\n'),
              ],
            ), 
            Row(
              children: [
                Text('\n'),
              ],
            ), 
            Row(
              children: [
                Text('\n'),
              ],
            ), 
            Row(
              children: [
                Text('\n'),
              ],
            ), 
          ],
        ),
      ), 
    ),),
//----------dolor----------   
            new Container(child: Scaffold(
                appBar: AppBar(
                  title: Text('Registrar bitacora'),
                ),
                body: Container(
                  padding: EdgeInsets.only(
                    top: 70,
                    bottom: 0,
                    right: 10,
                    left: 10
                  ),
                  child: Column(         
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(                  
                            child: Text('¿Qué valor asignaría en relación \n al Dolor en este momento?\n',                 
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                              )
                            ),
                          )
                        ],             
                      ),
                     Row(
                      children: [
                        Text('\n')],
                     ),
                         
                    Table(
                    border: TableBorder.all(),
                    columnWidths: {
                    0:FractionColumnWidth(.15),
                    1:FractionColumnWidth(.25),
                    2:FractionColumnWidth(.15),
                    3:FractionColumnWidth(.2),
                    4:FractionColumnWidth(.2),
                    },
                
              
              children: [            
                TableRow(children: [
                  TableCell(child: Container (color: Colors.green[300], child: Center(child: Text('Nada',style: TextStyle(color: Colors.black,fontSize: 18),))),),
                  TableCell(child: Container (color: Colors.purple[300], child: Center(child: Text('Muy poco',style: TextStyle(color: Colors.black,fontSize: 18),))),),
                  TableCell(child: Container (color: Colors.orange[300], child: Center(child: Text('Poco',style: TextStyle(color: Colors.black,fontSize: 18),))),),
                  TableCell(child: Container (color: Colors.pink[300], child: Center(child: Text('Bastante',style: TextStyle(color: Colors.black,fontSize: 18),))),), 
                  TableCell(child: Container (color: Colors.red[200], child: Center(child: Text('Severo',style: TextStyle(color: Colors.black,fontSize: 18),))),),             
                ]),
                TableRow(children: [
                  TableCell(
                    child: Center(child: Text('0',style: TextStyle(color: Colors.black,fontSize: 18),)),
                    verticalAlignment: TableCellVerticalAlignment.bottom,
                  ),
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Center(child: Text('1',style: TextStyle(color: Colors.black,fontSize: 18),)),
                  ),
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Center(child: Text('2',style: TextStyle(color: Colors.black,fontSize: 18),)),
                  ),
                  TableCell(
                    child: Center(child: Text('3',style: TextStyle(color: Colors.black,fontSize: 18),)),
                    verticalAlignment: TableCellVerticalAlignment.top,
                  ),
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Center(child: Text('4',style: TextStyle(color: Colors.black,fontSize: 18),)),
                  ),
            ]),
            ],), 
            Row(
              children: [
                Text('\n')
            ],),                                 
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                  margin: EdgeInsets.fromLTRB(90.0, 16.0, 16.0, 16.0),      
                  child :Text('$_dolor ',style: Theme.of(context).textTheme.headline4,),  
                ),
                Card(
                  child: Column(
                    children:<Widget> [
                      RaisedButton(onPressed: incrementardolor  ,
                      child: Icon(Icons.expand_less), ),
                      RaisedButton(onPressed: disminuirdolor,
                      child: Icon(Icons.expand_more), )
                    ],
                  ),
                )
              ]
            ),
            Row(
              children: [
                Text('\n'),
              ],
            ), 
            Row(
              children: [
                Text('\n'),
              ],
            ), 
            Row(
              children: [
                Text('\n'),
              ],
            ), 
            Row(
              children: [
                Text('\n'),
              ],
            ), 
          ],
        ),
      ), 
    ),),
//--------------fatiga-----------------
            new Container(child: Scaffold(
                appBar: AppBar(
                  title: Text('Registrar bitacora'),
                ),
                body: Container(
                  padding: EdgeInsets.only(
                    top: 70,
                    bottom: 0,
                    right: 10,
                    left: 10
                  ),
                  child: Column(         
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(                  
                            child: Text('¿Qué valor asignaría en relación \n a la Fatiga en este momento?\n',                 
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                              )
                            ),
                          )
                        ],             
                      ),
                     Row(
                      children: [
                        Text('\n')],
                     ),
                         
                    Table(
                    border: TableBorder.all(),
                    columnWidths: {
                    0:FractionColumnWidth(.15),
                    1:FractionColumnWidth(.25),
                    2:FractionColumnWidth(.15),
                    3:FractionColumnWidth(.2),
                    4:FractionColumnWidth(.2),
                    },
                
              
              children: [            
                TableRow(children: [
                  TableCell(child: Container (color: Colors.green[300], child: Center(child: Text('Nada',style: TextStyle(color: Colors.black,fontSize: 18),))),),
                  TableCell(child: Container (color: Colors.purple[300], child: Center(child: Text('Muy poco',style: TextStyle(color: Colors.black,fontSize: 18),))),),
                  TableCell(child: Container (color: Colors.orange[300], child: Center(child: Text('Poco',style: TextStyle(color: Colors.black,fontSize: 18),))),),
                  TableCell(child: Container (color: Colors.pink[300], child: Center(child: Text('Bastante',style: TextStyle(color: Colors.black,fontSize: 18),))),), 
                  TableCell(child: Container (color: Colors.red[200], child: Center(child: Text('Severo',style: TextStyle(color: Colors.black,fontSize: 18),))),),             
                ]),
                TableRow(children: [
                  TableCell(
                    child: Center(child: Text('0',style: TextStyle(color: Colors.black,fontSize: 18),)),
                    verticalAlignment: TableCellVerticalAlignment.bottom,
                  ),
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Center(child: Text('1',style: TextStyle(color: Colors.black,fontSize: 18),)),
                  ),
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Center(child: Text('2',style: TextStyle(color: Colors.black,fontSize: 18),)),
                  ),
                  TableCell(
                    child: Center(child: Text('3',style: TextStyle(color: Colors.black,fontSize: 18),)),
                    verticalAlignment: TableCellVerticalAlignment.top,
                  ),
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Center(child: Text('4',style: TextStyle(color: Colors.black,fontSize: 18),)),
                  ),
            ]),
            ],), 
            Row(
              children: [
                Text('\n')
            ],),                                 
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                  margin: EdgeInsets.fromLTRB(90.0, 16.0, 16.0, 16.0),      
                  child :Text('$_fatiga ',style: Theme.of(context).textTheme.headline4,),  
                ),
                Card(
                  child: Column(
                    children:<Widget> [
                      RaisedButton(onPressed: incrementarfatiga  ,
                      child: Icon(Icons.expand_less), ),
                      RaisedButton(onPressed: disminuirfatiga,
                      child: Icon(Icons.expand_more), )
                    ],
                  ),
                )
              ]
            ),
            Row(
              children: [
                Text('\n'),
              ],
            ), 
            Row(
              children: [
                Text('\n'),
              ],
            ), 
            Row(
              children: [
                Text('\n'),
              ],
            ), 
            Row(
              children: [
                Text('\n'),
              ],
            ), 
          ],
        ),
      ), 
    ),),
//--------------perdidaapetito-----------------    
            new Container(child: Scaffold(
                appBar: AppBar(
                  title: Text('Registrar bitacora'),
                ),
                body: Container(
                  padding: EdgeInsets.only(
                    top: 70,
                    bottom: 0,
                    right: 10,
                    left: 10
                  ),
                  child: Column(         
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(                  
                            child: Text('¿Qué valor asignaría en relación \n a la Perdida de apetito en este momento?\n',                 
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                              )
                            ),
                          )
                        ],             
                      ),
                     Row(
                      children: [
                        Text('\n')],
                     ),
                         
                    Table(
                    border: TableBorder.all(),
                    columnWidths: {
                    0:FractionColumnWidth(.15),
                    1:FractionColumnWidth(.25),
                    2:FractionColumnWidth(.15),
                    3:FractionColumnWidth(.2),
                    4:FractionColumnWidth(.2),
                    },
                
              
              children: [            
                TableRow(children: [
                  TableCell(child: Container (color: Colors.green[300], child: Center(child: Text('Nada',style: TextStyle(color: Colors.black,fontSize: 18),))),),
                  TableCell(child: Container (color: Colors.purple[300], child: Center(child: Text('Muy poco',style: TextStyle(color: Colors.black,fontSize: 18),))),),
                  TableCell(child: Container (color: Colors.orange[300], child: Center(child: Text('Poco',style: TextStyle(color: Colors.black,fontSize: 18),))),),
                  TableCell(child: Container (color: Colors.pink[300], child: Center(child: Text('Bastante',style: TextStyle(color: Colors.black,fontSize: 18),))),), 
                  TableCell(child: Container (color: Colors.red[200], child: Center(child: Text('Severo',style: TextStyle(color: Colors.black,fontSize: 18),))),),             
                ]),
                TableRow(children: [
                  TableCell(
                    child: Center(child: Text('0',style: TextStyle(color: Colors.black,fontSize: 18),)),
                    verticalAlignment: TableCellVerticalAlignment.bottom,
                  ),
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Center(child: Text('1',style: TextStyle(color: Colors.black,fontSize: 18),)),
                  ),
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Center(child: Text('2',style: TextStyle(color: Colors.black,fontSize: 18),)),
                  ),
                  TableCell(
                    child: Center(child: Text('3',style: TextStyle(color: Colors.black,fontSize: 18),)),
                    verticalAlignment: TableCellVerticalAlignment.top,
                  ),
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Center(child: Text('4',style: TextStyle(color: Colors.black,fontSize: 18),)),
                  ),
            ]),
            ],), 
            Row(
              children: [
                Text('\n')
            ],),                                 
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                  margin: EdgeInsets.fromLTRB(90.0, 16.0, 16.0, 16.0),      
                  child :Text('$_perdidaapetito ',style: Theme.of(context).textTheme.headline4,),  
                ),
                Card(
                  child: Column(
                    children:<Widget> [
                      RaisedButton(onPressed: incrementarperdidaapetito  ,
                      child: Icon(Icons.expand_less), ),
                      RaisedButton(onPressed: disminuirperdidaapetito,
                      child: Icon(Icons.expand_more), )
                    ],
                  ),
                )
              ]
            ),
            Row(
              children: [
                Text('\n'),
              ],
            ), 
            Row(
              children: [
                Text('\n'),
              ],
            ), 
            Row(
              children: [
                Text('\n'),
              ],
            ), 
            Row(
              children: [
                Text('\n'),
              ],
            ), 
          ],
        ),
      ), 
    ),),
//--------------fiebre-----------------
            new Container(child: Scaffold(
                appBar: AppBar(
                  title: Text('Registrar bitacora'),
                ),
                body: Container(
                  padding: EdgeInsets.only(
                    top: 70,
                    bottom: 0,
                    right: 10,
                    left: 10
                  ),
                  child: Column(         
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(                  
                            child: Text('¿Cual es tu temperatura \n en este momento?\n',                 
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                              )
                            ),
                          )
                        ],             
                      ),
                     Row(
                      children: [
                        Text('\n')],
                     ),
                         
                    Table(
                    border: TableBorder.all(),
                    columnWidths: {
                    0:FractionColumnWidth(.15),
                    1:FractionColumnWidth(.25),
                    2:FractionColumnWidth(.15),
                    3:FractionColumnWidth(.2),
                    4:FractionColumnWidth(.2),
                    },
                
              
              children: [            
                TableRow(children: [
                  TableCell(child: Container (color: Colors.green[300], child: Center(child: Text('Nada',style: TextStyle(color: Colors.black,fontSize: 18),))),),
                  TableCell(child: Container (color: Colors.purple[300], child: Center(child: Text('Muy poco',style: TextStyle(color: Colors.black,fontSize: 18),))),),
                  TableCell(child: Container (color: Colors.orange[300], child: Center(child: Text('Poco',style: TextStyle(color: Colors.black,fontSize: 18),))),),
                  TableCell(child: Container (color: Colors.pink[300], child: Center(child: Text('Bastante',style: TextStyle(color: Colors.black,fontSize: 18),))),), 
                  TableCell(child: Container (color: Colors.red[200], child: Center(child: Text('Severo',style: TextStyle(color: Colors.black,fontSize: 18),))),),             
                ]),
                TableRow(children: [
                  TableCell(
                    child: Center(child: Text('0',style: TextStyle(color: Colors.black,fontSize: 18),)),
                    verticalAlignment: TableCellVerticalAlignment.bottom,
                  ),
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Center(child: Text('1',style: TextStyle(color: Colors.black,fontSize: 18),)),
                  ),
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Center(child: Text('2',style: TextStyle(color: Colors.black,fontSize: 18),)),
                  ),
                  TableCell(
                    child: Center(child: Text('3',style: TextStyle(color: Colors.black,fontSize: 18),)),
                    verticalAlignment: TableCellVerticalAlignment.top,
                  ),
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Center(child: Text('4',style: TextStyle(color: Colors.black,fontSize: 18),)),
                  ),
            ]),
            ],), 
            Row(
              children: [
                Text('\n')
            ],),                                 
            Row(
              
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                  margin: EdgeInsets.fromLTRB(90.0, 16.0, 16.0, 16.0),  
                     
                  child :Text('$fiebre °C ',style: Theme.of(context).textTheme.headline4,),  
                  
                ),
                Card(
                  child: Column(
                    children:<Widget> [
                      RaisedButton(onPressed: incrementarfiebre  ,
                      child: Icon(Icons.expand_less), ),
                      RaisedButton(onPressed: disminuirfiebre,
                      child: Icon(Icons.expand_more), )
                    ],
                  ),
                )
              ]
            ),
            Row(
              children: [
                Text('\n'),
              ],
            ), 
            Row(
              children: [
                Text('\n'),
              ],
            ), 
            Row(
              children: [
                Text('\n'),
              ],
            ), 
            Row(
              children: [
                Text('\n'),
              ],
            ), 
          ],
        ),
      ), 
    ),),
//--------------sintomasresfrio-----------------
            new Container(child: Scaffold(
                appBar: AppBar(
                  title: Text('Registrar bitacora'),
                ),
                body: Container(
                  padding: EdgeInsets.only(
                    top: 70,
                    bottom: 0,
                    right: 10,
                    left: 10
                  ),
                  child: Column(         
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(                  
                            child: Text('¿Qué valor asignaría en relación \n a los Sintomas de Resfrio\n en este momento?\n',                 
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                              )
                            ),
                          )
                        ],             
                      ),
                     Row(
                      children: [
                        Text('\n')],
                     ),
                         
                    Table(
                    border: TableBorder.all(),
                    columnWidths: {
                    0:FractionColumnWidth(.15),
                    1:FractionColumnWidth(.25),
                    2:FractionColumnWidth(.15),
                    3:FractionColumnWidth(.2),
                    4:FractionColumnWidth(.2),
                    },
                
              
              children: [            
                TableRow(children: [
                  TableCell(child: Container (color: Colors.green[300], child: Center(child: Text('Nada',style: TextStyle(color: Colors.black,fontSize: 18),))),),
                  TableCell(child: Container (color: Colors.purple[300], child: Center(child: Text('Muy poco',style: TextStyle(color: Colors.black,fontSize: 18),))),),
                  TableCell(child: Container (color: Colors.orange[300], child: Center(child: Text('Poco',style: TextStyle(color: Colors.black,fontSize: 18),))),),
                  TableCell(child: Container (color: Colors.pink[300], child: Center(child: Text('Bastante',style: TextStyle(color: Colors.black,fontSize: 18),))),), 
                  TableCell(child: Container (color: Colors.red[200], child: Center(child: Text('Severo',style: TextStyle(color: Colors.black,fontSize: 18),))),),             
                ]),
                TableRow(children: [
                  TableCell(
                    child: Center(child: Text('0',style: TextStyle(color: Colors.black,fontSize: 18),)),
                    verticalAlignment: TableCellVerticalAlignment.bottom,
                  ),
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Center(child: Text('1',style: TextStyle(color: Colors.black,fontSize: 18),)),
                  ),
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Center(child: Text('2',style: TextStyle(color: Colors.black,fontSize: 18),)),
                  ),
                  TableCell(
                    child: Center(child: Text('3',style: TextStyle(color: Colors.black,fontSize: 18),)),
                    verticalAlignment: TableCellVerticalAlignment.top,
                  ),
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Center(child: Text('4',style: TextStyle(color: Colors.black,fontSize: 18),)),
                  ),
            ]),
            ],), 
            Row(
              children: [
                Text('\n')
            ],),                                 
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                  margin: EdgeInsets.fromLTRB(90.0, 16.0, 16.0, 16.0),      
                  child :Text('$_sintomaresfrio ',style: Theme.of(context).textTheme.headline4,),  
                ),
                Card(
                  child: Column(
                    children:<Widget> [
                      RaisedButton(onPressed: incrementarsintomaresfrio  ,
                      child: Icon(Icons.expand_less), ),
                      RaisedButton(onPressed: disminuirsintomaresfrio,
                      child: Icon(Icons.expand_more), )
                    ],
                  ),
                )
              ]
            ),
            Row(
              children: [
                Text('\n'),
              ],
            ), 
            Row(
              children: [
                Text('\n'),
              ],
            ), 
            Row(
              children: [
                Text('\n'),
              ],
            ), 
            Row(
              children: [
                Text('\n'),
              ],
            ), 
          ],
        ),
      ), 
    ),),
//--------------sintomasunitarios-----------------
          new Container(child: Scaffold(
                appBar: AppBar(
                  title: Text('Registrar bitacora'),
                ),
                body: Container(
                  padding: EdgeInsets.only(
                    top: 70,
                    bottom: 0,
                    right: 10,
                    left: 10
                  ),
                  child: Column(         
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(                  
                            child: Text('¿Qué valor asignaría en relación \n a los Sintomas Unitarios\n en este momento?\n',                 
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                              )
                            ),
                          )
                        ],             
                      ),
                     Row(
                      children: [
                        Text('\n')],
                     ),
                         
                    Table(
                    border: TableBorder.all(),
                    columnWidths: {
                    0:FractionColumnWidth(.15),
                    1:FractionColumnWidth(.25),
                    2:FractionColumnWidth(.15),
                    3:FractionColumnWidth(.2),
                    4:FractionColumnWidth(.2),
                    },
                
              
              children: [            
                TableRow(children: [
                  TableCell(child: Container (color: Colors.green[300], child: Center(child: Text('Nada',style: TextStyle(color: Colors.black,fontSize: 18),))),),
                  TableCell(child: Container (color: Colors.purple[300], child: Center(child: Text('Muy poco',style: TextStyle(color: Colors.black,fontSize: 18),))),),
                  TableCell(child: Container (color: Colors.orange[300], child: Center(child: Text('Poco',style: TextStyle(color: Colors.black,fontSize: 18),))),),
                  TableCell(child: Container (color: Colors.pink[300], child: Center(child: Text('Bastante',style: TextStyle(color: Colors.black,fontSize: 18),))),), 
                  TableCell(child: Container (color: Colors.red[200], child: Center(child: Text('Severo',style: TextStyle(color: Colors.black,fontSize: 18),))),),             
                ]),
                TableRow(children: [
                  TableCell(
                    child: Center(child: Text('0',style: TextStyle(color: Colors.black,fontSize: 18),)),
                    verticalAlignment: TableCellVerticalAlignment.bottom,
                  ),
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Center(child: Text('1',style: TextStyle(color: Colors.black,fontSize: 18),)),
                  ),
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Center(child: Text('2',style: TextStyle(color: Colors.black,fontSize: 18),)),
                  ),
                  TableCell(
                    child: Center(child: Text('3',style: TextStyle(color: Colors.black,fontSize: 18),)),
                    verticalAlignment: TableCellVerticalAlignment.top,
                  ),
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Center(child: Text('4',style: TextStyle(color: Colors.black,fontSize: 18),)),
                  ),
            ]),
            ],), 
            Row(
              children: [
                Text('\n')
            ],),                                 
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                  margin: EdgeInsets.fromLTRB(90.0, 16.0, 16.0, 16.0),      
                  child :Text('$_sintomasunitarios ',style: Theme.of(context).textTheme.headline4,),  
                ),
                Card(
                  child: Column(
                    children:<Widget> [
                      RaisedButton(onPressed: incrementarsintomasunitarios  ,
                      child: Icon(Icons.expand_less), ),
                      RaisedButton(onPressed: disminuirsintomasunitarios,
                      child: Icon(Icons.expand_more), )
                    ],
                  ),
                )
              ]
            ),
            Row(
              children: [
                Text('\n'),
              ],
            ), 
            Row(
              children: [
                Text('\n'),
              ],
            ), 
            Row(
              children: [
                Text('\n'),
              ],
            ), 
            Row(
              children: [
                Text('\n'),
              ],
            ), 
          ],
        ),
      ), 
    ),),
//--------------valoricg-----------------
          new Container(child: Scaffold(
                appBar: AppBar(
                  title: Text('Registrar bitacora'),
                ),
                body: Container(
                  padding: EdgeInsets.only(
                    top: 70,
                    bottom: 0,
                    right: 10,
                    left: 10
                  ),
                  child: Column(         
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(                  
                            child: Text('¿Qué valor asignaría en relación \n al Valor ICG en este momento?\n',                 
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                              )
                            ),
                          )
                        ],             
                      ),
                     Row(
                      children: [
                        Text('\n')],
                     ),
                         
                    Table(
                    border: TableBorder.all(),
                    columnWidths: {
                    0:FractionColumnWidth(.15),
                    1:FractionColumnWidth(.25),
                    2:FractionColumnWidth(.15),
                    3:FractionColumnWidth(.2),
                    4:FractionColumnWidth(.2),
                    },
                
              
              children: [            
                TableRow(children: [
                  TableCell(child: Container (color: Colors.green[300], child: Center(child: Text('Nada',style: TextStyle(color: Colors.black,fontSize: 18),))),),
                  TableCell(child: Container (color: Colors.purple[300], child: Center(child: Text('Muy poco',style: TextStyle(color: Colors.black,fontSize: 18),))),),
                  TableCell(child: Container (color: Colors.orange[300], child: Center(child: Text('Poco',style: TextStyle(color: Colors.black,fontSize: 18),))),),
                  TableCell(child: Container (color: Colors.pink[300], child: Center(child: Text('Bastante',style: TextStyle(color: Colors.black,fontSize: 18),))),), 
                  TableCell(child: Container (color: Colors.red[200], child: Center(child: Text('Severo',style: TextStyle(color: Colors.black,fontSize: 18),))),),             
                ]),
                TableRow(children: [
                  TableCell(
                    child: Center(child: Text('0',style: TextStyle(color: Colors.black,fontSize: 18),)),
                    verticalAlignment: TableCellVerticalAlignment.bottom,
                  ),
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Center(child: Text('1',style: TextStyle(color: Colors.black,fontSize: 18),)),
                  ),
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Center(child: Text('2',style: TextStyle(color: Colors.black,fontSize: 18),)),
                  ),
                  TableCell(
                    child: Center(child: Text('3',style: TextStyle(color: Colors.black,fontSize: 18),)),
                    verticalAlignment: TableCellVerticalAlignment.top,
                  ),
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Center(child: Text('4',style: TextStyle(color: Colors.black,fontSize: 18),)),
                  ),
            ]),
            ],), 
            Row(
              children: [
                Text('\n')
            ],),                                 
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                  margin: EdgeInsets.fromLTRB(90.0, 16.0, 16.0, 16.0),      
                  child :Text('$_valoricg ',style: Theme.of(context).textTheme.headline4,),  
                ),
                Card(
                  child: Column(
                    children:<Widget> [
                      RaisedButton(onPressed: incrementarvaloricg  ,
                      child: Icon(Icons.expand_less), ),
                      RaisedButton(onPressed: disminuirvaloricg,
                      child: Icon(Icons.expand_more), )
                    ],
                  ),
                )
              ]
            ),
            Row(
              children: [
                Text('\n'),
              ],
            ), 
            Row(
              children: [
                Text('\n'),
              ],
            ), 
            Row(
              children: [
                Text('\n'),
              ],
            ), 
            Row(
              children: [
                RaisedButton(onPressed:(){
                  addData();
                  Navigator.of(context).pop();
                  //Navigator.popAndPushNamed(context, '/menup');
                } , child: Text ('Ingresar'))
              ],
            ), 
          ],
        ),
      ), 
    ),),

          ],
        ),
      );
  }
  

  
}

