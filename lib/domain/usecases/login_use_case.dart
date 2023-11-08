import 'package:login_app/domain/entities/activities_entity.dart';
import 'package:login_app/domain/entities/user_entity.dart';

abstract class  LoginUseCase {
  Future<UserEntity> login({ required String name, required String password});
  Future<ActivitiesEntity> createActivity({ required String description, required id});
  Future<ActivitiesEntity> deleteActivity({ required id});
  Future<ActivitiesEntity> editActivity({ required String description, required id});
}