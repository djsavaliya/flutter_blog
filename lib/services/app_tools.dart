import 'dart:io';
import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

writeDataLocally({String key, String value}) async {
  Future<SharedPreferences> prefs = SharedPreferences.getInstance();
  final SharedPreferences localData = await prefs;
  localData.setString(key, value);
}

writeStringLocally({String key,String value}) async {
  Future<SharedPreferences> prefs = SharedPreferences.getInstance();
  final SharedPreferences localData = await prefs;
  localData.setString(key , value);
}

writeIntLocally({String key,int value}) async {
  Future<SharedPreferences> prefs = SharedPreferences.getInstance();
  final SharedPreferences localData = await prefs;
  localData.setInt(key , value);
}

writeDoubleLocally({String key,double value}) async {
  Future<SharedPreferences> prefs = SharedPreferences.getInstance();
  final SharedPreferences localData = await prefs;
  localData.setDouble(key , value);
}

writeBoolLocally({String key,bool value}) async {
  Future<SharedPreferences> prefs = SharedPreferences.getInstance();
  final SharedPreferences localData = await prefs;
  localData.setBool(key , value);
}

getDataLocally({String key}) async {
  Future<SharedPreferences> saveLocal = SharedPreferences.getInstance();
  final SharedPreferences localData = await saveLocal;
  return localData.get(key) ?? "NIL";
}

getStringLocally({String key}) async {
  Future<SharedPreferences> prefs = SharedPreferences.getInstance();
  final SharedPreferences localData = await prefs;
  return localData.getString(key) ?? "NIL";
}

getIntLocally({String key}) async {
  Future<SharedPreferences> prefs = SharedPreferences.getInstance();
  final SharedPreferences localData = await prefs;
  return localData.getInt(key) ?? -1;
}

getDoubleLocally({String key}) async {
  Future<SharedPreferences> prefs = SharedPreferences.getInstance();
  final SharedPreferences localData = await prefs;
  return localData.getDouble(key) ?? -1.00;
}

getBoolLocally({String key}) async {
  Future<SharedPreferences> prefs = SharedPreferences.getInstance();
  final SharedPreferences localData = await prefs;
  return localData.getBool(key) ?? false;
}

removeValues() async {
  Future<SharedPreferences> prefs = SharedPreferences.getInstance();
  final SharedPreferences localData = await prefs;
  localData.clear();
}