import 'package:login_app/application/usecases/user_use_case_imp.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:login_app/data/datasources/local/preferences/activity_preferences.dart';
import 'package:login_app/data/datasources/local/preferences/user_preferences.dart';
import 'package:login_app/data/repositories/activity_repository_imp.dart';
import 'package:login_app/data/repositories/user_repository_imp.dart';
import 'package:login_app/data/webservices/implementation/user_webservice_imp.dart';
import 'package:login_app/domain/entities/user_entity.dart';


void main() {
  final usecase = UserUseCaseImp(
    activityRepository: ActvityRepositoryImp(
      activityPreferences: ActivityPreferences()
    ),
    userRepository: UserRepositoryImp(
      userPreferences: UserPreferences(),
      userWebservice: UserWebserviceImp(), 
      activityPreferences: ActivityPreferences()
    ) 
  );
  test('verificar login use case imp', () async{
    final result = await usecase.login(name: "Gelson", password: "12345678");
    expect(result, isA<UserEntity>());
  });

}