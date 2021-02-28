import 'package:flutter/material.dart';
import 'package:demo1/controllers/usuario.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class VerPerfilmedico extends StatefulWidget {
  VerPerfilmedico({Key key}) : super(key: key);
  
 

  @override
  _VerPerfilmedicoState createState() => _VerPerfilmedicoState();
}

class _VerPerfilmedicoState extends State<VerPerfilmedico> {
  final Usuario _usuario = new Usuario();
  
  TextEditingController controllerPhone ;
  TextEditingController controllerPass ;
 
  String phone='';
  String pass='';
  String mensaje='';
    Future <List> editardatosmedico() async{
      
      final response = await http.post("http://192.168.1.27/demo1/editdatamedico.php", body:{
      "Telefono":controllerPhone.text,
      "Clave":controllerPass.text,
      "IdPersona":_usuario.id.toString(),
      });
      Navigator.of(context).pop();
      setState(() {
        _usuario.telefono= phone;     
        _usuario.clave= pass;
      }); 
    
    }
  @override
    void initState() {
      controllerPhone= new TextEditingController(text: _usuario.telefono );
      controllerPass= new TextEditingController(text: _usuario.clave);
      super.initState();
    }
  @override
  Widget build(BuildContext context) {

    return Container(
       child: Scaffold(
         resizeToAvoidBottomPadding: false,
         appBar: AppBar(
           title:Text('Ver Perfil')
         ),
         body: Container(
           child: Column(
             children:<Widget>[
                               Container(
                   width: MediaQuery.of(context).size.width / 1,
                       padding: EdgeInsets.only(
                         top: 4, left: 260, right: 16, bottom: 0
                       ),
                      child:RaisedButton(child: Text('Cerrar sesion'),onPressed:(){
                        Navigator.popAndPushNamed(context, '/inicio');
                  

                       }
                     )
                     ),
               
                Container(
                 padding: EdgeInsets.only(top:77.0),
                 child: new CircleAvatar(
                   backgroundColor: Color(0xF81F7F3),
                   child: new Image(
                     width: 500,
                     height: 500,
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
                 alignment: Alignment.centerLeft,
                 child:  Text("        "+_usuario.nombre , style: TextStyle(fontSize: 25) ),
          
                 
               ),
               Container(
                 child: Text('\n'),

               ),
          
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
                         
                         //initialValue: _usuario.telefono.toString(),
                         controller: controllerPhone,
                         decoration: InputDecoration(
                           
                           icon: Icon(
                             Icons.phone,
                             color: Colors.black,
                           ),
                           hintText:'Telefono' 
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
                         //initialValue: _usuario.clave,
                         controller: controllerPass,
                         
                         decoration: InputDecoration(
                           icon: Icon(
                             Icons.vpn_key,
                             color: Colors.black
                           ),
                           hintText:'Clave'
                         ),
                       ),
                     ),
                     Container(
                       child: RaisedButton(child: Text('Guardar'),onPressed:(){
                        phone=controllerPhone.text;
                         pass=controllerPass.text;
                         print(phone+' '+pass);
                         if(phone.length == 0 || pass.length == 0 || phone.length > 9 ){
                                 showDialog(
          context: context,         
          builder: (context) => AlertDialog(
            title: Text('Ingrese datos validos'), 
            actions:<Widget>[
              FlatButton(onPressed: (){
                Navigator.of(context).pop();
              },
               child: Text('Aceptar'))
            ],),
        );
                         }else{
                            editardatosmedico();
                         }
                        
                         

                       }
                     ),

               ),
             
             ],
             
           ),
         ),
       ),
    );
  }
}