import 'package:app_test/common/style/spacing_style.dart';
import 'package:app_test/features/authentication/screens/survey-format/occupation/bloc/survey_form_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TPrimarySectionLayout extends StatelessWidget {
  const TPrimarySectionLayout({super.key, required this.child});

  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<SurveyFormBloc, SurveyFormState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Padding(
              padding: TSpacingStyle.paddingWithAppBarHeight, child: child);
        },
      ),
    );
  }
}
