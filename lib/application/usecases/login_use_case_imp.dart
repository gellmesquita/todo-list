import 'package:login_app/domain/entities/activities_entity.dart';
import 'package:login_app/domain/entities/user_entity.dart';

import '../../domain/usecases/login_use_case.dart';

class LoginUseCaseImp implements LoginUseCase {
  @override
  Future<UserEntity> login({required String name, required String password}) {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Future<ActivitiesEntity> createActivity({required String description, required id}) {
    // TODO: implement createActivity
    throw UnimplementedError();
  }
  
  @override
  Future<ActivitiesEntity> deleteActivity({required id}) {
    // TODO: implement deleteActivity
    throw UnimplementedError();
  }
  
  @override
  Future<ActivitiesEntity> editActivity({required String description, required id}) {
    // TODO: implement editActivity
    throw UnimplementedError();
  }
  
}