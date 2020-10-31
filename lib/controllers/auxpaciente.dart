class Paciente {
  static final Paciente _singleton = new Paciente._internal();
  Paciente._internal();
  factory Paciente() => _singleton;
  String _idd = '0';
  String get idd => _idd;
  set idd(String value) => _idd = value;
}