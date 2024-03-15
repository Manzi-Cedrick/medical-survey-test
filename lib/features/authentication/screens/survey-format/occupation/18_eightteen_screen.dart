import 'package:app_test/common/answer-box/checklist_answerbox_structure.dart';
import 'package:app_test/common/question-box/question_header.dart';
import 'package:app_test/common/section/previous_continue.dart';
import 'package:app_test/common/section/primary_section.dart';
import 'package:app_test/features/authentication/screens/survey-format/occupation/19_nineteen_screen.dart';
import 'package:app_test/features/authentication/screens/survey-format/occupation/bloc/survey_form_bloc.dart';
import 'package:app_test/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EightTeenDetailScreen extends StatefulWidget {
  const EightTeenDetailScreen({
    Key? key,
    this.isCheckList,
    this.drugTypes = const [
      'Opioids',
      'Sedatives/Tranquilizers',
      'Stimulate/Depressants',
      'Antidepressants',
      'Antipsychotics'
    ],
  }) : super(key: key);
  final List<String> drugTypes;
  final List<bool>? isCheckList;

  @override
  _EightTeenDetailScreenState createState() => _EightTeenDetailScreenState();
}

class _EightTeenDetailScreenState extends State<EightTeenDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final List<bool> checkList = widget.isCheckList ??
        List.generate(widget.drugTypes.length, (index) => false);
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
                  text:
                      'If you do take prescribed medication, what type of drugs are you being administered ?',
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwSections),
              TCheckListAnswerBox(
                items: widget.drugTypes,
                checkList: checkList,
                onChanged: (selectedIndices) {
                  final selectedDrugs = <String>[];
                  for (int index = 0; index < selectedIndices.length; index++) {
                    if (selectedIndices[index]) {
                      selectedDrugs.add(widget.drugTypes[index]);
                    }
                  }
                  context.read<SurveyFormBloc>().add(
                      SurveyFormPrescribedMedicationListEvent(selectedDrugs));
                },
              ),
              TSectionFooterButtons(
                activateDisabled:
                    state.prescribedMedicationList.isNotEmpty ? false : true,
                onPressed: () {
                  context
                      .read<SurveyFormBloc>()
                      .add(SurveyFormCurrentPage(state.currentPage + 1));
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const NineTeenDetailScreen(),
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
