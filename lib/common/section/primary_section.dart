import 'package:app_test/common/style/spacing_style.dart';
import 'package:app_test/features/survey-format/bloc/survey_form_bloc.dart';
import 'package:app_test/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TPrimarySectionLayout extends StatelessWidget {
  const TPrimarySectionLayout({super.key, required this.child});

  final Widget child;
  @override
  Widget build(BuildContext context) {
    double progress = 0.5;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: BlocConsumer<SurveyFormBloc, SurveyFormState>(
            listener: (context, state) {
            },
            builder: (context, state) {
              final currentPageIndex = state.currentPage;
              int totalPages = 20;
              progress = (currentPageIndex) / totalPages;
              return LinearProgressIndicator(
                value: progress,
                color: TColors.primary,
                backgroundColor: TColors.lightContainer,
              );
            },
          ),
        ),
      ),
      body: BlocConsumer<SurveyFormBloc, SurveyFormState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Padding(
              padding: TSpacingStyle.paddingWithAppBarHeight, child: child);
        },
      ),
    );
  }
}
