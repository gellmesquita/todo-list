
import 'dart:convert';

import 'package:login_app/application/resources/app_constants.dart';
import 'package:login_app/domain/entities/activities_entity.dart';
import 'package:login_app/domain/entities/user_entity.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  late SharedPreferences  _preferences;

  UserPreferences(){
    _inializedPreferences();
  }

  _inializedPreferences()async{
    _preferences=  await SharedPreferences.getInstance();
  }

  Future<bool> saveUser(UserEntity user) async {
    try {
      _preferences=  await SharedPreferences.getInstance();
      String userJson = jsonEncode(user.toJson());
      _preferences.setString(USERPREFERENCES, userJson);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<UserEntity?> getUser() async {  
    _preferences=  await SharedPreferences.getInstance();
    String? userJson = _preferences.getString(USERPREFERENCES);
    if (userJson != null) {
      return UserEntity.fromJson(jsonDecode(userJson));
    } else {
      return null;
    }
    
  }

  Future<bool> deleteUser() async {
    try {
      _preferences=  await SharedPreferences.getInstance();
      return await _preferences.remove(USERPREFERENCES); 
    } catch (e) {
      return false; 
    }
  }

  static Future<bool> doesUserExist() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      return prefs.containsKey(USERPREFERENCES);
    } catch (e) {
      return false;
    }
  }

}