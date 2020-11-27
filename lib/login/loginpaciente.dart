import 'package:flutter/material.dart';
import 'package:demo1/login/loginmedico.dart';
import 'package:demo1/main.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:demo1/controllers/usuario.dart';


class Loginpaciente extends StatefulWidget {
  //Loginpaciente({Key key}) : super(key: key);
  @override
  _LoginpacienteState createState() => _LoginpacienteState();
}

class _LoginpacienteState extends State<Loginpaciente> { 
  TextEditingController controllerUser = new TextEditingController();
  TextEditingController controllerPass = new TextEditingController();
  final Usuario _usuario = new Usuario();
  String mensaje = '';
     Future <List> login() async{
      
      final response = await http.post("http://192.168.1.108/demo1/loginpaciente.php", body:{
      "Correo":controllerUser.text,
      "clave":controllerPass.text,
      });
      var datauser = json.decode(response.body);

      if(datauser.length == 0){
        setState(() {
          mensaje="usuario o contraseña incorrecta";});
      }else{
        Navigator.popAndPushNamed(context, '/menup');
        setState(() {
          print(datauser[0]['IdPaciente']);
          int aux=int.parse(datauser[0]['IdPaciente']);
          _usuario.id= aux;
          _usuario.nombre= datauser[0]['PrimerNombre'];
          _usuario.telefono= datauser[0]['Telefono'];     
          _usuario.clave= datauser[0]['Clave'];
      });
    }

    return datauser;
    }
    /*
    Future respuesta() async{
      http.Response response = await http.get("http://10.0.2.2:36574/");
      var datauser = json.decode(response.body);
      print(datauser);

    return datauser;
  }

  */


  @override
  Widget build(BuildContext context) {
    _navegarmedico() async{
      Navigator.pushReplacementNamed(context, '/loginmedico');}
    return Scaffold(
       resizeToAvoidBottomPadding: false,
       body: Form(
         child: Container(
           decoration: new BoxDecoration(
             image: new DecorationImage(
               image: new AssetImage("assets/images/fondo.png"),
               fit: BoxFit.cover
             ),
           ),
           child: Column(
             children:<Widget>[
               
               
               new Container(
                 padding: EdgeInsets.only(top:77.0),
                 child: new CircleAvatar(
                   backgroundColor: Color(0xF81F7F3),
                   child: new Image(
                     width: 300,
                     height: 300,
                     image: new AssetImage('assets/images/paciente.png'),
                   ) ,
                 ),
                 width: 250,
                 height: 250,
                 decoration: BoxDecoration(
                   shape: BoxShape.circle
                 ),
               ),
               Container(
                 height: MediaQuery.of(context).size.height / 2,
                 width: MediaQuery.of(context).size.width,
                 padding: EdgeInsets.only(top: 93), 
                 child: Column(
                   children: <Widget> [
                     
                     Container(
                       width: MediaQuery.of(context).size.width / 1.2,
                       padding: EdgeInsets.only(
                         top: 4, left: 16, right: 16, bottom: 4
                       ),
                       decoration: BoxDecoration(
                         borderRadius: BorderRadius.all(Radius.circular(50)),
                         color: Colors.white,
                         boxShadow: [
                           BoxShadow(
                             color: Colors.black12,
                             blurRadius: 5 
                           ),
                        
                         ],
                       ),
                       child: TextFormField(
                         controller: controllerUser,
                         decoration: InputDecoration(
                           icon: Icon(
                             Icons.email,
                             color: Colors.black,
                           ),
                           hintText:'Usuario' 
                         ),
                       ),
                     ),
                     Container(
                       width: MediaQuery.of(context).size.width / 1.2,
                       height: 50,
                       margin: EdgeInsets.only(
                         top: 32
                       ),
                       padding: EdgeInsets.only(
                         top: 4, left: 16, bottom: 4
                       ),
                       decoration: BoxDecoration(
                         borderRadius: BorderRadius.all(Radius.circular(50)),
                         color: Colors.white,
                         boxShadow: [
                           BoxShadow(
                             color: Colors.black12,
                             blurRadius: 5
                           )
                         ]
                       ),
                       child: TextField(
                         controller: controllerPass,
                         obscureText: true,
                         decoration: InputDecoration(
                           icon: Icon(
                             Icons.vpn_key,
                             color: Colors.black
                           ),
                           hintText:'Contraseña'
                         ),
                       ),
                     ),
       
                    
                     
                     InkWell(
                          child: Align(
                         alignment: Alignment.centerRight,
                         child: Padding(
                           padding: const EdgeInsets.only(
                             top: 6,
                             right: 32,
                           ),
                           child: Text(
                             'Ingresar como medico',
                             style: TextStyle(
                               color: Colors.grey,
                               )
                           ),
                           
                         ),
                         
                       ),
                       onTap: (
                         _navegarmedico
                       ),
                     ),
                     
                     Spacer(),
                     new RaisedButton( 
                     child: new Text("ingresar"),
                     color: Colors.orangeAccent,
                     shape: new RoundedRectangleBorder(
                       borderRadius: new BorderRadius.circular(30.0)
                     ),
                     onPressed:(){
                       login();
                       
                     },
                     ),
                     Text(mensaje,
                     style: TextStyle(fontSize: 25.0, color: Colors.red),)
                   ],
                 ),               
               )
             ],
           ),
         ),
         ),
    );
  }
}

/*InkWell(
                 child:Text('hola',
                   style: TextStyle(color: new Color(0xff662d8c),
                   fontSize: 20)
                 )
               ),
*/