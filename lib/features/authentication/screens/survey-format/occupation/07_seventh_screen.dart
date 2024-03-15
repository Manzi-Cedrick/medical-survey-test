import 'package:app_test/common/answer-box/radiolist_answerbox_structure.dart';
import 'package:app_test/common/question-box/question_header.dart';
import 'package:app_test/common/section/previous_continue.dart';
import 'package:app_test/common/section/primary_section.dart';
import 'package:app_test/features/authentication/screens/survey-format/occupation/08_eight_screen.dart';
import 'package:app_test/features/authentication/screens/survey-format/occupation/bloc/survey_form_bloc.dart';
import 'package:app_test/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SeventhDetailScreen extends StatefulWidget {
  const SeventhDetailScreen(
      {Key? key,
      this.lifeStatus = const ['Yes', 'Sometimes', 'Not really', 'Never']})
      : super(key: key);
  final List<String> lifeStatus;

  @override
  _SeventhDetailScreen createState() => _SeventhDetailScreen();
}

class _SeventhDetailScreen extends State<SeventhDetailScreen> {
  int? selectedIndex;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SurveyFormBloc, SurveyFormState>(
      listener: (context, state) {
        // TODO: implement listener
        // print(state.lifeStatusWithRoommates);
      },
      builder: (context, state) {
        return TPrimarySectionLayout(
          child: Column(
            children: [
              const SizedBox(height: TSizes.spaceBtwSections),
              const SizedBox(
                width: double.infinity,
                child: TQuestionHeader(
                  text:
                      'If you live with roommates or family, do you get along with them in your household ?',
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwSections),
              TRadioListAnswerBox(
                items: widget.lifeStatus,
                selectedValue: selectedIndex,
                onChanged: (value) {
                  setState(() {
                    selectedIndex = value; // Update the selected index
                    context.read<SurveyFormBloc>().add(
                          SurveyFormLifeStatusWithRoommatesEvent(
                              widget.lifeStatus[value]),
                        );
                  });
                },
              ),
              TSectionFooterButtons(
                  activateDisabled:
                      state.lifeStatusWithRoommates.isNotEmpty ? false : true,
                  onPressed: () {
                    context
                        .read<SurveyFormBloc>()
                        .add(SurveyFormCurrentPage(state.currentPage + 1));
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const EightDetailScreen()));
                  })
            ],
          ),
        );
      },
    );
  }
}
