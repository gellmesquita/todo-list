import 'package:login_app/domain/entities/activities_entity.dart';
import 'package:login_app/domain/entities/user_entity.dart';

abstract class ActivityRepository {
  Future<bool> addActivity(ActivitiesEntity activity);
  Future<ActivitiesEntity?> fetchActivitiyId(int id);
  Future<List<ActivitiesEntity>> fetchActivities();
  Future<bool> editActivity(ActivitiesEntity newActivity);
  Future<bool> deleteActivity(int id);
  Future<bool> deleteAllActivities();
}