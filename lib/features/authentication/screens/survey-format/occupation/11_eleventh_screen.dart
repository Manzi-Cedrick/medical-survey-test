import 'package:app_test/common/answer-box/radiolist_answerbox_structure.dart';
import 'package:app_test/common/question-box/question_header.dart';
import 'package:app_test/common/section/previous_continue.dart';
import 'package:app_test/common/section/primary_section.dart';
import 'package:app_test/features/authentication/screens/survey-format/occupation/12_twelve_screen.dart';
import 'package:app_test/features/authentication/screens/survey-format/occupation/bloc/survey_form_bloc.dart';
import 'package:app_test/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EleventhDetailScreen extends StatefulWidget {
  const EleventhDetailScreen(
      {Key? key,
      this.siblingsStatus = const ['Youngest', 'In the middle', 'Older']})
      : super(key: key);
  final List<String> siblingsStatus;
  @override
  _EleventhDetailScreenState createState() => _EleventhDetailScreenState();
}

class _EleventhDetailScreenState extends State<EleventhDetailScreen> {
  int? selectedIndex;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SurveyFormBloc, SurveyFormState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return TPrimarySectionLayout(
          child: Column(
            children: [
              const SizedBox(height: TSizes.spaceBtwSections),
              const SizedBox(
                width: double.infinity,
                child: TQuestionHeader(
                  text: 'Are you the youngest middle or older child ?',
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
                        SurveyFormSiblingsNumberStatusEvent(
                            widget.siblingsStatus[value]));
                  });
                },
              ),
              TSectionFooterButtons(
                activateDisabled:
                    state.siblingsNumberStatus.isNotEmpty ? false : true,
                onPressed: () {
                  context
                      .read<SurveyFormBloc>()
                      .add(SurveyFormCurrentPage(state.currentPage + 1));
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TwelvethDetailScreen(),
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
