import 'package:app_test/common/answer-box/radiolist_answerbox_structure.dart';
import 'package:app_test/common/question-box/question_header.dart';
import 'package:app_test/common/section/previous_continue.dart';
import 'package:app_test/common/section/primary_section.dart';
import 'package:app_test/features/authentication/screens/survey-format/occupation/08_eight_screen.dart';
import 'package:app_test/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SeventhDetailScreen extends StatelessWidget {
  const SeventhDetailScreen(
      {Key? key,
      this.isCheckList,
      this.lifeStatus = const [
        'Yes',
        'Sometimes',
        'Not really',
        'Never'
      ]})
      : super(key: key);
  final List<String> lifeStatus;
  final List<bool>? isCheckList;
  @override
  Widget build(BuildContext context) {
    final List<bool> checkList =
        isCheckList ?? List.generate(lifeStatus.length, (index) => false);
    return TPrimarySectionLayout(
      child: Column(
        children: [
          const SizedBox(height: TSizes.spaceBtwSections),
          const SizedBox(
            width: double.infinity,
            child: TQuestionHeader(
              text: 'If you live with roommates or family, do you get along with them in your household ?',
            ),
          ),
          SizedBox(height: TSizes.spaceBtwSections),
          TRadioListAnswerBox(items: lifeStatus, checkList: checkList, onChanged: (value) {}),
          TSectionFooterButtons(
            onPressed: () => Get.to(const EightDetailScreen()),
          )
        ],
      ),
    );
  }
}
