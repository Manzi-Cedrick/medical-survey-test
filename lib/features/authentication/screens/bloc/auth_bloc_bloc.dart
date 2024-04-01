// ignore_for_file: use_build_context_synchronously

import 'package:app_test/features/authentication/model/user_model.dart';
import 'package:app_test/features/authentication/repo/user_repository.dart';
import 'package:app_test/features/authentication/screens/login/login_screen.dart';
import 'package:app_test/features/survey-format/screen/starter_screen_dob.dart';
import 'package:app_test/utils/theme/widget_themes/custom_snackbar.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
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
      try {
        final user = UserModel(
          email: state.email,
          password: state.password,
          userName: state.username,
          phoneNumber: state.telephone,
        );
        if (event.status == AuthBlocStatus.loading &&
            state.type != null &&
            state.email.isNotEmpty &&
            state.password.isNotEmpty) {
          if (state.type == AuthType.register) {
            final Map<String, dynamic> userResponse =
                await userRepository.registerUser(user);
            if (userResponse['user'] != null) {
              CustomSnackbar.show(
                  event.context, userResponse['message'], 'Success');
              emit(state.copyWith(status: AuthBlocStatus.success));
              Future.delayed(const Duration(seconds: 2), () {
                Navigator.push(
                  event.context,
                  MaterialPageRoute(builder: (context) => const SignIn()),
                );
              });
            } else {
              CustomSnackbar.show(
                  event.context, userResponse['message'], 'Error');
              emit(state.copyWith(status: AuthBlocStatus.failure));
            }
          } else if (state.type == AuthType.login &&
              state.email.isNotEmpty &&
              state.password.isNotEmpty) {
            final Map<String, dynamic> loginResponse =
                await userRepository.loginUser(user);
            if (loginResponse['token'] != null &&
                loginResponse['user'] != null) {
              CustomSnackbar.show(
                  event.context, loginResponse['message'], 'Success');
              await userRepository.storeToken(loginResponse['token']);
              await userRepository.storeUser(loginResponse['user']);
              Future.delayed(const Duration(seconds: 2), () {
                Navigator.push(
                  event.context,
                  MaterialPageRoute(builder: (context) => const DobScreen()),
                );
              });
              emit(state.copyWith(status: AuthBlocStatus.success));
            } else {
              CustomSnackbar.show(
                  event.context, loginResponse['message'], 'Error');
              emit(state.copyWith(status: AuthBlocStatus.failure));
            }
          }
        }
      } catch (e) {
        emit(state.copyWith(status: AuthBlocStatus.failure));
      }
    });
  }
}
