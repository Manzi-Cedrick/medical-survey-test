import 'package:app_test/common/answer-box/radiolist_answerbox_structure.dart';
import 'package:app_test/common/question-box/question_header.dart';
import 'package:app_test/common/section/previous_continue.dart';
import 'package:app_test/common/section/primary_section.dart';
import 'package:app_test/features/authentication/screens/survey-format/occupation/15_fifthteen_screen.dart';
import 'package:app_test/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FourTeenDetailScreen extends StatelessWidget {
  const FourTeenDetailScreen(
      {Key? key,
      this.isCheckList,
      this.canabisStatus = const ['Yes', 'No'],
      this.canabisStatusDuration = const [
        'Some days of out of the week daily',
        'Some days of out of the week weekly',
        'A couple of times a month',
        'A couple of times a year',
      ]})
      : super(key: key);
  final List<String> canabisStatus;
  final List<String> canabisStatusDuration;
  final List<bool>? isCheckList;
  @override
  Widget build(BuildContext context) {
    final List<bool> checkList =
        isCheckList ?? List.generate(canabisStatus.length, (index) => false);
    final List<bool> checkSecondList =
        isCheckList ?? List.generate(canabisStatusDuration.length, (index) => false);
    return TPrimarySectionLayout(
      child: Column(
        children: [
          const SizedBox(height: TSizes.spaceBtwSections),
          const SizedBox(
            width: double.infinity,
            child: TQuestionHeader(
              text: 'Do you smoke cannabis ?',
            ),
          ),
          SizedBox(height: TSizes.spaceBtwSections),
          TRadioListAnswerBox(
              items: canabisStatus,
              checkList: checkList,
              onChanged: (value) {}),
          const SizedBox(
            width: double.infinity,
            child: TQuestionHeader(
              text: 'If yes how often ?',
            ),
          ),
          SizedBox(height: TSizes.spaceBtwSections),
          TRadioListAnswerBox(
              items: canabisStatusDuration,
              checkList: checkSecondList,
              onChanged: (value) {}),
          TSectionFooterButtons(
            onPressed: () => Get.to(const FifthTeenDetailScreen()),
          )
        ],
      ),
    );
  }
}
