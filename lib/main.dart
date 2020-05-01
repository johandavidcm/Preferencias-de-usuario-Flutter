import 'package:flutter/material.dart';
import 'package:preferenciasusuario/src/pages/home_page.dart';
import 'package:preferenciasusuario/src/pages/settings_page.dart';
import 'package:preferenciasusuario/src/sharedprefs/preferencias_usuario.dart';
 
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = PreferenciasUsuario();
  await prefs.initPrefs();
  runApp(MyApp());
}
 
class MyApp extends StatelessWidget {

  final prefs = PreferenciasUsuario();


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App', 
      debugShowCheckedModeBanner: false,
      initialRoute: prefs.ultimaPagina,
      routes: {
        HomePage.routeName     : (BuildContext context) => HomePage(),
        SettingsPage.routeName : (BuildContext context) => SettingsPage(),
      },
    );
  }
}