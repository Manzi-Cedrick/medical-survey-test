import 'package:app_test/features/authentication/screens/dob/dob_screen.dart';
import 'package:app_test/features/authentication/screens/login/login_screen.dart';
import 'package:app_test/utils/constants/colors.dart';
import 'package:app_test/utils/constants/sizes.dart';
import 'package:app_test/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:get/get.dart';

class TStructuredForm extends StatelessWidget {
  const TStructuredForm({ super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: TSizes.spaceBtwSections),
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.direct_right),
                labelText: TTexts.email
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwInputFields / 2),
            TextFormField(
              decoration: const InputDecoration(
                  prefixIcon: Icon(Iconsax.password_check),
                  labelText: TTexts.password,
                  suffixIcon: Icon(Iconsax.eye_slash)),
            ),
            const SizedBox(height: TSizes.spaceBtwInputFields / 2),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {}, child: const Text(TTexts.createAccount), style: ElevatedButton.styleFrom(
                    backgroundColor: TColors.primary,
                  ),),
            ),

            const SizedBox(height: TSizes.spaceBtwSections),
            TextButton(onPressed: () => Get.to(const SignIn()), child: Text('Sign In', style: Theme.of(context).textTheme.titleSmall!.apply(color: TColors.primary))),
            const SizedBox(height: TSizes.spaceBtwItems),
            OutlinedButton(onPressed: () =>  Get.to(const DobScreen()), child: Text('Sign up with Phone number', style: Theme.of(context).textTheme.titleSmall!.apply(color: TColors.primary)), style: OutlinedButton.styleFrom(side: const BorderSide(color: TColors.primary)),),
            const SizedBox(height: TSizes.spaceBtwSections),
            TextButton(onPressed: () {}, child: const Text('Forgot your Password'))
          ],
        ),
      ) 
    );
  }
}