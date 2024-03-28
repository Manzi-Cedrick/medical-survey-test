import 'package:app_test/features/authentication/screens/auth/model/user_model.dart';
import 'package:app_test/features/authentication/screens/auth/repo/user_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'auth_bloc_event.dart';
part 'auth_bloc_state.dart';

class AuthBlocBloc extends Bloc<AuthBlocEvent, AuthBlocState> {
  final UserRepository userRepository;

  AuthBlocBloc(this.userRepository) : super(const AuthBlocInitial()) {
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
    on<AuthBlocTypeEvent>((event, emit) {
      emit(state.copyWith(type: event.type));
    });
    
    on<AuthBlocSubmitEvent>((event, emit) async {
      emit(state.copyWith(status: event.status));
      print(event.userModel);
      try {
        UserModel userModel;

        if (event.status == AuthBlocStatus.success) {
          if (state.type == AuthType.register) {
            userModel = await userRepository.registerUser(event.userModel);
            print(userModel.toString());
          } else if (state.type == AuthType.login) {
            userModel = await userRepository.loginUser(event.userModel);
          }
        }
        emit(state.copyWith(status: AuthBlocStatus.success));
      } catch (e) {
        emit(state.copyWith(status: AuthBlocStatus.failure));
      }
    });
  }
}
