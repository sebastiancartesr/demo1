import 'package:flutter/material.dart';

class InfoSeleccionarBitacora extends StatelessWidget {
  
  const InfoSeleccionarBitacora({Key key}) : super(key: key);
  

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
                image: AssetImage("assets/images/infoverbitacoras1.png"),
                fit: BoxFit.cover,
                ),
              ),
              ),
// slider 2 login paciente
                        new Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                image: AssetImage("assets/images/infoverbitacoras2.png"),
                fit: BoxFit.cover,
                ),
              ),
              ),
// login medico

                        new Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                image: AssetImage("assets/images/infoverbitacoras3.png"),
                fit: BoxFit.cover,
                ),
              ),
              ),
              
          ],
    )));
  }
}
