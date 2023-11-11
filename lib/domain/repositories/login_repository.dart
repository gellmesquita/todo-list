import 'package:login_app/domain/entities/user_entity.dart';

abstract class LoginRepository {
  Future<UserEntity> login({ required String  name , required String password});
  
}