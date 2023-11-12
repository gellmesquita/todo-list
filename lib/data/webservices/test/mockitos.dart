 import 'package:login_app/domain/entities/user_entity.dart';

class Mockito {
  static var user = <UserEntity>[
    UserEntity(name: "Gelson Mesquita", password: "Gelson#1234", id: "1", numberPhone: "1234567890"),
    UserEntity(name: "Fabio Mesquita", password: "Fabio#1234", id: "2", numberPhone: "1234567890"),
    UserEntity(name: "Jorge Mesquita", password: "Jorge#1234", id: "3", numberPhone: "1234567890"),
  ];
 }