import 'package:app_test/common/section/primary_section.dart';
import 'package:app_test/features/home/home_screen.dart';
import 'package:app_test/utils/constants/colors.dart';
import 'package:app_test/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class EndSurveyScreen extends StatefulWidget {
  const EndSurveyScreen({super.key});

  @override
  _EndSurveyScreen createState() => _EndSurveyScreen();
}

class _EndSurveyScreen extends State<EndSurveyScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: TPrimarySectionLayout(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              decoration: BoxDecoration(
                  border: Border.all(color: TColors.primary),
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.transparent),
              child: Center(
                child: Column(
                  children: [
                    Text(
                      'Thank you for completing the survey! The answers you provided will develop into data! This data can help administer a better, more personal experience with your AI',
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .apply(color: TColors.primary),
                    ),
                    const SizedBox(height: TSizes.spaceBtwSections),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              horizontal: TSizes.xl, vertical: TSizes.md),
                          textStyle: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .apply(color: TColors.white)),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HomeScreen()));
                      },
                      child: const Text('Go to Home'),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
