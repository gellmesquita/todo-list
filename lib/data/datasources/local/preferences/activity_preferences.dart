
import 'dart:convert';

import 'package:login_app/application/resources/app_constants.dart';
import 'package:login_app/domain/entities/activities_entity.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ActivityPreferences {
  late SharedPreferences  _preferences;

  ActivityPreferences(){
    _inializedPreferences();
  }

  _inializedPreferences()async{
    _preferences=  await SharedPreferences.getInstance();
  }

  Future<bool> saveActivities(List<ActivitiesEntity> activities) async {
    try {
      List<String> activitiesJson = activities.map((activity) => jsonEncode(activity.toJson())).toList();
      _preferences.setStringList(ACTIVITYPREFERENCES, activitiesJson);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<List<ActivitiesEntity>> getActivities() async {
    List<String>? activitiesJson = _preferences.getStringList(ACTIVITYPREFERENCES);
    if (activitiesJson != null) {
      return activitiesJson.map((json) => ActivitiesEntity.fromJson(jsonDecode(json))).toList();
    } else {
      return [];
    }
  }

  Future<ActivitiesEntity?> getActivityById(int id) async {
    List<ActivitiesEntity> activities = await getActivities();
    return activities.firstWhere((activity) => activity.id == id);
  }

  Future<bool> addActivity(ActivitiesEntity activity) async {
    try {
      List<ActivitiesEntity> activities = await getActivities();
      activities.add(activity);
      return await saveActivities(activities);
    } catch (e) {
      return false;
    }

  }

  Future<bool> editActivity(ActivitiesEntity newActivity) async {
    try {
      List<ActivitiesEntity> activities = await getActivities();
      int index = activities.indexWhere((activity) => activity.id == newActivity.id);
      if (index != -1) {
        activities[index] = newActivity;
        return await saveActivities(activities);
      }
      return false;
    } catch (e) {
      return false;
    }
    
  }

  Future<bool> deleteActivity(int id) async {
    try {
      List<ActivitiesEntity> activities = await getActivities();
      activities.removeWhere((activity) => activity.id == id);
      return await saveActivities(activities);
    } catch (e) {
      return false;
    }
   
  }

  Future<bool> deleteAllActivities() async {
    try {
      return await _preferences.remove(ACTIVITYPREFERENCES); 
    } catch (e) {
      return false; 
    }
  }

}