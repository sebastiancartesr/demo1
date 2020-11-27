import 'package:flutter/material.dart';

class InfoBitacora extends StatelessWidget {
  
  const InfoBitacora({Key key}) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    final PageController controll = PageController();
    return new Container(
       child: new Scaffold(
                 appBar: AppBar(
          title: Text('Informacion'),
          leading: new IconButton(
            icon: new Icon(Icons.arrow_back_sharp),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: new PageView(
          scrollDirection: Axis.horizontal,
          controller: controll,
          children: [
// slider 1 bienvenida

            new Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                image: AssetImage("assets/images/verbitacora1.png"),
                fit: BoxFit.cover,
                ),
              ),
              ),
// slider 2 login paciente
                        new Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                image: AssetImage("assets/images/verbitacora2.png"),
                fit: BoxFit.cover,
                ),
              ),
              ),
// login medico
/*
                        new Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                image: AssetImage("assets/images/fondoindex.jpg"),
                fit: BoxFit.cover,
                ),
              ),
              ),
              */
          ],
    )));
  }
}
