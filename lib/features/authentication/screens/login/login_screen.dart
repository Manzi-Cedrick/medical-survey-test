import 'package:app_test/common/form_image/image_header.dart';
import 'package:app_test/common/section/t_section_header.dart';
import 'package:app_test/common/style/spacing_style.dart';
import 'package:app_test/utils/constants/colors.dart';
import 'package:app_test/utils/constants/image_strings.dart';
import 'package:app_test/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              const TImageHeader(image: TImages.onBoardingImage2),
              const SizedBox(height: TSizes.defaultSpace),
              const TSectionHeader(text: 'Sign In'),
              const SizedBox(height: TSizes.defaultSpace),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.0)),
                        side: const BorderSide(color: TColors.primary)),
                    child: Text(
                      'Username',
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .apply(color: TColors.primary),
                    )),
              ),
              const SizedBox(height: TSizes.defaultSpace),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.0)),
                        side: const BorderSide(
                          color: TColors.primary,
                        )),
                    child: Text(
                      'Password',
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .apply(color: TColors.primary),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
