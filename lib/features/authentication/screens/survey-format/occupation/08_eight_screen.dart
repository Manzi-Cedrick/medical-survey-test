import 'package:app_test/common/answer-box/radiolist_answerbox_structure.dart';
import 'package:app_test/common/question-box/question_header.dart';
import 'package:app_test/common/section/previous_continue.dart';
import 'package:app_test/common/section/primary_section.dart';
import 'package:app_test/features/authentication/screens/survey-format/occupation/09_nineth_screen.dart';
import 'package:app_test/features/authentication/screens/survey-format/occupation/bloc/survey_form_bloc.dart';
import 'package:app_test/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EightDetailScreen extends StatefulWidget {
  const EightDetailScreen(
      {Key? key,
      this.relationshipStatus = const [
        'Yes',
        'No',
      ],
      this.relationshipStatusDuration = const [
        'Daily',
        'Weekly',
        'Monthly',
        'Annually',
        'Never'
      ]})
      : super(key: key);
  final List<String> relationshipStatus;
  final List<String> relationshipStatusDuration;

  @override
  _EightDetailScreen createState() => _EightDetailScreen();
}

class _EightDetailScreen extends State<EightDetailScreen> {
  int? selectedIndex;
  int? selectedIndex2;
  bool showSecondSection = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SurveyFormBloc, SurveyFormState>(
      listener: (context, state) {
        // Listener logic here

        if (state.closeWithFamilyRelationship.isNotEmpty) {
          if (state.closeWithFamilyRelationship == 'No') {
            setState(() {
              showSecondSection = true;
              // print(showSecondSection);
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
                        text: 'Are you close with your family and relatives ?',
                      ),
                    ),
                    const SizedBox(height: TSizes.spaceBtwSections),
                    TRadioListAnswerBox(
                      items: widget.relationshipStatus,
                      selectedValue: selectedIndex,
                      onChanged: (value) {
                        setState(() {
                          selectedIndex = value;
                          context.read<SurveyFormBloc>().add(
                                SurveyFormCloseWithFamilyRelationshipEvent(
                                    widget.relationshipStatus[value]),
                              );
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
                          text:
                              'How often do you speak with your family and relatives?',
                        ),
                      ),
                      const SizedBox(height: TSizes.spaceBtwSections),
                      TRadioListAnswerBox(
                        items: widget.relationshipStatusDuration,
                        selectedValue: selectedIndex2,
                        onChanged: (value) {
                          setState(() {
                            selectedIndex2 = value;
                            context.read<SurveyFormBloc>().add(
                                SurveyFormOftenInteractionWithFamily(
                                    widget.relationshipStatusDuration[value]));
                          });
                        },
                      ),
                    ],
                  ),
                ),
              TSectionFooterButtons(
                activateDisabled:
                    state.closeWithFamilyRelationship.isNotEmpty &&
                            (state.closeWithFamilyRelationship == 'Yes' ||
                                (state.closeWithFamilyRelationship == 'No' &&
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
                        builder: (_) => const NinthDetailScreen()),
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
