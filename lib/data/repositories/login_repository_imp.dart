import 'package:login_app/data/webservices/test/login_webservice_test.dart';
import 'package:login_app/domain/entities/user_entity.dart';
import 'package:login_app/domain/repositories/login_repository.dart';

class LoginRepositoryImp implements LoginRepository {
  @override
  Future<UserEntity> login({required String name, required String password}) async {
    // TODO: implement login
    
    throw UnimplementedError();
  }
  

}