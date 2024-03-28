part of 'auth_bloc_bloc.dart';

enum AuthBlocStatus {
  initial,
  loading,
  success,
  failure
}
enum AuthType {
  login,
  register
}
class AuthBlocState extends Equatable {
  const AuthBlocState({
    required this.username,
    required this.password,
    required this.email,
    required this.telephone,
    required this.status,
    this.type,
  });
  
  final String username;
  final String password;
  final String email;
  final String telephone;
  final AuthBlocStatus status;
  final AuthType? type;
  final UserModel user = const UserModel();

  @override
  List<Object?> get props => [
    username,
    password,
    email,
    telephone,
    status,
    type
  ];

  AuthBlocState copyWith({
    String? username,
    String? password,
    String? email,
    String? telephone,
    AuthBlocStatus? status,
    AuthType? type
  }) {
    return AuthBlocState(
      username: username ?? this.username,
      password: password ?? this.password,
      email: email ?? this.email,
      telephone: telephone ?? this.telephone,
      status: status ?? this.status,
      type: type ?? this.type
    );
  }
}

final class AuthBlocInitial extends AuthBlocState {
  const AuthBlocInitial() : super(
    username: '',
    password: '',
    email: '',
    telephone: '',
    status: AuthBlocStatus.initial,
    type: null
  );
}
