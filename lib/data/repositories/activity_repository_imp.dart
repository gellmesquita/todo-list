import 'package:login_app/data/datasources/local/preferences/activity_preferences.dart';
import 'package:login_app/domain/entities/activities_entity.dart';
import 'package:login_app/domain/repositories/activity_repository.dart';

class ActvityRepositoryImp implements ActivityRepository {
  final ActivityPreferences _activityPreferences;
  ActvityRepositoryImp({
    required ActivityPreferences activityPreferences
  }): this._activityPreferences= activityPreferences;

  @override
  Future<bool> addActivity(ActivitiesEntity activity) async{
    var result = await _activityPreferences.addActivity(activity);
    return result;
  }

  @override
  Future<bool> deleteActivity(int id) async{
    var result = await _activityPreferences.deleteActivity(id);
    return result;
  }

  @override
  Future<bool> deleteAllActivities() async{
    var result = await _activityPreferences.deleteAllActivities();
    return result;
  }

  @override
  Future<bool> editActivity(ActivitiesEntity newActivity) async {
    var result = await _activityPreferences.editActivity(newActivity);
    return result;
  }

  @override
  Future<List<ActivitiesEntity>> fetchActivities() async{
    var result = await _activityPreferences.getActivities();
    return result;
  }

  @override
  Future<ActivitiesEntity?> fetchActivitiyId(int id) async {
    var result = await _activityPreferences.getActivityById(id);
    return result;
  }
  
}