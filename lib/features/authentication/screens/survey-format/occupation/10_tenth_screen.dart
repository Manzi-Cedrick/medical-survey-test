import 'package:app_test/common/answer-box/radiolist_answerbox_structure.dart';
import 'package:app_test/common/question-box/question_header.dart';
import 'package:app_test/common/section/previous_continue.dart';
import 'package:app_test/common/section/primary_section.dart';
import 'package:app_test/features/authentication/screens/survey-format/occupation/11_eleventh_screen.dart';
import 'package:app_test/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TenthDetailScreen extends StatelessWidget {
  const TenthDetailScreen(
      {Key? key,
      this.isCheckList,
      this.siblingsStatus = const [
        '1',
        '2',
        '3',
        '4',
        'More',
        'None'
      ]})
      : super(key: key);
  final List<String> siblingsStatus;
  final List<bool>? isCheckList;
  @override
  Widget build(BuildContext context) {
    final List<bool> checkList =
        isCheckList ?? List.generate(siblingsStatus.length, (index) => false);
    return TPrimarySectionLayout(
      child: Column(
        children: [
          const SizedBox(height: TSizes.spaceBtwSections),
          const SizedBox(
            width: double.infinity,
            child: TQuestionHeader(
              text: 'How many siblings do you have ?',
            ),
          ),
          SizedBox(height: TSizes.spaceBtwSections),
          TRadioListAnswerBox(items: siblingsStatus, checkList: checkList, onChanged: (value) {}),
          TSectionFooterButtons(
            onPressed: () => Get.to(const EleventhDetailScreen()),
          )
        ],
      ),
    );
  }
}
