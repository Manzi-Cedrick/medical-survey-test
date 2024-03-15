import 'package:app_test/common/answer-box/radiolist_answerbox_structure.dart';
import 'package:app_test/common/question-box/question_header.dart';
import 'package:app_test/common/section/previous_continue.dart';
import 'package:app_test/common/section/primary_section.dart';
import 'package:app_test/features/authentication/screens/survey-format/occupation/11_eleventh_screen.dart';
import 'package:app_test/features/authentication/screens/survey-format/occupation/12_twelve_screen.dart';
import 'package:app_test/features/authentication/screens/survey-format/occupation/bloc/survey_form_bloc.dart';
import 'package:app_test/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TenthDetailScreen extends StatefulWidget {
  const TenthDetailScreen(
      {Key? key,
      this.siblingsStatus = const ['1', '2', '3', '4', 'More', 'None']})
      : super(key: key);
  final List<String> siblingsStatus;
  @override
  _TenthDetailScreenState createState() => _TenthDetailScreenState();
}

class _TenthDetailScreenState extends State<TenthDetailScreen> {
  int? selectedIndex;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SurveyFormBloc, SurveyFormState>(
      listener: (context, state) {},
      builder: (context, state) {
        return TPrimarySectionLayout(
          child: Column(
            children: [
              const SizedBox(height: TSizes.spaceBtwSections),
              const SizedBox(
                width: double.infinity,
                child: TQuestionHeader(
                  text: 'How many siblings do you have ?',
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwSections),
              TRadioListAnswerBox(
                items: widget.siblingsStatus,
                selectedValue: selectedIndex,
                onChanged: (value) {
                  setState(() {
                    selectedIndex = value; // Update the selected index
                    context.read<SurveyFormBloc>().add(
                        SurveyFormSiblingsNumberEvent(
                            widget.siblingsStatus[value]));

                    // if state is None, then navigate to the next screen
                    if (widget.siblingsStatus[value] == 'None') {
                      context
                          .read<SurveyFormBloc>()
                          .add(SurveyFormCurrentPage(state.currentPage + 2));
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const TwelvethDetailScreen(),
                        ),
                      );
                    }
                  });
                },
              ),
              TSectionFooterButtons(
                activateDisabled:
                    state.siblingsNumber.isNotEmpty ? false : true,
                onPressed: () {
                  context
                      .read<SurveyFormBloc>()
                      .add(SurveyFormCurrentPage(state.currentPage + 1));
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const EleventhDetailScreen(),
                    ),
                  );
                },
              )
            ],
          ),
        );
      },
    );
  }
}
