import 'package:app_test/common/answer-box/radiolist_answerbox_structure.dart';
import 'package:app_test/common/question-box/question_header.dart';
import 'package:app_test/common/section/previous_continue.dart';
import 'package:app_test/common/section/primary_section.dart';
import 'package:app_test/features/authentication/screens/survey-format/occupation/09_nineth_screen.dart';
import 'package:app_test/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EightDetailScreen extends StatelessWidget {
  const EightDetailScreen(
      {Key? key,
      this.isCheckList,
      this.relationshipStatus = const [
        'Yes',
        'Sometimes',
        'Not really',
        'Never'
      ],
      this.relationshipStatusDuration = const [
        'Daily',
        'Weekly',
        'Monthly',
        'Annually'
        'Never'
      ]
      })
      : super(key: key);
  final List<String> relationshipStatus;
  final List<String> relationshipStatusDuration;
  final List<bool>? isCheckList;
  @override
  Widget build(BuildContext context) {
    final List<bool> checkList =
        isCheckList ?? List.generate(relationshipStatus.length, (index) => false);
    final List<bool> checkSecondList =
        isCheckList ?? List.generate(relationshipStatusDuration.length, (index) => false);
    return TPrimarySectionLayout(
      child: Column(
        children: [
          const SizedBox(height: TSizes.spaceBtwSections),
          const SizedBox(
            width: double.infinity,
            child: TQuestionHeader(
              text: 'Are you close with your family and relatives ?',
            ),
          ),
          SizedBox(height: TSizes.spaceBtwSections),
          TRadioListAnswerBox(items: relationshipStatus, checkList: checkList, onChanged: (value) {}),

          const SizedBox(
            width: double.infinity,
            child: TQuestionHeader(
              text: 'How often do you speak with your family and relatives ?',
            ),
          ),
          SizedBox(height: TSizes.spaceBtwSections),
          TRadioListAnswerBox(items: relationshipStatusDuration, checkList: checkSecondList, onChanged: (value) {}),
          TSectionFooterButtons(
            onPressed: () => Get.to(const NinthDetailScreen()),
          )
        ],
      ),
    );
  }
}
