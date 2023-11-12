import 'package:login_app/domain/entities/activities_entity.dart';
import 'package:login_app/domain/entities/user_entity.dart';
import 'package:login_app/domain/repositories/activity_repository.dart';
import 'package:login_app/domain/repositories/user_repository.dart';

import '../../domain/usecases/user_use_case.dart';

class UserUseCaseImp implements UserUseCase {
  final UserRepository _userRepository;
  final ActivityRepository _activityRepository;

  UserUseCaseImp({
    required UserRepository userRepository,
    required ActivityRepository activityRepository
  }): _userRepository=userRepository, _activityRepository=activityRepository;
  
  @override
  Future<bool> addActivity(ActivitiesEntity activity) async{
    
    return await _activityRepository.addActivity(activity);
  }
  
  @override
  Future<bool> deleteActivity(int id) async {
    return await _activityRepository.deleteActivity(id);
  }
  
  @override
  Future<bool> deleteAllActivities() async{
    return await _activityRepository.deleteAllActivities();
  }
  
  @override
  Future<bool> editActivity(ActivitiesEntity newActivity) async {
    return _activityRepository.editActivity(newActivity);
  }
  
  @override
  Future<List<ActivitiesEntity>> fetchActivities() async{
    return await _activityRepository.fetchActivities();
  }
  
  @override
  Future<ActivitiesEntity?> fetchActivitiyId(int id) async{
    var result = await _activityRepository.fetchActivitiyId(id);
    return result;
  }
  
  @override
  Future<UserEntity?> login({required String name, required String password})async {
    try {
       var result = await _userRepository.login(name: name, password: password);
      return result;
    } catch (e) {
      print(e);
    }
   
  }
  
  @override
  Future<void> logout() async {
    await _userRepository.logout();
  }
  
  
}