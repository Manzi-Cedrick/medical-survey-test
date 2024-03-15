import 'package:app_test/common/answer-box/radiolist_answerbox_structure.dart';
import 'package:app_test/common/question-box/question_header.dart';
import 'package:app_test/common/section/previous_continue.dart';
import 'package:app_test/common/section/primary_section.dart';
import 'package:app_test/features/authentication/screens/survey-format/occupation/05_fifth_screen.dart';
import 'package:app_test/features/authentication/screens/survey-format/occupation/bloc/survey_form_bloc.dart';
import 'package:app_test/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FourthScreenDetail extends StatefulWidget {
  const FourthScreenDetail(
      {Key? key,
      this.activityDuration = const [
        'Not enough',
        'Good amount',
        'More than enough'
      ]})
      : super(key: key);
  final List<String> activityDuration;

  @override
  _FourthScreenDetailState createState() => _FourthScreenDetailState();
}

class _FourthScreenDetailState extends State<FourthScreenDetail> {
  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SurveyFormBloc, SurveyFormState>(
      listener: (context, state) {
        // TODO: implement listener
        // print(state.physicalActivityDuration);
      },
      builder: (context, state) {
        return TPrimarySectionLayout(
          child: Column(
            children: [
              const SizedBox(height: TSizes.spaceBtwSections),
              const SizedBox(
                width: double.infinity,
                child: TQuestionHeader(
                  text: 'How much physical activities do you get in a day ?',
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwSections),
              TRadioListAnswerBox(
                items: widget.activityDuration,
                selectedValue: selectedIndex,
                onChanged: (value) {
                  setState(() {
                    selectedIndex = value;
                    context.read<SurveyFormBloc>().add(
                          SurveyFormPhysicalActivityDurationEvent(
                            widget.activityDuration[value],
                          ),
                        );
                  });
                },
              ),
              TSectionFooterButtons(
                activateDisabled:
                    state.physicalActivityDuration.isNotEmpty ? false : true,
                onPressed: () {
                  context
                      .read<SurveyFormBloc>()
                      .add(SurveyFormCurrentPage(state.currentPage + 1));
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return const FifthScreenDetail();
                  }));
                },
              )
            ],
          ),
        );
      },
    );
  }
}
