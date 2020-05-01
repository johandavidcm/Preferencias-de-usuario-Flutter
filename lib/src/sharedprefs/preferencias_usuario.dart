import 'package:shared_preferences/shared_preferences.dart';

class PreferenciasUsuario{
  
  static final PreferenciasUsuario _instancia = PreferenciasUsuario._internal();
  factory PreferenciasUsuario(){
    return _instancia;
  }
  
  PreferenciasUsuario._internal();
  
  SharedPreferences _preferences;
  
  initPrefs() async{
    _preferences = await SharedPreferences.getInstance();
  }

  get genero {
    return _preferences.getInt('genero') ?? 1;
  }

  set genero(int value){
    _preferences.setInt('genero', value);
  }
}