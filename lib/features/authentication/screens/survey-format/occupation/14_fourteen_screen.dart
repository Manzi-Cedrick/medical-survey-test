import 'package:app_test/common/answer-box/radiolist_answerbox_structure.dart';
import 'package:app_test/common/question-box/question_header.dart';
import 'package:app_test/common/section/previous_continue.dart';
import 'package:app_test/common/section/primary_section.dart';
import 'package:app_test/features/authentication/screens/survey-format/occupation/15_fifthteen_screen.dart';
import 'package:app_test/features/authentication/screens/survey-format/occupation/bloc/survey_form_bloc.dart';
import 'package:app_test/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FourTeenDetailScreen extends StatefulWidget {
  const FourTeenDetailScreen(
      {Key? key,
      this.canabisStatus = const ['Yes', 'No'],
      this.canabisStatusDuration = const [
        'Some days of out of the week daily',
        'Some days of out of the week weekly',
        'A couple of times a month',
        'A couple of times a year',
      ]})
      : super(key: key);
  final List<String> canabisStatus;
  final List<String> canabisStatusDuration;
  @override
  _FourTeenDetailScreenState createState() => _FourTeenDetailScreenState();
}

class _FourTeenDetailScreenState extends State<FourTeenDetailScreen> {
  int? selectedIndex;
  int? selectedIndex2;
  bool showSecondSection = false;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SurveyFormBloc, SurveyFormState>(
      listener: (context, state) {
        // TODO: implement listener

        if (state.smokeCannabis.isNotEmpty) {
          if (state.smokeCannabis == 'Yes') {
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
                      text: 'Do you smoke cannabis ?',
                    ),
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections),
                  TRadioListAnswerBox(
                    items: widget.canabisStatus,
                    selectedValue: selectedIndex,
                    onChanged: (value) {
                      setState(() {
                        selectedIndex = value; // Update the selected index
                        context.read<SurveyFormBloc>().add(
                            SurveyFormSmokeCannabisEvent(
                                widget.canabisStatus[value]));
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
                        text: 'How often do you smoke cannabis ?',
                      ),
                    ),
                    const SizedBox(height: TSizes.spaceBtwSections),
                    TRadioListAnswerBox(
                      items: widget.canabisStatusDuration,
                      selectedValue: selectedIndex2,
                      onChanged: (value) {
                        setState(() {
                          selectedIndex2 = value; // Update the selected index
                          context.read<SurveyFormBloc>().add(
                              SurveyFormOftenSmokeCannabis(
                                  widget.canabisStatusDuration[value]));
                        });
                      },
                    ),
                  ],
                ),
              ),
            TSectionFooterButtons(
              activateDisabled: state.smokeCannabis.isNotEmpty &&
                      (state.smokeCannabis == 'No' ||
                          (state.smokeCannabis == 'Yes' &&
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
                    builder: (context) => const FifthTeenDetailScreen(),
                  ),
                );
              },
            )
          ],
        ));
      },
    );
  }
}
