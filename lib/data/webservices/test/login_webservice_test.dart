// ignore_for_file: dead_code
import 'package:login_app/data/webservices/user_webservice.dart';
import 'package:login_app/data/webservices/test/mockitos.dart';
import 'package:login_app/domain/entities/user_entity.dart';

class UserWebserviceTest extends UserWebservice{
  @override
  Future<UserEntity> login({required String name, required String password}) {
    // TODO: implement login
    var _success= true ;
    return Future.delayed(const Duration(milliseconds: 500), () {
      if (_success) {
        var result= Mockito.user.firstWhere((element) => element.name==name && element.password==password);
        return result;
      } else {
        return Future.error("Falha na autenticação");
      }
    });
  }
}