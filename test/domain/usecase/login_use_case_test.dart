import 'package:login_app/application/usecases/login_use_case_imp.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:login_app/domain/entities/user_entity.dart';
void main() {
  final usecase = LoginUseCaseImp();
  test('verificar login use case imp', () async{
    final result = await usecase.login(name: "Gelson", password: "12345678");
    expect(result, isA<UserEntity>());
  });

}