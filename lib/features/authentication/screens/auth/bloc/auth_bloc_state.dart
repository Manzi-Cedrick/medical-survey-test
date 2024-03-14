part of 'auth_bloc_bloc.dart';

enum AuthBlocStatus {
  initial,
  loading,
  success,
  failure
}
class AuthBlocState extends Equatable {
  const AuthBlocState({
    required this.username,
    required this.password,
    required this.email,
    required this.telephone,
    required this.status
  });
  
  final String username;
  final String password;
  final String email;
  final String telephone;
  final AuthBlocStatus status;

  @override
  List<Object> get props => [
    username,
    password,
    email,
    telephone,
    status
  ];

  AuthBlocState copyWith({
    String? username,
    String? password,
    String? email,
    String? telephone,
    AuthBlocStatus? status
  }) {
    return AuthBlocState(
      username: username ?? this.username,
      password: password ?? this.password,
      email: email ?? this.email,
      telephone: telephone ?? this.telephone,
      status: status ?? this.status
    );
  }
}

final class AuthBlocInitial extends AuthBlocState {
  const AuthBlocInitial() : super(
    username: '',
    password: '',
    email: '',
    telephone: '',
    status: AuthBlocStatus.initial
  );
}
