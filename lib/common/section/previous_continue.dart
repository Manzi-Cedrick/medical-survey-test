import 'package:app_test/utils/constants/colors.dart';
import 'package:app_test/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class TSectionFooterButtons extends StatelessWidget {
  const TSectionFooterButtons({super.key, required this.onPressed, this.activateDisabled = false});

  final VoidCallback onPressed;
  final bool activateDisabled;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
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
          onPressed: activateDisabled ? null : onPressed ,
          style: ElevatedButton.styleFrom(
              backgroundColor: activateDisabled ? TColors.grey.withOpacity(0.5) : TColors.primary,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              side: BorderSide.none),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: TSizes.lg),
            child: Text(
              'Continue',
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .apply(color: activateDisabled ? TColors.dark : TColors.white),
            ),
          ),
        ),
      ],
    );
  }
}
