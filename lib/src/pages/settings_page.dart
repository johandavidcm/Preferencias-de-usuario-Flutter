import 'package:flutter/material.dart';
import 'package:preferenciasusuario/src/sharedprefs/preferencias_usuario.dart';
import 'package:preferenciasusuario/src/widgets/menu_widget.dart';

class SettingsPage extends StatefulWidget {
  
  static final String routeName = 'settings';

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  bool _colorSecundario;
  int _genero;
  TextEditingController _textController;
  final preferencias = PreferenciasUsuario();

  @override
  void initState() {
    super.initState();
    _genero = preferencias.genero;
    _colorSecundario = preferencias.colorSecundario;
    preferencias.ultimaPagina = SettingsPage.routeName;
    _textController = TextEditingController(text: preferencias.nombreUsuario);
  }

  _setSelectedRadio(int value) {

    preferencias.genero = value;
    _genero = value;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ajustes'),
        centerTitle: true,
        backgroundColor: (preferencias.colorSecundario) ? Colors.teal : Colors.blue,
      ),
      drawer: MenuWidget(),
      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(5.0),
            child: Text('Settings', style: TextStyle(fontSize: 45.0, fontWeight: FontWeight.bold),),
          ),
          Divider(),
          SwitchListTile(
            value: _colorSecundario,
            title: Text('Color secundario'),
            onChanged: ( value ){
              setState(() {
                _colorSecundario = value;
                preferencias.colorSecundario = value;
              });
            },
          ),
          RadioListTile(
            value: 1,
            title: Text('Masculino'),
            groupValue: _genero,
            onChanged: _setSelectedRadio,
          ),
          RadioListTile(
            value: 2,
            title: Text('Femenino'),
            groupValue: _genero,
            onChanged: _setSelectedRadio,
          ),
          Divider(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 40.0),
            child: TextField(
              controller: _textController,
              decoration: InputDecoration(
                labelText: 'Nombre',
                helperText: 'Propietario del telefono'
              ),
              onChanged: ( value ){
                preferencias.nombreUsuario = value;
              },
              
            ),
          )
        ],
      ),
    );
  }

  
}