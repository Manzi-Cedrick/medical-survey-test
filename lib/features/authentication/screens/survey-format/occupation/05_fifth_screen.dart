import 'package:app_test/common/answer-box/radiolist_answerbox_structure.dart';
import 'package:app_test/common/question-box/question_header.dart';
import 'package:app_test/common/section/previous_continue.dart';
import 'package:app_test/common/section/primary_section.dart';
import 'package:app_test/features/authentication/screens/survey-format/occupation/06_sixth_screen.dart';
import 'package:app_test/features/authentication/screens/survey-format/occupation/bloc/survey_form_bloc.dart';
import 'package:app_test/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FifthScreenDetail extends StatefulWidget {
  const FifthScreenDetail(
      {Key? key,
      this.populationStatuses = const ['Rural', 'Suburban', 'Urban']})
      : super(key: key);
  final List<String> populationStatuses;

  @override
  _FifthScreenDetailState createState() => _FifthScreenDetailState();
}

class _FifthScreenDetailState extends State<FifthScreenDetail> {
  int? selectedIndex;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SurveyFormBloc, SurveyFormState>(
      listener: (context, state) {
        // TODO: implement listener
        // print(state.areaStructure);
      },
      builder: (context, state) {
        return TPrimarySectionLayout(
          child: Column(
            children: [
              const SizedBox(height: TSizes.spaceBtwSections),
              const SizedBox(
                width: double.infinity,
                child: TQuestionHeader(
                  text: 'Do you live in a less or more populated areas ?',
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwSections),
              TRadioListAnswerBox(
                items: widget.populationStatuses,
                selectedValue: selectedIndex,
                onChanged: (value) {
                  setState(() {
                    selectedIndex = value; // Update the selected index
                    context.read<SurveyFormBloc>().add(
                          SurveyFormAreaStructureEvent(
                            widget.populationStatuses[value],
                          ),
                        );
                  });
                },
              ),
              TSectionFooterButtons(
                  activateDisabled:
                      state.areaStructure.isNotEmpty ? false : true,
                  onPressed: () {
                    context
                        .read<SurveyFormBloc>()
                        .add(SurveyFormCurrentPage(state.currentPage + 1));
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const SixthScreenDetail()));
                  })
            ],
          ),
        );
      },
    );
  }
}
