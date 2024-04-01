import 'package:app_test/common/form_image/image_header.dart';
import 'package:app_test/common/section/section_header.dart';
import 'package:app_test/common/style/spacing_style.dart';
import 'package:app_test/features/authentication/screens/bloc/auth_bloc_bloc.dart';
import 'package:app_test/features/authentication/screens/create-account/create_account_screen.dart';
import 'package:app_test/utils/constants/colors.dart';
import 'package:app_test/utils/constants/image_strings.dart';
import 'package:app_test/utils/constants/sizes.dart';
import 'package:app_test/utils/constants/text_strings.dart';
import 'package:app_test/utils/theme/widget_themes/custom_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  _SignIn createState() => _SignIn();
}

class _SignIn extends State<SignIn> {
  bool _obscureText = true;
  late final AuthBlocBloc _authBloc;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _authBloc = BlocProvider.of<AuthBlocBloc>(context);
    _authBloc.add(const AuthBlocTypeEvent(AuthType.login));
  }

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
                  const TSectionHeader(text: 'Sign In'),
                  const SizedBox(height: TSizes.defaultSpace),
                  Form(
                    key: _formKey,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: TSizes.spaceBtwSections),
                      child: Column(
                        children: [
                          TextFormField(
                            validator: (value) => value!.isEmpty
                                ? 'Please enter your email'
                                : null,
                            decoration: const InputDecoration(
                                prefixIcon: Icon(Iconsax.direct_right),
                                labelText: TTexts.email),
                            onChanged: (value) => context
                                .read<AuthBlocBloc>()
                                .add(AuthBlocEmailEvent(value)),
                          ),
                          const SizedBox(
                              height: TSizes.spaceBtwInputFields / 2),
                          TextFormField(
                            validator: (value) => value!.isEmpty
                                ? 'Please enter your password'
                                : null,
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
                            child: BlocConsumer<AuthBlocBloc, AuthBlocState>(
                              listener: (context, state) {
                                // TODO: implement listener
                              },
                              builder: (context, state) {
                                return state.status == AuthBlocStatus.loading
                                    ? ElevatedButton(
                                        onPressed: () {},
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: TColors.grey,
                                          side: const BorderSide(
                                              color: TColors.grey),
                                        ),
                                        child: const CircularProgressIndicator(
                                          strokeWidth: 2,
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                                  TColors.white),
                                        ),
                                      )
                                    : ElevatedButton(
                                        onPressed: () {
                                          if (_formKey.currentState
                                                  ?.validate() ??
                                              false) {
                                            context.read<AuthBlocBloc>().add(
                                                  AuthBlocSubmitEvent(
                                                      AuthBlocStatus.loading,
                                                      context),
                                                );
                                          } else {
                                            CustomSnackbar.show(context, 'Add valid inputs', 'Error');
                                          }
                                        },
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: TColors.primary),
                                        child: Text(
                                          TTexts.signIn,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium!
                                              .apply(
                                                color: TColors.white,
                                              ),
                                        ),
                                      );
                              },
                            ),
                          ),
                          const SizedBox(height: TSizes.spaceBtwSections),
                          TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const CreateAccount()));
                              },
                              child: Text('Create Account',
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
