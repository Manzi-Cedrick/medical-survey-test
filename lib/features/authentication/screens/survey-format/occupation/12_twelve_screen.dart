import 'package:app_test/common/answer-box/radiolist_answerbox_structure.dart';
import 'package:app_test/common/question-box/question_header.dart';
import 'package:app_test/common/section/previous_continue.dart';
import 'package:app_test/common/section/primary_section.dart';
import 'package:app_test/features/authentication/screens/survey-format/occupation/13_thirteen_screen.dart';
import 'package:app_test/features/authentication/screens/survey-format/occupation/bloc/survey_form_bloc.dart';
import 'package:app_test/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TwelvethDetailScreen extends StatefulWidget {
  const TwelvethDetailScreen(
      {Key? key, this.homeMarietalStatus = const ['Yes', 'No']})
      : super(key: key);
  final List<String> homeMarietalStatus;

  @override
  _TwelvethDetailScreenState createState() => _TwelvethDetailScreenState();
}

class _TwelvethDetailScreenState extends State<TwelvethDetailScreen> {
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
                  text: 'Are you parents divorced ?',
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwSections),
              TRadioListAnswerBox(
                items: widget.homeMarietalStatus,
                selectedValue: selectedIndex,
                onChanged: (value) {
                  setState(() {
                    selectedIndex = value; // Update the selected index
                    context.read<SurveyFormBloc>().add(
                        SurveyFormParentsDivorcedEvent(
                            widget.homeMarietalStatus[value]));
                  });
                },
              ),
              TSectionFooterButtons(
                activateDisabled:
                    state.parentsDivorced.isNotEmpty ? false : true,
                onPressed: () {
                  context
                      .read<SurveyFormBloc>()
                      .add(SurveyFormCurrentPage(state.currentPage + 1));
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ThirteenthDetailScreen(),
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
