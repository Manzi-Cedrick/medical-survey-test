import 'package:app_test/common/answer-box/radiolist_answerbox_structure.dart';
import 'package:app_test/common/question-box/question_header.dart';
import 'package:app_test/common/section/previous_continue.dart';
import 'package:app_test/common/section/primary_section.dart';
import 'package:app_test/features/authentication/screens/survey-format/occupation/10_tenth_screen.dart';
import 'package:app_test/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NinthDetailScreen extends StatelessWidget {
  const NinthDetailScreen(
      {Key? key,
      this.isCheckList,
      this.commonRebutals = const [
        'Yes',
        'No'
      ]})
      : super(key: key);
  final List<String> commonRebutals;
  final List<bool>? isCheckList;
  @override
  Widget build(BuildContext context) {
    final List<bool> checkList =
        isCheckList ?? List.generate(commonRebutals.length, (index) => false);
    return TPrimarySectionLayout(
      child: Column(
        children: [
          const SizedBox(height: TSizes.spaceBtwSections),
          const SizedBox(
            width: double.infinity,
            child: TQuestionHeader(
              text: 'Is it common to rebuttal with your family/relatives ?',
            ),
          ),
          SizedBox(height: TSizes.spaceBtwSections),
          TRadioListAnswerBox(items: commonRebutals, checkList: checkList, onChanged: (value) {}),
          TSectionFooterButtons(
            onPressed: () => Get.to(const TenthDetailScreen()),
          )
        ],
      ),
    );
  }
}
