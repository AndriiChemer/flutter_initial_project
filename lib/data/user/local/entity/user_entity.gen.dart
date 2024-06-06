import 'package:iteo_libraries_example/domain/user/user/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_entity.gen.g.dart';

@JsonSerializable()
class UserEntity {
  UserEntity({
    required this.name,
    required this.surname,
    required this.email,
  });

  factory UserEntity.fromJson(Map<String, dynamic> data) =>
      _$UserEntityFromJson(data);

  Map<String, dynamic> toJson() => _$UserEntityToJson(this);

  final String name;
  final String surname;
  final String email;

  User toUser() {
    return User(
      name: name,
      surname: surname,
      email: email,
    );
  }
}
