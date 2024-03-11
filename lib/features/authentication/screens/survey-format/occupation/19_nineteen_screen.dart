import 'package:app_test/common/question-box/question_header.dart';
import 'package:app_test/common/section/previous_continue.dart';
import 'package:app_test/common/section/primary_section.dart';
import 'package:app_test/features/authentication/screens/survey-format/occupation/end_survey_screen.dart';
import 'package:app_test/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NineTeenDetailScreen extends StatelessWidget {
  const NineTeenDetailScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return TPrimarySectionLayout(
      child: Column(
        children: [
          const SizedBox(height: TSizes.spaceBtwSections),
          const SizedBox(
            width: double.infinity,
            child: TQuestionHeader(
              text:
                  'Feel free to elaborate on what specific types of prescribed drugs you take to enhance your experience with your AI',
            ),
          ),
          SizedBox(height: TSizes.spaceBtwSections),
          TextFormField(
              maxLines: 5,
              decoration: const InputDecoration(
                  hintText: 'Type here', border: OutlineInputBorder())),
          SizedBox(height: TSizes.spaceBtwSections),
          TSectionFooterButtons(
            onPressed: () => Get.to(const EndSurveyScreen()),
          )
        ],
      ),
    );
  }
}
