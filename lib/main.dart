import 'package:app_test/app.dart';
import 'package:app_test/features/authentication/repo/user_repository.dart';
import 'package:app_test/features/authentication/screens/bloc/auth_bloc_bloc.dart';
import 'package:app_test/features/survey-format/bloc/survey_form_bloc.dart';
import 'package:app_test/features/survey-format/repo/survey_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiBlocProvider(providers: [
    BlocProvider(
        create: (BuildContext context) => SurveyFormBloc(SurveyRepository())),
    BlocProvider(
        create: (BuildContext context) => AuthBlocBloc(UserRepository())),
  ], child: const App()));
}
