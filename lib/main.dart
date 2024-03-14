import 'package:app_test/app.dart';
import 'package:app_test/features/authentication/screens/auth/bloc/auth_bloc_bloc.dart';
import 'package:app_test/features/authentication/screens/survey-format/occupation/bloc/survey_form_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MultiBlocProvider(providers: [
    BlocProvider(create: (BuildContext context) => SurveyFormBloc()),
    BlocProvider(create: (BuildContext context) => AuthBlocBloc()),
  ], child: const App()));
}
