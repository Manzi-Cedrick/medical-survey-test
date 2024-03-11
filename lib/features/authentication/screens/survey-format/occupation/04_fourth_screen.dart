import 'package:app_test/common/answer-box/radiolist_answerbox_structure.dart';
import 'package:app_test/common/question-box/question_header.dart';
import 'package:app_test/common/section/previous_continue.dart';
import 'package:app_test/common/section/primary_section.dart';
import 'package:app_test/features/authentication/screens/survey-format/occupation/05_fifth_screen.dart';
import 'package:app_test/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FourthScreenDetail extends StatelessWidget {
  const FourthScreenDetail(
      {Key? key,
      this.isCheckList,
      this.activityDuration = const [
        'Not enough',
        'Good amount',
        'More than enough'
      ]})
      : super(key: key);
  final List<String> activityDuration;
  final List<bool>? isCheckList;
  @override
  Widget build(BuildContext context) {
    final List<bool> checkList =
        isCheckList ?? List.generate(activityDuration.length, (index) => false);
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
          SizedBox(height: TSizes.spaceBtwSections),
          TRadioListAnswerBox(items: activityDuration, checkList: checkList, onChanged: (value) {}),
          TSectionFooterButtons(
            onPressed: () => Get.to(const FifthScreenDetail()),
          )
        ],
      ),
    );
  }
}
