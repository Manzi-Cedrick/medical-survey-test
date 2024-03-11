import 'package:app_test/common/answer-box/radiolist_answerbox_structure.dart';
import 'package:app_test/common/question-box/question_header.dart';
import 'package:app_test/common/section/previous_continue.dart';
import 'package:app_test/common/section/primary_section.dart';
import 'package:app_test/features/authentication/screens/survey-format/occupation/18_eightteen_screen.dart';
import 'package:app_test/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SevenTeenDetailScreen extends StatelessWidget {
  const SevenTeenDetailScreen(
      {Key? key,
      this.isCheckList,
      this.drugStatus = const [
        'Yes',
        'No'
      ],
      this.prescriptionStatus = const [
        'Yes',
        'No'
      ]
      })
      : super(key: key);
  final List<String> drugStatus;
  final List<String> prescriptionStatus;
  final List<bool>? isCheckList;
  @override
  Widget build(BuildContext context) {
    final List<bool> checkList =
        isCheckList ?? List.generate(drugStatus.length, (index) => false);
    final List<bool> checkSecondList =
        isCheckList ?? List.generate(prescriptionStatus.length, (index) => false);
    return TPrimarySectionLayout(
      child: Column(
        children: [
          const SizedBox(height: TSizes.spaceBtwSections),
          const SizedBox(
            width: double.infinity,
            child: TQuestionHeader(
              text: 'Do you take drugs ?',
            ),
          ),
          SizedBox(height: TSizes.spaceBtwSections),
          TRadioListAnswerBox(items: drugStatus, checkList: checkList, onChanged: (value) {}),

          const SizedBox(
            width: double.infinity,
            child: TQuestionHeader(
              text: 'If yes is it prescribed medication ?',
            ),
          ),
          SizedBox(height: TSizes.spaceBtwSections),
          TRadioListAnswerBox(items: prescriptionStatus, checkList: checkSecondList, onChanged: (value) {}),
          TSectionFooterButtons(
            onPressed: () => Get.to(const EightTeenDetailScreen()),
          )
        ],
      ),
    );
  }
}
