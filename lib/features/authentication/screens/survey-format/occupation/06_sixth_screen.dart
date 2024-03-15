import 'package:app_test/common/answer-box/radiolist_answerbox_structure.dart';
import 'package:app_test/common/question-box/question_header.dart';
import 'package:app_test/common/section/previous_continue.dart';
import 'package:app_test/common/section/primary_section.dart';
import 'package:app_test/features/authentication/screens/survey-format/occupation/07_seventh_screen.dart';
import 'package:app_test/features/authentication/screens/survey-format/occupation/08_eight_screen.dart';
import 'package:app_test/features/authentication/screens/survey-format/occupation/bloc/survey_form_bloc.dart';
import 'package:app_test/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SixthScreenDetail extends StatefulWidget {
  const SixthScreenDetail(
      {Key? key,
      this.houseHoldStatuses = const ['Alone', 'Roommates', 'Family']})
      : super(key: key);
  final List<String> houseHoldStatuses;

  @override
  _SixthScreenDetail createState() => _SixthScreenDetail();
}

class _SixthScreenDetail extends State<SixthScreenDetail> {
  int? selectedIndex;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SurveyFormBloc, SurveyFormState>(
      listener: (context, state) {
        // TODO: implement listener
        // print(state.livingStatus)
      },
      builder: (context, state) {
        return TPrimarySectionLayout(
          child: Column(
            children: [
              const SizedBox(height: TSizes.spaceBtwSections),
              const SizedBox(
                width: double.infinity,
                child: TQuestionHeader(
                  text: 'Do you live alone, with roomates, or family ?',
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwSections),
              TRadioListAnswerBox(
                items: widget.houseHoldStatuses,
                selectedValue: selectedIndex,
                onChanged: (value) {
                  setState(() {
                    selectedIndex = value; // Update the selected index
                    context.read<SurveyFormBloc>().add(
                          SurveyFormLivingStatusEvent(
                            widget.houseHoldStatuses[value],
                          ),
                        );

                    if (widget.houseHoldStatuses[value] == 'Alone') {
                      context
                          .read<SurveyFormBloc>()
                          .add(SurveyFormCurrentPage(state.currentPage + 2));
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const EightDetailScreen()),
                      );
                    }
                  });
                },
              ),
              TSectionFooterButtons(
                activateDisabled: state.livingStatus.isNotEmpty 
                    ? false
                    : true,
                onPressed: () {
                  if (selectedIndex != null &&
                      widget.houseHoldStatuses[selectedIndex!] != 'Alone') {
                    context
                        .read<SurveyFormBloc>()
                        .add(SurveyFormCurrentPage(state.currentPage + 1));
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => const SeventhDetailScreen()),
                    );
                  } else {
                    context
                        .read<SurveyFormBloc>()
                        .add(SurveyFormCurrentPage(state.currentPage + 2));
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => const EightDetailScreen()),
                    );
                  }
                },
              )
            ],
          ),
        );
      },
    );
  }
}
