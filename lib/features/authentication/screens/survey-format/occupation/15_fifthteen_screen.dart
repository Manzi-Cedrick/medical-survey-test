import 'package:app_test/common/answer-box/radiolist_answerbox_structure.dart';
import 'package:app_test/common/question-box/question_header.dart';
import 'package:app_test/common/section/previous_continue.dart';
import 'package:app_test/common/section/primary_section.dart';
import 'package:app_test/features/authentication/screens/survey-format/occupation/16_sixteen_screen.dart';
import 'package:app_test/features/authentication/screens/survey-format/occupation/bloc/survey_form_bloc.dart';
import 'package:app_test/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FifthTeenDetailScreen extends StatefulWidget {
  const FifthTeenDetailScreen(
      {Key? key,
      this.cigarettesStatus = const ['Yes', 'No'],
      this.cigarettesStatusDuration = const [
        'Some days of out of the week daily',
        'Some days of out of the week weekly',
        'A couple of times a month',
        'A couple of times a year',
      ]})
      : super(key: key);

  final List<String> cigarettesStatus;
  final List<String> cigarettesStatusDuration;

  @override
  _FifthTeenDetailScreenState createState() => _FifthTeenDetailScreenState();
}

class _FifthTeenDetailScreenState extends State<FifthTeenDetailScreen> {
  int? selectedIndex;
  int? selectedIndex2;
  bool showSecondSection = false;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SurveyFormBloc, SurveyFormState>(
      listener: (context, state) {
        // TODO: implement listener

        if (state.smokeCigarettes.isNotEmpty) {
          if (state.smokeCigarettes == 'Yes') {
            setState(() {
              showSecondSection = true;
              print(showSecondSection);
            });
          } else {
            setState(() {
              showSecondSection = false;
            });
          }
        }
      },
      builder: (context, state) {
        return TPrimarySectionLayout(
          child: Column(
            mainAxisAlignment:
                MainAxisAlignment.start, // Align children at the start
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Flexible(
                flex: 1,
                child: Column(
                  children: [
                    const SizedBox(height: TSizes.spaceBtwSections),
                    const SizedBox(
                      width: double.infinity,
                      child: TQuestionHeader(
                        text: 'Do you smoke cigarettes ?',
                      ),
                    ),
                    const SizedBox(height: TSizes.spaceBtwSections),
                    // TRadioListAnswerBox(items: cigarettesStatus, checkList: checkList, onChanged: (value) {}),
                    TRadioListAnswerBox(
                      items: widget.cigarettesStatus,
                      selectedValue: selectedIndex,
                      onChanged: (value) {
                        setState(() {
                          selectedIndex = value; // Update the selected index
                          context.read<SurveyFormBloc>().add(
                              SurveyFormSmokeCigarettesEvent(
                                  widget.cigarettesStatus[value]));
                        });
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwSections),
              if (showSecondSection)
                Flexible(
                  flex: 2,
                  child: Column(
                    children: [
                      const SizedBox(
                        width: double.infinity,
                        child: TQuestionHeader(
                          text: 'If yes how often ?',
                        ),
                      ),
                      const SizedBox(height: TSizes.spaceBtwSections),
                      TRadioListAnswerBox(
                        items: widget.cigarettesStatusDuration,
                        selectedValue: selectedIndex2,
                        onChanged: (value) {
                          setState(() {
                            selectedIndex2 = value; // Update the selected index
                            context.read<SurveyFormBloc>().add(
                                SurveyFormOftenSmokeCigarettes(
                                    widget.cigarettesStatusDuration[value]));
                          });
                        },
                      ),
                    ],
                  ),
                ),
              TSectionFooterButtons(
                activateDisabled: state.smokeCigarettes.isNotEmpty &&
                        (state.smokeCigarettes == 'No' ||
                            (state.smokeCigarettes == 'Yes' &&
                                selectedIndex2 != null))
                    ? false
                    : true,
                onPressed: () {
                  context
                      .read<SurveyFormBloc>()
                      .add(SurveyFormCurrentPage(state.currentPage + 1));
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SixTeenDetailScreen(),
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
