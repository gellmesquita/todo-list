import 'package:login_app/domain/entities/user_entity.dart';

abstract class UserRepository {
  Future<UserEntity?> login({ required String  name , required String password});

  Future<bool> logout();

  Future<UserEntity?> fetchUser();

  
}