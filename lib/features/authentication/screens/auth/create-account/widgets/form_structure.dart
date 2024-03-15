import 'package:app_test/features/authentication/screens/auth/bloc/auth_bloc_bloc.dart';
import 'package:app_test/features/authentication/screens/auth/create-account-phonenumber/create_account_phone_number.dart';
import 'package:app_test/features/authentication/screens/auth/login/login_screen.dart';
import 'package:app_test/features/authentication/screens/survey-format/occupation/starter_screen_dob.dart';
import 'package:app_test/utils/constants/colors.dart';
import 'package:app_test/utils/constants/sizes.dart';
import 'package:app_test/utils/constants/text_strings.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';

class TStructuredForm extends StatefulWidget {
  const TStructuredForm({Key? key}) : super(key: key);

  @override
  _TStructuredFormState createState() => _TStructuredFormState();
}

class _TStructuredFormState extends State<TStructuredForm> {
  bool _obscureText = true;
  final _formKey = GlobalKey<FormState>();

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty || !EmailValidator.validate(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty || value.length < 6) {
      return 'Please enter your password with at least 6 characters';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBlocBloc, AuthBlocState>(
      listener: (context, state) {
        print(state);
        if (state.status == AuthBlocStatus.success &&
            _formKey.currentState!.validate()) {
          _formKey.currentState!.reset();
          context.read<AuthBlocBloc>().add(const AuthBlocStartEvent());
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const DobScreen()),
          );
        }
      },
      builder: (context, state) {
        return Form(
          key: _formKey,
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: TSizes.spaceBtwSections),
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Iconsax.direct_right),
                      labelText: TTexts.email),
                  validator: validateEmail,
                  // autovalidateMode: AutovalidateMode.onUserInteraction,
                  onChanged: (value) => context.read<AuthBlocBloc>().add(
                        AuthBlocEmailEvent(value),
                      ),
                ),
                const SizedBox(height: TSizes.spaceBtwInputFields / 2),
                TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Iconsax.password_check),
                    labelText: TTexts.password,
                    suffixIcon: IconButton(
                      icon:
                          Icon(_obscureText ? Iconsax.eye_slash : Iconsax.eye),
                      onPressed: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                    ),
                  ),
                  obscureText: _obscureText,
                  validator: (value) {
                    var passNonNullValue = value ?? "";
                    if (passNonNullValue.length < 6) {
                      return ("Password Must be more than 6 characters long");
                    }
                    return null;
                  },
                  // autovalidateMode: AutovalidateMode.onUserInteraction,
                  onChanged: (value) => context
                      .read<AuthBlocBloc>()
                      .add(AuthBlocPasswordEvent(value)),
                ),
                const SizedBox(height: TSizes.spaceBtwInputFields / 2),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        context.read<AuthBlocBloc>().add(
                              const AuthBlocSubmitEvent(AuthBlocStatus.success),
                            );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: TColors.primary),
                    child: Text(
                      TTexts.createAccount,
                      style: Theme.of(context).textTheme.bodyMedium!.apply(
                            color: TColors.white,
                          ),
                    ),
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
                const SizedBox(height: TSizes.spaceBtwItems),
                OutlinedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const CreateAccountWithPhoneNumber()));
                  },
                  style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: TColors.primary)),
                  child: Text('Continue with PhoneNumber',
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .apply(color: TColors.primary)),
                ),
                const SizedBox(height: TSizes.spaceBtwSections),
                TextButton(
                    onPressed: () {}, child: const Text('Forgot your Password'))
              ],
            ),
          ),
        );
      },
    );
  }
}
