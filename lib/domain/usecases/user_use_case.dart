import 'package:login_app/domain/entities/activities_entity.dart';
import 'package:login_app/domain/entities/user_entity.dart';

abstract class  UserUseCase {
  Future<UserEntity?> login({ required String name, required String password});
  Future<void> logout();
  Future<bool> addActivity(ActivitiesEntity activity);
  Future<ActivitiesEntity?> fetchActivitiyId(int id);
  Future<List<ActivitiesEntity>> fetchActivities();
  Future<bool> editActivity(ActivitiesEntity newActivity);
  Future<bool> deleteActivity(int id);
  Future<bool> deleteAllActivities();
}