import 'package:app_test/utils/constants/colors.dart';
import 'package:app_test/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class TQuestionHeader extends StatelessWidget {
  const TQuestionHeader({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(TSizes.defaultSpace),
      decoration: BoxDecoration(
          border: Border.all(color: TColors.primary),
          borderRadius: BorderRadius.circular(50),
          color: Colors.transparent),
      child: Center(
        child: Text(
          text,
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .apply(color: TColors.primary),
        ),
      ),
    );
  }
}
