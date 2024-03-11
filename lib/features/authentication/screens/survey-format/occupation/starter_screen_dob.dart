import 'package:app_test/common/question-box/question_header.dart';
import 'package:app_test/common/section/previous_continue.dart';
import 'package:app_test/common/section/primary_section.dart';
import 'package:app_test/features/authentication/screens/survey-format/occupation/01_first_screen_occupation.dart';
import 'package:app_test/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DobScreen extends StatelessWidget {
  const DobScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TPrimarySectionLayout(
        child: Column(
          children: [
            const SizedBox(height: TSizes.spaceBtwSections),
            const SizedBox(
              width: double.infinity,
              child: TQuestionHeader(
                text: 'What is your date of birth ?',
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwSections),
            InputDatePickerFormField(
              firstDate: DateTime(2019),
              lastDate: DateTime(2020, 12, 12),
              // onDateSubmitted: (date) {},
            ),
            const SizedBox(height: TSizes.spaceBtwSections),
            TSectionFooterButtons(onPressed: () => Get.to(
              () => const OccupationDetailScreen()
            ))
          ],
        ),
      ),
    );
  }
}