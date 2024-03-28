import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String? email;
  final String? password;
  final String? userName;
  final String? phoneNumber;
  final String? gender;
  final String? birthDate;
  final String? id;

  const UserModel({
    this.email,
    this.password,
    this.userName,
    this.phoneNumber,
    this.gender,
    this.birthDate,
    this.id,
  });

  @override
  List<Object?> get props =>
      [email, password, userName, phoneNumber, gender, birthDate, id];

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      email: json['email'],
      password: json['password'],
      userName: json['userName'],
      phoneNumber: json['phoneNumber'],
      gender: json['gender'],
      birthDate: json['birthDate'],
      id: json['_id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
      'userName': userName,
      'phoneNumber': phoneNumber,
      'gender': gender,
      'birthDate': birthDate,
      '_id': id,
    };
  }

  UserModel copyWith(
      {String? email,
      String? password,
      String? userName,
      String? phoneNumber,
      String? birthDate,
      String? id,
      String? gender}) {
    return UserModel(
      email: email ?? this.email,
      password: password ?? this.password,
      userName: userName ?? this.userName,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      gender: gender ?? this.gender,
      birthDate: birthDate ?? this.birthDate,
      id: id ?? this.id,
    );
  }

  @override
  String toString() {
    return 'UserModel{email: $email, password: $password, userName: $userName, phoneNumber: $phoneNumber, gender: $gender, birthDate: $birthDate, id: $id}';
  }
}
