class Token {
  static final Token _singleton = new Token._internal();
  Token._internal();
  factory Token() => _singleton;

  String _idt = '';

  String get idt => _idt;

  set idt(String value) => _idt = value;
}