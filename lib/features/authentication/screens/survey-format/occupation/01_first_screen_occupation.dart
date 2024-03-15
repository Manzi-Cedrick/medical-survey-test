import 'package:app_test/common/question-box/question_header.dart';
import 'package:app_test/common/answer-box/checklist_answerbox_structure.dart';
import 'package:app_test/common/section/previous_continue.dart';
import 'package:app_test/common/section/primary_section.dart';
import 'package:app_test/features/authentication/screens/survey-format/occupation/02_second_screen_hour.dart';
import 'package:app_test/features/authentication/screens/survey-format/occupation/04_fourth_screen.dart';
import 'package:app_test/features/authentication/screens/survey-format/occupation/bloc/survey_form_bloc.dart';
import 'package:app_test/utils/constants/api_constants.dart';
import 'package:app_test/utils/constants/sizes.dart';
import 'package:app_test/utils/theme/widget_themes/custom_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OccupationDetailScreen extends StatefulWidget {
  const OccupationDetailScreen({Key? key, this.isCheckList}) : super(key: key);

  final List<bool>? isCheckList;

  @override
  _OccupationDetailScreenState createState() => _OccupationDetailScreenState();
}

class _OccupationDetailScreenState extends State<OccupationDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final List<bool> checkList = widget.isCheckList ??
        List.generate(occupations.length, (index) => false);

    return Scaffold(
      body: BlocConsumer<SurveyFormBloc, SurveyFormState>(
        listener: (context, state) {},
        builder: (context, state) {
          return TPrimarySectionLayout(
            child: Column(
              children: [
                const SizedBox(height: TSizes.spaceBtwSections),
                const SizedBox(
                  width: double.infinity,
                  child: TQuestionHeader(
                    text: 'What is your Occupation(s) ?',
                  ),
                ),
                TCheckListAnswerBox(
                  items: occupations,
                  checkList: checkList,
                  onChanged: (selectedIndices) {
                    final selectedOccupations = <String>[];
                    for (int index = 0;
                        index < selectedIndices.length;
                        index++) {
                      if (selectedIndices[index]) {
                        selectedOccupations.add(occupations[index]);
                      }
                    }
                    context
                        .read<SurveyFormBloc>()
                        .add(SurveyFormOccupationEvent(selectedOccupations));

                    if (selectedOccupations.contains('None')) {
                      String occupationsText =
                          'None should not be selected'; // Convert list to a string
                      CustomSnackbar.show(context, occupationsText);
                      context
                          .read<SurveyFormBloc>()
                          .add(SurveyFormCurrentPage(state.currentPage + 2));

                      context
                          .read<SurveyFormBloc>()
                          .add(const SurveyFormIncrementCurrentPage(2));
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const FourthScreenDetail()),
                      );
                    }
                  },
                ),
                TSectionFooterButtons(
                  activateDisabled: state.occupation.isNotEmpty ? false : true,
                  onPressed: () {
                    if (state.occupation.contains('None') || checkList[occupations.indexOf('None')] == true) {
                      String occupationsText =
                          'None should not be selected'; // Convert list to a string
                      CustomSnackbar.show(context, occupationsText);
                      context
                          .read<SurveyFormBloc>()
                          .add(SurveyFormCurrentPage(state.currentPage + 2));

                      context
                          .read<SurveyFormBloc>()
                          .add(const SurveyFormIncrementCurrentPage(2));
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const FourthScreenDetail()),
                      );
                    } else {
                      context
                          .read<SurveyFormBloc>()
                          .add(SurveyFormCurrentPage(state.currentPage + 1));
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const SecondHourDetailScreen()),
                      );
                    }
                  },
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
