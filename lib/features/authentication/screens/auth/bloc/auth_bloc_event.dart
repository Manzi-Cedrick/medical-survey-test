part of 'auth_bloc_bloc.dart';

class AuthBlocEvent extends Equatable {
  const AuthBlocEvent();

  @override
  List<Object> get props => [];
}

class AuthBlocStartEvent extends AuthBlocEvent {
  const AuthBlocStartEvent();
}

class AuthBlocUsernameEvent extends AuthBlocEvent {
  const AuthBlocUsernameEvent(this.username);
  final String username;

  @override
  List<Object> get props => [username];
}

class AuthBlocPasswordEvent extends AuthBlocEvent {
  const AuthBlocPasswordEvent(this.password);
  final String password;

  @override
  List<Object> get props => [password];
}

class AuthBlocEmailEvent extends AuthBlocEvent {
  const AuthBlocEmailEvent(this.email);
  final String email;

  @override
  List<Object> get props => [email];
}

class AuthBlocTelephoneEvent extends AuthBlocEvent {
  const AuthBlocTelephoneEvent(this.telephone);
  final String telephone;

  @override
  List<Object> get props => [telephone];
}

class AuthBlocTypeEvent extends AuthBlocEvent {
  const AuthBlocTypeEvent(this.type);
  final AuthType type;

  @override
  List<Object> get props => [type];
}

class AuthBlocSubmitEvent extends AuthBlocEvent {
  const AuthBlocSubmitEvent(this.status, this.userModel);
  final UserModel userModel;
  final AuthBlocStatus status;

  @override
  List<Object> get props => [status,userModel];
}
