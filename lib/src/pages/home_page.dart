import 'package:flutter/material.dart';
import 'package:preferenciasusuario/src/sharedprefs/preferencias_usuario.dart';
import 'package:preferenciasusuario/src/widgets/menu_widget.dart';

class HomePage extends StatelessWidget {
  
  static final String routeName = 'home';
  final preferencias = PreferenciasUsuario();
  
  @override
  Widget build(BuildContext context) {
    preferencias.ultimaPagina = HomePage.routeName;
    return Scaffold(
      appBar: AppBar(
        title: Text('Preferencias de Usuario'),
        centerTitle: true,
        backgroundColor: (preferencias.colorSecundario) ? Colors.teal : Colors.blue,
      ),
      drawer: MenuWidget(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Color secundario: ${preferencias.colorSecundario}'),
          Divider(),
          Text('Género: ${ preferencias.genero }'),
          Divider(),
          Text('Nombre Usuario: ${ preferencias.nombreUsuario }'),
          Divider(),
        ],
      ),
    );
  }

}