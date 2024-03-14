import 'package:app_test/common/form_image/image_header.dart';
import 'package:app_test/common/section/section_header.dart';
import 'package:app_test/common/style/spacing_style.dart';
import 'package:app_test/features/authentication/screens/auth/bloc/auth_bloc_bloc.dart';
import 'package:app_test/features/authentication/screens/auth/login/login_screen.dart';
import 'package:app_test/utils/constants/colors.dart';
import 'package:app_test/utils/constants/image_strings.dart';
import 'package:app_test/utils/constants/sizes.dart';
import 'package:app_test/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';

class CreateAccountWithPhoneNumber extends StatefulWidget {
  const CreateAccountWithPhoneNumber({Key? key}) : super(key: key);

  @override
  _CreateAccountWithPhoneNumber createState() =>
      _CreateAccountWithPhoneNumber();
}

class _CreateAccountWithPhoneNumber
    extends State<CreateAccountWithPhoneNumber> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthBlocBloc, AuthBlocState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return SingleChildScrollView(
            child: Padding(
              padding: TSpacingStyle.paddingWithAppBarHeight,
              child: Column(
                children: [
                  const TImageHeader(image: TImages.onBoardingImage2),
                  const SizedBox(height: TSizes.defaultSpace),
                  const TSectionHeader(
                      text: 'Create Account with Phone Number'),
                  const SizedBox(height: TSizes.defaultSpace),
                  Form(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: TSizes.spaceBtwSections),
                      child: Column(
                        children: [
                          TextFormField(
                            decoration: const InputDecoration(
                                prefixIcon: Icon(Iconsax.call),
                                labelText: 'Telephone Number'),
                            onChanged: (value) => context
                                .read<AuthBlocBloc>()
                                .add(AuthBlocTelephoneEvent(value)),
                          ),
                          const SizedBox(
                              height: TSizes.spaceBtwInputFields / 2),
                          TextFormField(
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Iconsax.password_check),
                              labelText: TTexts.password,
                              suffixIcon: IconButton(
                                icon: Icon(_obscureText
                                    ? Iconsax.eye_slash
                                    : Iconsax.eye),
                                onPressed: () {
                                  setState(() {
                                    _obscureText = !_obscureText;
                                  });
                                },
                              ),
                            ),
                            obscureText: _obscureText,
                            onChanged: (value) => context
                                .read<AuthBlocBloc>()
                                .add(AuthBlocPasswordEvent(value)),
                          ),
                          const SizedBox(
                              height: TSizes.spaceBtwInputFields / 2),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                context.read<AuthBlocBloc>().add(
                                    const AuthBlocSubmitEvent(
                                        AuthBlocStatus.success));
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: TColors.primary,
                              ),
                              child: const Text(
                                  'Create Account with Phone Number'),
                            ),
                          ),
                          const SizedBox(height: TSizes.spaceBtwSections),
                          TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const SignIn()));
                              },
                              child: Text('Sign In',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .apply(color: TColors.primary))),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
