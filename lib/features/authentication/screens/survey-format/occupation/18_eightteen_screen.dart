import 'package:app_test/common/answer-box/checklist_answerbox_structure.dart';
import 'package:app_test/common/question-box/question_header.dart';
import 'package:app_test/common/section/previous_continue.dart';
import 'package:app_test/common/section/primary_section.dart';
import 'package:app_test/features/authentication/screens/survey-format/occupation/09_nineth_screen.dart';
import 'package:app_test/features/authentication/screens/survey-format/occupation/19_nineteen_screen.dart';
import 'package:app_test/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EightTeenDetailScreen extends StatelessWidget {
  const EightTeenDetailScreen({
    Key? key,
    this.isCheckList,
    this.drugTypes = const [
      'Opicide',
      'Sedatives/Tranquilizers',
      'Stimulate/Depressants',
      'Antidepressants',
      'Antipsychotics'
    ],
  }) : super(key: key);
  final List<String> drugTypes;
  final List<bool>? isCheckList;
  @override
  Widget build(BuildContext context) {
    final List<bool> checkList =
        isCheckList ?? List.generate(drugTypes.length, (index) => false);
    return TPrimarySectionLayout(
      child: Column(
        children: [
          const SizedBox(height: TSizes.spaceBtwSections),
          const SizedBox(
            width: double.infinity,
            child: TQuestionHeader(
              text: 'If you do take prescribed medication, what type of drugs are you being administered ?',
            ),
          ),
          SizedBox(height: TSizes.spaceBtwSections),
          TCheckListAnswerBox(
              items: drugTypes, checkList: checkList, onChanged: (value) {}),
          
          TSectionFooterButtons(
            onPressed: () => Get.to(const NineTeenDetailScreen()),
          )
        ],
      ),
    );
  }
}
