import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:demo1/controllers/usuario.dart';

class ListarAlertas extends StatefulWidget {
  ListarAlertas({Key key}) : super(key: key);

  @override
  _ListarAlertasState createState() => _ListarAlertasState();
}

class _ListarAlertasState extends State<ListarAlertas> {
     final Usuario _usuario = new Usuario();
     
    Future<List> getData() async {
    final response = await http.post("http://192.168.1.27/demo1/getalertas.php", body:{
      "IdPaciente":_usuario.id.toString(),
    }); 
    return json.decode(response.body);  
  }

  @override
   Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Notificaciones"),
      ),
      body: new FutureBuilder<List>(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? new ItemList(
                  list: snapshot.data,
                )
              : new Center(
                  child: new CircularProgressIndicator(),
                );
        },
      ),
    );
  }
}

class ItemList extends StatelessWidget {
  final List list;
  ItemList({this.list});

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: list == null ? 0 : list.length,
      itemBuilder: (context, i) {
        return new Container(
          padding: const EdgeInsets.all(10.0),
          child: new GestureDetector(
            onTap: () => Navigator.of(context).push(
                  new MaterialPageRoute(
                      builder: (BuildContext context) => new Detail(
                            list: list,
                            index: i,
                          )),
                ),
            child: new Card(
              child: new ListTile(
                title: new Text(
                  "Mensaje de : ${list[i]['Remitente']}",
                  style: TextStyle(fontSize: 25.0, color: Colors.orangeAccent),
                ),
                leading: new Icon(
                  Icons.assignment_late_outlined,
                  size: 50.0,
                  color: Colors.orangeAccent,
                ),
                subtitle: new Text(
                  "Fecha: ${list[i]['FechaNotificacion']}",
                  style: TextStyle(fontSize: 20.0, color: Colors.black),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
//----------------------------------------------------------

class Detail extends StatefulWidget {
  List list;
  int index;
  Detail({this.index,this.list});
  @override
  _DetailState createState() => new _DetailState();
}

class _DetailState extends State<Detail> {
  final Usuario _usuario = new Usuario();


  @override
  Widget build(BuildContext context) {
    String nombre= _usuario.nombre;
    return new Scaffold(
      appBar: new AppBar(title: new Text("${widget.list[widget.index]['Titulo']}")),
      body: new Container(
        height: 270.0, 
        padding: const EdgeInsets.all(20.0),
        child: new Card(
          child: new Center(
            child: new Column(
              children: <Widget>[

                new Padding(padding: const EdgeInsets.only(top: 30.0),),
                new Text("Enviado por: ${widget.list[widget.index]['Remitente']}", style: new TextStyle(fontSize: 20.0),),
                Divider(),
                new Text("${widget.list[widget.index]['Mensaje']}", style: new TextStyle(fontSize: 18.0),),
                new Text("Fecha: ${widget.list[widget.index]['FechaNotificacion']}", style: new TextStyle(fontSize: 18.0),),
                new Padding(padding: const EdgeInsets.only(top: 30.0),),

                new Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[                   
                  VerticalDivider(),

                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}