import 'package:app_test/common/answer-box/radiolist_answerbox_structure.dart';
import 'package:app_test/common/question-box/question_header.dart';
import 'package:app_test/common/section/previous_continue.dart';
import 'package:app_test/common/section/primary_section.dart';
import 'package:app_test/features/authentication/screens/survey-format/occupation/13_thirteen_screen.dart';
import 'package:app_test/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TwelvethDetailScreen extends StatelessWidget {
  const TwelvethDetailScreen(
      {Key? key,
      this.isCheckList,
      this.homeMarietalStatus = const [
        'Yes',
        'No'
      ]})
      : super(key: key);
  final List<String> homeMarietalStatus;
  final List<bool>? isCheckList;
  @override
  Widget build(BuildContext context) {
    final List<bool> checkList =
        isCheckList ?? List.generate(homeMarietalStatus.length, (index) => false);
    return TPrimarySectionLayout(
      child: Column(
        children: [
          const SizedBox(height: TSizes.spaceBtwSections),
          const SizedBox(
            width: double.infinity,
            child: TQuestionHeader(
              text: 'Are you parents divorced ?',
            ),
          ),
          SizedBox(height: TSizes.spaceBtwSections),
          TRadioListAnswerBox(items: homeMarietalStatus, checkList: checkList, onChanged: (value) {}),
          TSectionFooterButtons(
            onPressed: () => Get.to(const ThirteenthDetailScreen()),
          )
        ],
      ),
    );
  }
}
