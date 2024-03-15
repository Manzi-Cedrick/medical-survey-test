import 'package:app_test/common/answer-box/radiolist_answerbox_structure.dart';
import 'package:app_test/common/question-box/question_header.dart';
import 'package:app_test/common/section/previous_continue.dart';
import 'package:app_test/common/section/primary_section.dart';
import 'package:app_test/features/authentication/screens/survey-format/occupation/18_eightteen_screen.dart';
import 'package:app_test/features/authentication/screens/survey-format/occupation/bloc/survey_form_bloc.dart';
import 'package:app_test/features/authentication/screens/survey-format/occupation/final_display_screen.dart';
import 'package:app_test/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SevenTeenDetailScreen extends StatefulWidget {
  const SevenTeenDetailScreen(
      {Key? key,
      this.drugStatus = const ['Yes', 'No'],
      this.prescriptionStatus = const ['Yes', 'No']})
      : super(key: key);
  final List<String> drugStatus;
  final List<String> prescriptionStatus;
  @override
  _SevenTeenDetailScreenState createState() => _SevenTeenDetailScreenState();
}

class _SevenTeenDetailScreenState extends State<SevenTeenDetailScreen> {
  int? selectedIndex;
  int? selectedIndex2;
  bool showSecondSection = false;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SurveyFormBloc, SurveyFormState>(
      listener: (context, state) {
        // TODO: implement listener

        if (state.drugConsumption.isNotEmpty) {
          if (state.drugConsumption == 'Yes') {
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
                        text: 'Do you take drugs ?',
                      ),
                    ),
                    const SizedBox(height: TSizes.spaceBtwSections),
                    TRadioListAnswerBox(
                      items: widget.drugStatus,
                      selectedValue: selectedIndex,
                      onChanged: (value) {
                        setState(() {
                          selectedIndex = value; // Update the selected index
                          context.read<SurveyFormBloc>().add(
                              SurveyFormDrugConsumptionEvent(
                                  widget.drugStatus[value]));

                          if (widget.drugStatus[value] == 'No') {
                            context.read<SurveyFormBloc>().add(
                                SurveyFormCurrentPage(state.currentPage + 3));

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const DisplayScreen(),
                              ),
                            );
                            context
                                .read<SurveyFormBloc>()
                                .add(const SurveyFormIncrementCurrentPage(3));

                            context
                                .read<SurveyFormBloc>()
                                .add(const SurveyFormResetEventOptionals());
                          }
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
                          text: 'If yes is it prescribed medication ?',
                        ),
                      ),
                      const SizedBox(height: TSizes.spaceBtwSections),
                      TRadioListAnswerBox(
                        items: widget.prescriptionStatus,
                        selectedValue: selectedIndex2,
                        onChanged: (value) {
                          setState(() {
                            selectedIndex2 = value; // Update the selected index
                            context.read<SurveyFormBloc>().add(
                                SurveyFormPrescribedMedication(
                                    widget.prescriptionStatus[value]));
                          });
                        },
                      ),
                    ],
                  ),
                ),
              TSectionFooterButtons(
                activateDisabled: state.drugConsumption.isNotEmpty &&
                        (state.drugConsumption == 'No' ||
                            (state.drugConsumption == 'Yes' &&
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
                      builder: (context) => const EightTeenDetailScreen(),
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
