 import 'package:login_app/domain/entities/user_entity.dart';

class Mockito {
  static var user = <UserEntity>[
    UserEntity(name: "Gelson", password: "1234", id: "1", numberPhone: "1234567890"),
    UserEntity(name: "Fabio", password: "1234", id: "2", numberPhone: "1234567890"),
    UserEntity(name: "Jorge", password: "1234", id: "3", numberPhone: "1234567890"),
  ];
 }