
import 'package:json_annotation/json_annotation.dart';

part 'models.g.dart';

@JsonSerializable()
class APIModel {
  String id;
  String firstName;
  String lastName;
  String username;
  String emailAddress;
  String password;

  APIModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.emailAddress,
    required this.username,
    required this.password,
  });

  factory APIModel.fromMap(Map<String, dynamic> json)=>_$APIModelFromJson(json);
  Map<String, dynamic> toMap() => _$APIModelToJson(this);

  @override
  String toString() {
    return 'APIModel {id: $id, first_name: $firstName, last_name: $lastName, username: $username, email: $emailAddress, password: $password}';
  }
}
