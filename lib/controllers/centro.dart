class Centro {
  static final Centro _singleton = new Centro._internal();
  Centro._internal();
  factory Centro() => _singleton;
  String _direccion ='';
  String _telefono ='';
  String _correo='';

  String get direccion => _direccion;
  String get telefono => _telefono;
  String get correo => _correo;

  set direccion(String value) => _direccion = value;
  set telefono(String value) => _telefono = value;
  set correo(String value) => _correo = value;
}