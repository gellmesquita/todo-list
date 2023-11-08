// ignore_for_file: dead_code
import 'package:login_app/data/webservices/login_webservice.dart';
import 'package:login_app/data/webservices/test/mockitos.dart';
import 'package:login_app/domain/entities/user_entity.dart';

class LoginWebserviceTest extends LoginWebservice{
  @override
  Future<UserEntity> login({required String name, required String password}) {
    // TODO: implement login
    var _success= true ;
    return Future.delayed(const Duration(milliseconds: 500), () {
      if (_success) {
        return Mockito.user.firstWhere((element) => element.name==name && element.password==password);
      } else {
        return Future.error("Falha na autenticação");
      }
    });
  }
}