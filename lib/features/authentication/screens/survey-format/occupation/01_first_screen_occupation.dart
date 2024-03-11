import 'package:app_test/common/question-box/question_header.dart';
import 'package:app_test/common/answer-box/checklist_answerbox_structure.dart';
import 'package:app_test/common/section/previous_continue.dart';
import 'package:app_test/common/section/primary_section.dart';
import 'package:app_test/features/authentication/screens/survey-format/occupation/02_second_screen_hour.dart';
import 'package:app_test/utils/constants/api_constants.dart';
import 'package:app_test/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OccupationDetailScreen extends StatelessWidget {
  const OccupationDetailScreen({Key? key, this.isCheckList}) : super(key: key);

  final List<bool>? isCheckList;

  @override
  Widget build(BuildContext context) {
    final List<bool> checkList =
        isCheckList ?? List.generate(occupations.length, (index) => false);

    return Scaffold(
      body: TPrimarySectionLayout(
        child: Column(
          children: [
            const SizedBox(height: TSizes.spaceBtwSections),
            const SizedBox(
              width: double.infinity,
              child: TQuestionHeader(
                text: 'What is your occupations ?',
              ),
            ),
            TCheckListAnswerBox(items: occupations, checkList: checkList, onChanged: (value) {} ),
            TSectionFooterButtons(
              onPressed: () => Get.to(const SecondHourDetailScreen()),
            )
          ],
        ),
      ),
    );
  }
}
