import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app_test/common/answer-box/radiolist_answerbox_structure.dart';
import 'package:app_test/common/question-box/question_header.dart';
import 'package:app_test/common/section/previous_continue.dart';
import 'package:app_test/common/section/primary_section.dart';
import 'package:app_test/features/authentication/screens/survey-format/occupation/04_fourth_screen.dart';
import 'package:app_test/features/authentication/screens/survey-format/occupation/bloc/survey_form_bloc.dart';
import 'package:app_test/utils/constants/sizes.dart';

class SecondHourDetailScreen extends StatefulWidget {
  const SecondHourDetailScreen({
    Key? key,
    this.occupationsHrs = const [
      'Less than 20 hours a week',
      '20 hours a week',
      'Around 30 or more hours',
      '40 hours a week',
      'More'
    ],
  }) : super(key: key);

  final List<String> occupationsHrs;

  @override
  _SecondHourDetailScreenState createState() => _SecondHourDetailScreenState();
}

class _SecondHourDetailScreenState extends State<SecondHourDetailScreen> {
  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SurveyFormBloc, SurveyFormState>(
      listener: (context, state) {
        // print(state.occupationHrs);
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
                      'How many hours of work/classes do they have each week ?',
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwSections),
              TRadioListAnswerBox(
                items: widget.occupationsHrs,
                selectedValue: selectedIndex,
                onChanged: (value) {
                  setState(() {
                    selectedIndex = value; // Update the selected index
                    context.read<SurveyFormBloc>().add(
                          SurveyFormOccupationHrsEvent(
                            widget.occupationsHrs[value],
                          ),
                        );
                  });
                },
              ),
              TSectionFooterButtons(
                activateDisabled: state.occupationHrs.isNotEmpty ? false : true,
                onPressed: () {
                  context
                      .read<SurveyFormBloc>()
                      .add(SurveyFormCurrentPage(state.currentPage + 1));
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => const FourthScreenDetail()),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
