import 'package:login_app/data/datasources/local/preferences/activity_preferences.dart';
import 'package:login_app/data/datasources/local/preferences/user_preferences.dart';
import 'package:login_app/data/webservices/user_webservice.dart';
import 'package:login_app/domain/entities/user_entity.dart';
import 'package:login_app/domain/repositories/user_repository.dart';

class UserRepositoryImp implements UserRepository {
  final UserWebservice _userWebservice;
  final UserPreferences _userPreferences;
  final ActivityPreferences _activityPreferences;
  UserRepositoryImp({
    required UserWebservice userWebservice, 
    required UserPreferences userPreferences,
    required ActivityPreferences activityPreferences
  }): this._userWebservice = userWebservice, 
  this._userPreferences = userPreferences,
  this._activityPreferences = activityPreferences
  ; 
  

  @override
  Future<UserEntity?> fetchUser()async {
    // TODO: implement fetchUser
    var result= await _userPreferences.getUser();

    return result;
    
  }
  
  @override
  Future<bool> logout() async{
    // TODO: implement logout
    await _userPreferences.deleteUser();
    await _activityPreferences.deleteAllActivities();
    
    throw UnimplementedError();
  }
  
  @override
  Future<UserEntity?> login({required String name, required String password}) async{
   
    var result= await _userWebservice.login(name: name, password: password);
    // ignore: unnecessary_null_comparison
    if(result!=null){
      await _userPreferences.saveUser(result);
    }
    return result;
   
  }
  


  
  

}