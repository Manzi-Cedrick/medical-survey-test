import 'package:app_test/common/style/spacing_style.dart';
import 'package:app_test/utils/constants/colors.dart';
import 'package:app_test/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class DobScreen extends StatelessWidget {
  const DobScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: TSpacingStyle.paddingWithAppBarHeight,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: TSizes.defaultSpace * 1.2),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                      side: const BorderSide(color: TColors.primary)),
                  child: Text(
                    'What is your date of birth ?',
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .apply(color: TColors.primary),
                  )),
            ),
            const SizedBox(height: TSizes.defaultSpace * 2.5),
            InputDatePickerFormField(
              firstDate: DateTime(2019),
              lastDate: DateTime(2020, 12, 12),
              // onDateSubmitted: (date) {},
            ),
          ],
        ),
      ),
    );
  }
}
