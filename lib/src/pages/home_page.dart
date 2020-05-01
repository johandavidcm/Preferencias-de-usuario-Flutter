import 'package:flutter/material.dart';
import 'package:preferenciasusuario/src/sharedprefs/preferencias_usuario.dart';
import 'package:preferenciasusuario/src/widgets/menu_widget.dart';

class HomePage extends StatelessWidget {
  
  static final String routeName = 'home';
  final prefs = PreferenciasUsuario();
  
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Preferencias de Usuario'),
        centerTitle: true,
      ),
      drawer: MenuWidget(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Color secundario: '),
          Divider(),
          Text('Género: ${ prefs.genero }'),
          Divider(),
          Text('Nombre Usuario: '),
          Divider(),
        ],
      ),
    );
  }

}