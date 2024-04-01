import 'package:app_test/utils/constants/colors.dart';
import 'package:app_test/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class CustomSnackbar {
  static void show(BuildContext context, String message, String? type) {
    final snackBar = SnackBar(
      content: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(50),
          border: Border.all(
            color: type == 'Error'
                ? Colors.red
                : type == 'Warning'
                    ? Colors.yellow
                    : TColors.primary,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Row(
          children: [
            Icon(
                type == 'Error'
                    ? Icons.error_outline
                    : type == 'Warning'
                        ? Icons.warning
                        : Icons.check,
                color: type == 'Error'
                    ? Colors.red
                    : type == 'Warning'
                        ? Colors.yellow
                        : TColors.primary),
            const SizedBox(width: TSizes.spaceBtwItems),
            Text(
              message,
              style: Theme.of(context).textTheme.labelSmall!.apply(
                    color: type == 'Error'
                        ? Colors.red
                        : type == 'Warning'
                            ? Colors.yellow
                            : TColors.primary,
                  ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
      backgroundColor: Colors.transparent,
      elevation: 0, // No elevation
      behavior: SnackBarBehavior.floating,
      duration: const Duration(seconds: 3), // Change duration if needed
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
