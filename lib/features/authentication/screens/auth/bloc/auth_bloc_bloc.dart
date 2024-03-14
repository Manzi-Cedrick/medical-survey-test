import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'auth_bloc_event.dart';
part 'auth_bloc_state.dart';

class AuthBlocBloc extends Bloc<AuthBlocEvent, AuthBlocState> {
  AuthBlocBloc() : super(const AuthBlocInitial()) {
    on<AuthBlocStartEvent>((event, emit) {
      emit(const AuthBlocInitial());
    });
    on<AuthBlocUsernameEvent>((event, emit) {
      emit(state.copyWith(username: event.username));
    });
    on<AuthBlocPasswordEvent>((event, emit) {
      emit(state.copyWith(password: event.password));
    });
    on<AuthBlocEmailEvent>((event, emit) {
      emit(state.copyWith(email: event.email));
    });
    on<AuthBlocTelephoneEvent>((event, emit) {
      emit(state.copyWith(telephone: event.telephone));
    });
    on<AuthBlocSubmitEvent>((event, emit) {
      emit(state.copyWith(status: event.status));
    });
  }
}
