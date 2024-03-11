import 'package:app_test/common/answer-box/radiolist_answerbox_structure.dart';
import 'package:app_test/common/question-box/question_header.dart';
import 'package:app_test/common/section/previous_continue.dart';
import 'package:app_test/common/section/primary_section.dart';
import 'package:app_test/features/authentication/screens/survey-format/occupation/04_fourth_screen.dart';
import 'package:app_test/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SecondHourDetailScreen extends StatelessWidget {
  const SecondHourDetailScreen(
      {Key? key,
      this.isCheckList,
      this.occupationsHrs = const [
        'Less than 20 hours a week',
        '20 hours a week',
        'Around 30 or more hours',
        '40 hours a week',
        'More'
      ]})
      : super(key: key);
  final List<String> occupationsHrs;
  final List<bool>? isCheckList;
  @override
  Widget build(BuildContext context) {
    final List<bool> checkList =
        isCheckList ?? List.generate(occupationsHrs.length, (index) => false);
    return TPrimarySectionLayout(
      child: Column(
        children: [
          const SizedBox(height: TSizes.spaceBtwSections),
          const SizedBox(
            width: double.infinity,
            child: TQuestionHeader(
              text: 'How many hours of work/classes do they have each week ?',
            ),
          ),
          SizedBox(height: TSizes.spaceBtwSections),
          TRadioListAnswerBox(items: occupationsHrs, checkList: checkList, onChanged: (value) {}),
          TSectionFooterButtons(
            onPressed: () => Get.to(const FourthScreenDetail()),
          )
        ],
      ),
    );
  }
}
