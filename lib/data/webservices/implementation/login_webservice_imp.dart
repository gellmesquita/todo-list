import 'package:login_app/data/webservices/login_webservice.dart';
import 'package:login_app/domain/entities/user_entity.dart';

class LoginWebserviceImp extends LoginWebservice{
  @override
  Future<UserEntity> login({required String name, required String password}) {
    // TODO: implement login
    throw UnimplementedError();
  }

}