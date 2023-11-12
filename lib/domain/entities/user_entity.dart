class UserEntity {
  final String name;
  final String id;
  final String numberPhone;
  final String password;
  UserEntity( {required this.id,required this.numberPhone,required this.name, required this.password});

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'password': password,
      'id': id,
      'numberPhone': numberPhone 
    };
  }

  factory UserEntity.fromJson(Map<String, dynamic> json) {
    return UserEntity(
      name: json['name'],
      password: json['password'],
      id: json['id'],
      numberPhone:  json['numberPhone']
    );
  }
}