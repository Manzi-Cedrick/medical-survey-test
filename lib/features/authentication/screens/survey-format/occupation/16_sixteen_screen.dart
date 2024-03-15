import 'package:app_test/common/answer-box/radiolist_answerbox_structure.dart';
import 'package:app_test/common/question-box/question_header.dart';
import 'package:app_test/common/section/previous_continue.dart';
import 'package:app_test/common/section/primary_section.dart';
import 'package:app_test/features/authentication/screens/survey-format/occupation/17_seventeen_screen.dart';
import 'package:app_test/features/authentication/screens/survey-format/occupation/bloc/survey_form_bloc.dart';
import 'package:app_test/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SixTeenDetailScreen extends StatefulWidget {
  const SixTeenDetailScreen(
      {Key? key,
      this.alcoholStatus = const ['Yes', 'No'],
      this.alcoholStatusDuration = const [
        'Some days of out of the week daily',
        'Some days of out of the week weekly',
        'A couple of times a month',
        'A couple of times a year',
      ]})
      : super(key: key);
  final List<String> alcoholStatus;
  final List<String> alcoholStatusDuration;
  @override
  _SixTeenDetailScreenState createState() => _SixTeenDetailScreenState();
}

class _SixTeenDetailScreenState extends State<SixTeenDetailScreen> {
  int? selectedIndex;
  int? selectedIndex2;
  bool showSecondSection = false;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SurveyFormBloc, SurveyFormState>(
      listener: (context, state) {
        // TODO: implement listener

        if (state.drinkAlcohol.isNotEmpty) {
          if (state.drinkAlcohol == 'Yes') {
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
                flex: 2,
                child: Column(
                  children: [
                    const SizedBox(height: TSizes.spaceBtwSections),
                    const SizedBox(
                      width: double.infinity,
                      child: TQuestionHeader(
                        text: 'Do you smoke alcohol ?',
                      ),
                    ),
                    const SizedBox(height: TSizes.spaceBtwSections),
                    TRadioListAnswerBox(
                      items: widget.alcoholStatus,
                      selectedValue: selectedIndex,
                      onChanged: (value) {
                        setState(() {
                          selectedIndex = value; // Update the selected index
                          context.read<SurveyFormBloc>().add(
                              SurveyFormDrinkAlcoholEvent(
                                  widget.alcoholStatus[value]));
                        });
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwSections),
              if (showSecondSection)
                Flexible(
                  flex: 3,
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
                        items: widget.alcoholStatusDuration,
                        selectedValue: selectedIndex2,
                        onChanged: (value) {
                          setState(() {
                            selectedIndex2 = value; // Update the selected index
                            context.read<SurveyFormBloc>().add(
                                SurveyFormOftenDrinkAlcohol(
                                    widget.alcoholStatusDuration[value]));
                          });
                        },
                      ),
                    ],
                  ),
                ),
              TSectionFooterButtons(
                activateDisabled: state.drinkAlcohol.isNotEmpty &&
                        (state.drinkAlcohol == 'No' ||
                            (state.drinkAlcohol == 'Yes' &&
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
                      builder: (context) => const SevenTeenDetailScreen(),
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
