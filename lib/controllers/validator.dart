import 'dart:async';

class Validators{

  final validarClave=StreamTransformer<String, String>.fromHandlers(
    handleData: ( clave, sink){
      if (clave.length>=6){
        sink.add(clave);
      }else{
        sink.addError('Contraseña invalida');
      }
    }
  );

    final validaEmail=StreamTransformer<String, String>.fromHandlers(
    handleData: ( email, sink){
      Pattern pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
      RegExp regExp= new RegExp(pattern);
      if( regExp.hasMatch(email)){
        sink.add(email);
      }else{
        sink.addError('Correo invalido');
      }
    }
  );


}