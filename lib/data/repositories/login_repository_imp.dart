import 'package:login_app/data/webservices/login_webservice.dart';
import 'package:login_app/domain/entities/user_entity.dart';
import 'package:login_app/domain/repositories/login_repository.dart';

class LoginRepositoryImp implements LoginRepository {
  final LoginWebservice _loginWebservice;
  LoginRepositoryImp({required LoginWebservice loginWebservice}): this._loginWebservice = loginWebservice; 
  
  Future<UserEntity> login({required String name, required String password}) async {
    
    return await _loginWebservice.login(name: name, password: password);
    
  }
  

}