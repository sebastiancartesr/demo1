import 'package:demo1/ventanas/paciente/bitacora.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:demo1/controllers/usuario.dart';
import 'package:demo1/controllers/bitacoraController.dart';

class DataPickerprueba extends StatefulWidget {

  @override
  _DataPickerprueba createState() => _DataPickerprueba();
}

class _DataPickerprueba extends State<DataPickerprueba> {

  final BitacoraController _bitacora= new BitacoraController();
  final Usuario _usuario = new Usuario();
  String mensaje='';
  DateTime _dateTime= DateTime.now();
 // DateTime _dateTimeFin;
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
  Future <List> verBitacora() async{
      
      final response = await http.post("http://192.168.1.108/demo1/verbitacora.php", body:{
      "IdPaciente":_usuario.id.toString(),
      "DataIni":_splitter(_dateTime.toString()),
      //"DataFin":_dateTimeFin.toString(),
      });
      var datauser = json.decode(response.body);

      if(datauser.length == 0){
        print(_dateTime.toString());
        setState(() {
          mensaje="No se han ingresado bitacoras ese dia";});
      }else{
          setState(() {
          _bitacora.fechaaux= _splitter(_dateTime.toString());});
        
       Navigator.popAndPushNamed(context, '/elegirbitacora');
    }

    return json.decode(response.body);
    }


  @override
  Widget build(BuildContext context) {
    return Container( 
      child: Scaffold(
        appBar: AppBar(
          title:Text('Ver Bitacora'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              //Text(_dateTime == null ? 'No se ha seleccionado una fecha' : _dateTime.toString()),
              Text(_dateTime.toString()== null ? 'No se ha seleccionado una fecha':_splitter(_dateTime.toString()), style: TextStyle(fontSize: 25.0)),
              RaisedButton(
                child: Text('Seleccionar fecha'),
                onPressed: () {
                  showDatePicker(
                    context: context,
                    //initialDate: _dateTime == null ? DateTime.now() : _dateTime,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2001),
                    lastDate: DateTime(2021)
                  ).then((date) {
                    print(date);
                    if(date==null){
                      date = _dateTime;
                    }else{
                      setState(() {

                      _dateTime = date;
                      //date = _dateTime;
                    });

                    }
                    
                  });
                
                },
              ),
                    new RaisedButton( 
                     child: new Text("Ingresar"),
                     color: Colors.orangeAccent,
                     shape: new RoundedRectangleBorder(
                       borderRadius: new BorderRadius.circular(30.0)
                     ),
                     onPressed:(){
                       verBitacora();
                     },
                     ),
                     Text(mensaje,
                     style: TextStyle(fontSize: 25.0, color: Colors.red),)
            ],
          ),
        ),
      ),
    );
  }
}

