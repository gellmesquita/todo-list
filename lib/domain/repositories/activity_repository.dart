import 'package:login_app/domain/entities/activities_entity.dart';

abstract class ActivityRepository {
  Future<bool> addActivity(String activity);
  Future<ActivitiesEntity?> fetchActivitiyId(int id);
  Future<List<ActivitiesEntity>> fetchActivities();
  Future<bool> editActivity(ActivitiesEntity newActivity);
  Future<bool> deleteActivity(int id);
  Future<bool> deleteAllActivities();
}