import 'package:app_test/common/answer-box/radiolist_answerbox_structure.dart';
import 'package:app_test/common/question-box/question_header.dart';
import 'package:app_test/common/section/previous_continue.dart';
import 'package:app_test/common/section/primary_section.dart';
import 'package:app_test/features/authentication/screens/survey-format/occupation/17_seventeen_screen.dart';
import 'package:app_test/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SixTeenDetailScreen extends StatelessWidget {
  const SixTeenDetailScreen(
      {Key? key,
      this.isCheckList,
      this.alcoholStatus = const [
        'Yes',
        'No'
      ],
      this.alcoholStatusDuration = const [
        'Some days of out of the week daily',
        'Some days of out of the week weekly',
        'A couple of times a month',
        'A couple of times a year',
      ]
      })
      : super(key: key);
  final List<String> alcoholStatus;
  final List<String> alcoholStatusDuration;
  final List<bool>? isCheckList;
  @override
  Widget build(BuildContext context) {
    final List<bool> checkList =
        isCheckList ?? List.generate(alcoholStatus.length, (index) => false);
    final List<bool> checkSecondList =
        isCheckList ?? List.generate(alcoholStatusDuration.length, (index) => false);
    return TPrimarySectionLayout(
      child: Column(
        children: [
          const SizedBox(height: TSizes.spaceBtwSections),
          const SizedBox(
            width: double.infinity,
            child: TQuestionHeader(
              text: 'Do you smoke alcohol ?',
            ),
          ),
          SizedBox(height: TSizes.spaceBtwSections),
          TRadioListAnswerBox(items: alcoholStatus, checkList: checkList, onChanged: (value) {}),

          const SizedBox(
            width: double.infinity,
            child: TQuestionHeader(
              text: 'If yes how often ?',
            ),
          ),
          SizedBox(height: TSizes.spaceBtwSections),
          TRadioListAnswerBox(items: alcoholStatusDuration, checkList: checkSecondList, onChanged: (value) {}),
          TSectionFooterButtons(
            onPressed: () => Get.to(const SevenTeenDetailScreen()),
          )
        ],
      ),
    );
  }
}
