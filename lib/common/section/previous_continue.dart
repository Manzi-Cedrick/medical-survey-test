import 'package:app_test/utils/constants/colors.dart';
import 'package:app_test/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TSectionFooterButtons extends StatelessWidget {
  const TSectionFooterButtons({super.key, required this.onPressed});

  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ElevatedButton(
          onPressed: () => Get.back(),
          style: ElevatedButton.styleFrom(
              backgroundColor: TColors.lightGrey,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              side: const BorderSide(color: Colors.transparent)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: TSizes.lg),
            child: Text(
              'Previous',
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .apply(color: TColors.textSecondary),
            ),
          ),
        ),
        ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
              backgroundColor: TColors.primary,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              side: const BorderSide(color: Colors.transparent)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: TSizes.lg),
            child: Text(
              'Continue',
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .apply(color: TColors.white),
            ),
          ),
        ),
      ],
    );
  }
}
