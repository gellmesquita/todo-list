import 'package:login_app/data/webservices/base/base_webservice.dart';
import 'package:login_app/domain/entities/user_entity.dart';


abstract class LoginWebservice extends BaseWebservice {
  Future<UserEntity> login({required String name, required String password});

}