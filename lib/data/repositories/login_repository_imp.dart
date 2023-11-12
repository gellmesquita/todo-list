import 'package:login_app/data/datasources/local/preferences/user_preferences.dart';
import 'package:login_app/data/webservices/login_webservice.dart';
import 'package:login_app/domain/entities/user_entity.dart';
import 'package:login_app/domain/repositories/user_repository.dart';

class UserRepositoryImp implements UserRepository {
  final LoginWebservice _loginWebservice;
  final UserPreferences _userPreferences;
  UserRepositoryImp({
    required LoginWebservice loginWebservice, 
    required UserPreferences userPreferences
  }): this._loginWebservice = loginWebservice, this._userPreferences = userPreferences; 
  
  Future<UserEntity> login({required String name, required String password}) async {
    return await _loginWebservice.login(name: name, password: password);
  }
  
  

}